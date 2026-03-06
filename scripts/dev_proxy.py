#!/usr/bin/env python3
"""
Planbition dev proxy.

Serves the Flutter web build (build/web/) and proxies API requests to the
backend, so the browser never sees a cross-origin error.

Routing rules:
  1. Paths starting with /[A-Z]  →  proxy to backend API
  2. Known static extensions     →  serve from build/web/
  3. Anything else (Flutter SPA) →  serve build/web/index.html

Usage (from planbition_app/ directory):
    python scripts/dev_proxy.py
"""

import http.server
import urllib.request
import urllib.error
import mimetypes
import os
import re

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
BACKEND = "https://mobile-api.planbition.nl"
# Resolve build/web relative to the script location (scripts/../build/web)
_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
STATIC_DIR = os.path.normpath(os.path.join(_SCRIPT_DIR, "..", "build", "web"))
PORT = 8080

# API paths on this backend always start with an uppercase letter,
# e.g. /Auth/oauth/token, /Dashboard/firstshifts, /Calendar/...
_API_RE = re.compile(r"^/[A-Z]")

# Headers we strip when forwarding the browser request to the backend.
SKIP_REQUEST_HEADERS = {
    "host", "origin", "referer",
    "content-length",   # will be recomputed
    "accept-encoding",  # prevent gzip so we don't have to decompress
}
# Headers we drop from the backend response before forwarding to the browser.
SKIP_RESPONSE_HEADERS = {
    "transfer-encoding",
    "content-encoding",  # dropped because we disabled accept-encoding above
    "content-length",    # will be recomputed from actual body
}


# ---------------------------------------------------------------------------
# Handler
# ---------------------------------------------------------------------------
class PlanbitionProxy(http.server.BaseHTTPRequestHandler):

    # ------------------------------------------------------------------
    # HTTP verbs
    # ------------------------------------------------------------------

    def do_OPTIONS(self):
        self.send_response(200)
        self._cors()
        self.end_headers()

    def do_GET(self):
        self._handle("GET")

    def do_POST(self):
        self._handle("POST")

    def do_PUT(self):
        self._handle("PUT")

    def do_DELETE(self):
        self._handle("DELETE")

    def do_PATCH(self):
        self._handle("PATCH")

    # ------------------------------------------------------------------
    # Routing
    # ------------------------------------------------------------------

    def _handle(self, method: str):
        raw_path = self.path.split("?")[0].split("#")[0]

        # 1. API call → proxy to backend
        if _API_RE.match(raw_path):
            self._proxy(method)
            return

        # 2. Only GET can serve static / SPA
        if method != "GET":
            self._send_simple(405, "Method not allowed")
            return

        # 3. Try to serve exact static file from build/web/
        file_path = os.path.normpath(
            os.path.join(STATIC_DIR, raw_path.lstrip("/"))
        )
        if os.path.isdir(file_path):
            file_path = os.path.join(file_path, "index.html")

        # Security: don't allow path traversal outside STATIC_DIR
        if not file_path.startswith(STATIC_DIR):
            self._send_simple(403, "Forbidden")
            return

        if os.path.isfile(file_path):
            self._serve_static(file_path)
            return

        # 4. SPA fallback → index.html (Flutter handles routing client-side)
        index = os.path.join(STATIC_DIR, "index.html")
        if os.path.isfile(index):
            self._serve_static(index)
        else:
            self._send_simple(
                503,
                "Flutter web build not found. Run: "
                "flutter build web --release "
                "--dart-define=API_URL=http://localhost:8080",
            )

    # ------------------------------------------------------------------
    # Static file serving
    # ------------------------------------------------------------------

    def _serve_static(self, path: str):
        try:
            with open(path, "rb") as f:
                data = f.read()
            mime, _ = mimetypes.guess_type(path)
            self.send_response(200)
            self.send_header("Content-Type", mime or "application/octet-stream")
            self.send_header("Content-Length", str(len(data)))
            self.send_header("Cache-Control", "no-cache")
            self._cors()
            self.end_headers()
            self.wfile.write(data)
        except Exception as exc:
            self._send_simple(500, f"Error: {exc}")

    # ------------------------------------------------------------------
    # Reverse proxy
    # ------------------------------------------------------------------

    def _proxy(self, method: str):
        target = BACKEND + self.path
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length) if length > 0 else None

        fwd_headers = {
            k: v
            for k, v in self.headers.items()
            if k.lower() not in SKIP_REQUEST_HEADERS
        }
        if body:
            fwd_headers["Content-Length"] = str(len(body))

        try:
            req = urllib.request.Request(
                target, data=body, headers=fwd_headers, method=method
            )
            with urllib.request.urlopen(req, timeout=30) as resp:
                resp_body = resp.read()
                self.send_response(resp.status)
                for k, v in resp.headers.items():
                    if k.lower() not in SKIP_RESPONSE_HEADERS:
                        self.send_header(k, v)
                self.send_header("Content-Length", str(len(resp_body)))
                self._cors()
                self.end_headers()
                self.wfile.write(resp_body)

        except urllib.error.HTTPError as exc:
            resp_body = exc.read()
            self.send_response(exc.code)
            for k, v in exc.headers.items():
                if k.lower() not in SKIP_RESPONSE_HEADERS:
                    self.send_header(k, v)
            self.send_header("Content-Length", str(len(resp_body)))
            self._cors()
            self.end_headers()
            self.wfile.write(resp_body)

        except Exception as exc:
            msg = f"Proxy error: {exc}".encode()
            self.send_response(502)
            self.send_header("Content-Type", "text/plain")
            self.send_header("Content-Length", str(len(msg)))
            self._cors()
            self.end_headers()
            self.wfile.write(msg)

    # ------------------------------------------------------------------
    # CORS headers (added to all responses)
    # ------------------------------------------------------------------

    def _cors(self):
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header(
            "Access-Control-Allow-Methods",
            "GET, POST, PUT, DELETE, PATCH, OPTIONS",
        )
        self.send_header(
            "Access-Control-Allow-Headers",
            "Content-Type, Authorization, X-Tenant-Identity, "
            "X-Api-Version, X-Timestamp, X-User-Identity, Accept",
        )
        self.send_header("Access-Control-Max-Age", "86400")

    # ------------------------------------------------------------------
    # Helpers
    # ------------------------------------------------------------------

    def _send_simple(self, code: int, msg: str):
        data = msg.encode()
        self.send_response(code)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def log_message(self, fmt, *args):
        print(f"[proxy] {self.address_string()} {fmt % args}", flush=True)


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    if not os.path.isdir(STATIC_DIR):
        print(
            f"[proxy] WARNING: static dir not found: {STATIC_DIR}\n"
            f"[proxy] Run first: flutter build web --release "
            f"--dart-define=API_URL=http://localhost:{PORT}",
            flush=True,
        )

    print(
        f"[proxy] Listening  http://localhost:{PORT}\n"
        f"[proxy] Static     {STATIC_DIR}\n"
        f"[proxy] API proxy  {BACKEND}",
        flush=True,
    )

    server = http.server.HTTPServer(("", PORT), PlanbitionProxy)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n[proxy] Stopped.", flush=True)
