import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../auth/session_model.dart';
import '../../auth/token_storage.dart';
import '../api_constants.dart';

/// Dio interceptor that injects authentication and tenant headers into every
/// request, and handles automatic token refresh on 401 responses.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.tokenStorage,
    required this.dio,
    required this.onSessionExpired,
  });

  final TokenStorage tokenStorage;
  final Dio dio;

  /// Called when the refresh token has expired and the user must re-authenticate.
  final Future<void> Function() onSessionExpired;

  final _logger = Logger();

  // Guard against concurrent refresh calls.
  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})>
  _pendingRequests = [];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final session = await tokenStorage.getSession();
    if (session != null) {
      _injectHeaders(options, session);
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final session = await tokenStorage.getSession();
    if (session == null || session.isRefreshTokenExpired) {
      await onSessionExpired();
      return handler.next(err);
    }

    if (_isRefreshing) {
      // Queue the request to retry after refresh completes.
      _pendingRequests.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      final refreshed = await _refreshToken(session);
      await tokenStorage.saveSession(refreshed);
      _retryPendingRequests(refreshed);
      final response = await _retryRequest(err.requestOptions, refreshed);
      handler.resolve(response);
    } catch (e) {
      _logger.e('Token refresh failed', error: e);
      _failPendingRequests(err);
      await onSessionExpired();
      handler.next(err);
    } finally {
      _isRefreshing = false;
      _pendingRequests.clear();
    }
  }

  void _injectHeaders(RequestOptions options, SessionModel session) {
    options.headers[ApiHeaders.authorization] =
        'Bearer ${session.accessToken}';
    options.headers[ApiHeaders.apiVersion] = ApiConstants.apiVersion;
    options.headers[ApiHeaders.tenantIdentity] = session.tenantIdentity;
    if (session.userIdentity.isNotEmpty) {
      options.headers[ApiHeaders.userIdentity] = session.userIdentity;
    }
    options.headers[ApiHeaders.timestamp] =
        _nowTimestamp();
  }

  String _nowTimestamp() {
    final now = DateTime.now().toLocal();
    final offset = now.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hh = offset.inHours.abs().toString().padLeft(2, '0');
    final mm = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final base =
        '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}T'
        '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}:'
        '${now.second.toString().padLeft(2, '0')}.00';
    return '$base$sign$hh:$mm';
  }

  Future<SessionModel> _refreshToken(SessionModel current) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/Auth/oauth/token',
      data: {
        'grant_type': OAuthGrantType.refreshToken,
        'client_id': current.clientId,
        'refresh_token': current.refreshToken,
      },
      options: Options(
        headers: {
          ApiHeaders.tenantIdentity: current.tenantIdentity,
          ApiHeaders.apiVersion: ApiConstants.apiVersion,
          ApiHeaders.timestamp: _nowTimestamp(),
          ApiHeaders.contentType: ApiConstants.contentType,
        },
        // Skip auth interceptor for the refresh call to avoid infinite loop.
        extra: {'skipAuthInterceptor': true},
      ),
    );

    final data = response.data!;
    final now = DateTime.now().toUtc();
    return current.copyWith(
      accessToken: data['access_token'] as String,
      refreshToken: data['refresh_token'] as String,
      accessTokenExpiresAt:
          now.add(Duration(seconds: data['expires_in'] as int)),
      refreshTokenExpiresAt: now.add(
        Duration(seconds: data['refresh_token_expires_in'] as int),
      ),
    );
  }

  void _retryPendingRequests(SessionModel session) {
    for (final pending in _pendingRequests) {
      _injectHeaders(pending.options, session);
      dio
          .fetch<dynamic>(pending.options)
          .then(pending.handler.resolve)
          .catchError(
            (Object e) => pending.handler.next(e as DioException),
          );
    }
  }

  void _failPendingRequests(DioException error) {
    for (final pending in _pendingRequests) {
      pending.handler.next(error);
    }
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions options,
    SessionModel session,
  ) async {
    _injectHeaders(options, session);
    return dio.fetch<dynamic>(options);
  }
}
