import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography tokens for the Planbition design system.
///
/// Uses **Inter** (via `google_fonts`) throughout for a clean, modern look.
/// All methods are static so they can be called from [AppTheme] without
/// instantiation.
abstract final class AppTypography {
  // ── Text theme ─────────────────────────────────────────────────────────────

  /// Builds a full [TextTheme] with Inter as the base typeface.
  ///
  /// Colors are derived from the provided [ColorScheme] so the theme adapts
  /// automatically to light and dark modes.
  static TextTheme buildTextTheme(ColorScheme colors) {
    final base = GoogleFonts.interTextTheme();
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: colors.onSurface,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: colors.onSurface,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: colors.onSurface,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
      ),
      bodyLarge: base.bodyLarge?.copyWith(color: colors.onSurface),
      bodyMedium: base.bodyMedium?.copyWith(color: colors.onSurface),
      bodySmall: base.bodySmall?.copyWith(
        color: colors.onSurface.withValues(alpha: 0.7),
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }

  // ── Component-specific text styles ─────────────────────────────────────────

  /// Inter SemiBold 15 px — for elevated and filled buttons.
  static TextStyle button() =>
      GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 15);

  /// Inter Bold 20 px — for [AppBar] titles.
  static TextStyle appBarTitle(Color color) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: color,
  );

  /// Inter 11 px — for [NavigationBar] destination labels.
  ///
  /// Weight is SemiBold when the destination is [selected], Regular otherwise.
  static TextStyle navLabel({required bool selected}) => GoogleFonts.inter(
    fontSize: 11,
    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
  );

  /// Inter Medium 13 px — for [Chip] labels.
  static TextStyle chip() =>
      GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500);

  /// Inter Regular — for [SnackBar] body text.
  static TextStyle snackBar(Color color) => GoogleFonts.inter(color: color);
}
