import 'package:flutter/material.dart';

/// All color tokens for the Planbition design system.
///
/// Organised into:
/// - **Planbition brand** — default palette
/// - **Adecco brand** — optional branding override (use via [AppTheme] `adecco` flag)
/// - **Surfaces** — background and card colors for light/dark mode
/// - **Semantic** — success, warning, error, info
/// - **Shift status** — per-shift confirmation state (derived from internal Report colors)
/// - **Shift type** — per-shift kind/category
abstract final class AppColors {
  // ── Planbition brand ───────────────────────────────────────────────────────

  /// Primary brand blue — default seed for [ColorScheme.fromSeed].
  static const Color planbitionPrimary = Color(0xFF2563EB);

  /// Darker shade used for pressed/hover states.
  static const Color planbitionPrimaryDark = Color(0xFF1D4ED8);

  /// Secondary accent teal.
  static const Color planbitionAccent = Color(0xFF0891B2);

  // ── Adecco brand override ─────────────────────────────────────────────────

  /// Adecco primary orange — replaces seed color when `adecco: true`.
  static const Color adeccoPrimary = Color(0xFFEE7203);

  /// Adecco secondary dark blue — used as secondary/container accent.
  static const Color adeccoSecondary = Color(0xFF003DA5);

  // ── Surfaces ──────────────────────────────────────────────────────────────

  /// Scaffold background for light mode.
  static const Color surfaceLight = Color(0xFFF8FAFC);

  /// Card / sheet background for light mode.
  static const Color cardLight = Color(0xFFFFFFFF);

  /// Scaffold background for dark mode.
  static const Color surfaceDark = Color(0xFF0F172A);

  /// Card / sheet background for dark mode.
  static const Color cardDark = Color(0xFF1E293B);

  // ── Semantic ──────────────────────────────────────────────────────────────

  /// Positive confirmation, present, success state.
  static const Color success = Color(0xFF16A34A);

  /// Warning, caution, non-critical alert.
  static const Color warning = Color(0xFFD97706);

  /// Error, critical, cancelled state.
  static const Color error = Color(0xFFDC2626);

  /// Informational, neutral highlight.
  static const Color info = Color(0xFF0891B2);

  // ── Shift STATUS kleuren ───────────────────────────────────────────────────
  //
  // Derived from the internal workforce reporting tool (Report colors.xlsx):
  //   • Green  #008000  → confirmed / present  (softened to #16A34A)
  //   • Red    #FF0000  → cancelled / problem   (softened to #DC2626)
  //   • Amber  #FFD700  → pending / sick        (softened to #D97706)
  //   • Blue            → planned (new token)

  /// Shift is scheduled but not yet confirmed by the employee.
  static const Color shiftPlanned = Color(0xFF3B82F6);

  /// Shift confirmed — employee has accepted.
  static const Color shiftConfirmed = Color(0xFF16A34A);

  /// Shift cancelled or declined.
  static const Color shiftCancelled = Color(0xFFDC2626);

  /// Shift awaiting action — pending confirmation or sick/absent notification.
  static const Color shiftPending = Color(0xFFD97706);

  // ── Shift TYPE kleuren ─────────────────────────────────────────────────────

  /// Regular fixed contract shift.
  static const Color shiftRegular = Color(0xFF2563EB);

  /// On-call / flex shift.
  static const Color shiftOnCall = Color(0xFF9333EA);

  /// Marketplace open shift.
  static const Color shiftMarketplace = Color(0xFF0891B2);

  /// Absence / leave / verlof.
  static const Color shiftAbsence = Color(0xFFEA580C);

  // ── Helpers ────────────────────────────────────────────────────────────────

  /// Returns the primary seed color for [ColorScheme.fromSeed].
  ///
  /// Pass [adecco] = `true` to activate Adecco brand colors.
  static Color primarySeed({bool adecco = false}) =>
      adecco ? adeccoPrimary : planbitionPrimary;

  /// Returns the [Color] that represents a shift confirmation [status].
  ///
  /// [status] values map to the API's `ConfirmationStatus` field:
  ///   `0` = planned, `1` = confirmed, `2` = cancelled, `3` = pending.
  static Color forShiftStatus(int? status) => switch (status) {
    1 => shiftConfirmed,
    2 => shiftCancelled,
    3 => shiftPending,
    _ => shiftPlanned,
  };
}
