import 'package:flutter/material.dart';

/// Design tokens — gesynchroniseerd vanuit flutter-ui-refresh Lovable prototype.
/// Last synced: 2026-03-06
abstract final class AppColors {
  // ── Core surfaces ──────────────────────────────────────────────────────────

  static const Color background = Color(0xFFFCFDFE);
  static const Color foreground = Color(0xFF161B26);
  static const Color card = Color(0xFFFFFFFF);
  static const Color surfaceElevated = Color(0xFFFFFFFF);
  static const Color surfaceSunken = Color(0xFFF5F7F9);

  // ── Brand: Professional blue ───────────────────────────────────────────────

  static const Color primary = Color(0xFF2463EB);
  static const Color primaryForeground = Color(0xFFFFFFFF);

  // ── Secondary ─────────────────────────────────────────────────────────────

  static const Color secondary = Color(0xFFEEF1F5);
  static const Color secondaryForeground = Color(0xFF333D4D);

  // ── Muted ─────────────────────────────────────────────────────────────────

  static const Color muted = Color(0xFFF0F2F5);
  static const Color mutedForeground = Color(0xFF707A8A);

  // ── Accent ────────────────────────────────────────────────────────────────

  static const Color accent = Color(0xFFE8F1FE);
  static const Color accentForeground = Color(0xFF1D54C9);

  // ── Destructive / Error ───────────────────────────────────────────────────

  static const Color destructive = Color(0xFFE5393F);
  static const Color destructiveForeground = Color(0xFFFFFFFF);

  // ── Success ───────────────────────────────────────────────────────────────

  static const Color success = Color(0xFF2BA366);
  static const Color successForeground = Color(0xFFFFFFFF);

  // ── Warning ───────────────────────────────────────────────────────────────

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningForeground = Color(0xFFFFFFFF);

  // ── Borders ───────────────────────────────────────────────────────────────

  static const Color border = Color(0xFFDEE2E8);
  static const Color inputBorder = Color(0xFFDEE2E8);

  // ── Text hierarchy ────────────────────────────────────────────────────────

  static const Color textPrimary = Color(0xFF161B26);
  static const Color textSecondary = Color(0xFF626C7A);
  static const Color textTertiary = Color(0xFF8E96A3);

  // ── Shift kleuren ─────────────────────────────────────────────────────────

  static const Color shiftMorning = Color(0xFFF59E0B);    // ochtend — amber
  static const Color shiftAfternoon = Color(0xFF2463EB);  // middag — blauw
  static const Color shiftNight = Color(0xFF7C3AED);      // nacht — paars
  static const Color shiftFree = Color(0xFF2BA366);       // vrij — groen
  static const Color shiftLeave = Color(0xFFE87724);      // verlof — oranje
  static const Color shiftSick = Color(0xFFE5393F);       // ziek — rood

  // ── Default / StaffApp branding ───────────────────────────────────────────

  static const Color defaultPrimary = Color(0xFF2463EB);
  static const Color defaultSecondary = Color(0xFFEEF1F5);
  static const Color defaultAccent = Color(0xFFE8F1FE);

  // ── Adecco branding override ──────────────────────────────────────────────

  static const Color adeccoPrimary = Color(0xFFC90031);    // Adecco rood
  static const Color adeccoSecondary = Color(0xFFF5E8EC);
  static const Color adeccoAccent = Color(0xFFFDE8EE);

  // ── Helpers ───────────────────────────────────────────────────────────────

  /// Retourneert de kleur voor een shift-bevestigingsstatus.
  ///
  /// Mapping van API `ConfirmationStatus`:
  ///   `1` = bevestigd (groen), `2` = geannuleerd (rood),
  ///   `3` = pending (amber), overige = gepland (blauw).
  static Color forShiftStatus(int? status) => switch (status) {
    1 => shiftFree,
    2 => shiftSick,
    3 => shiftMorning,
    _ => shiftAfternoon,
  };
}
