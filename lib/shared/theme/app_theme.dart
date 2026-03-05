import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The Planbition design system.
///
/// Provides Material 3 [ThemeData] for light and dark modes with a
/// professional, clean aesthetic using an 8-point spacing grid.
abstract final class AppTheme {
  // ---------------------------------------------------------------------------
  // Brand colours
  // ---------------------------------------------------------------------------

  /// Primary brand blue — used for primary actions and active states.
  static const Color primaryBlue = Color(0xFF2563EB);

  /// Darker shade for pressed/hover states.
  static const Color primaryBlueDark = Color(0xFF1D4ED8);

  /// Accent teal — used for secondary highlights.
  static const Color accentTeal = Color(0xFF0891B2);

  /// Neutral background for light mode.
  static const Color surfaceLight = Color(0xFFF8FAFC);

  /// Card background for light mode.
  static const Color cardLight = Color(0xFFFFFFFF);

  /// Neutral background for dark mode.
  static const Color surfaceDark = Color(0xFF0F172A);

  /// Card background for dark mode.
  static const Color cardDark = Color(0xFF1E293B);

  /// Success green.
  static const Color success = Color(0xFF16A34A);

  /// Warning amber.
  static const Color warning = Color(0xFFD97706);

  /// Error red.
  static const Color error = Color(0xFFDC2626);

  // ---------------------------------------------------------------------------
  // Typography
  // ---------------------------------------------------------------------------

  static TextTheme _buildTextTheme(ColorScheme colors) {
    final base = GoogleFonts.outfitTextTheme();
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

  // ---------------------------------------------------------------------------
  // Component themes
  // ---------------------------------------------------------------------------

  static CardThemeData _cardTheme(ColorScheme colors) => CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(
        color: colors.outlineVariant.withValues(alpha: 0.5),
      ),
    ),
    color: colors.surface,
    margin: EdgeInsets.zero,
  );

  static InputDecorationTheme _inputTheme(ColorScheme colors) =>
      InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceContainerHighest.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colors.outline.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: TextStyle(
          color: colors.onSurface.withValues(alpha: 0.4),
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colors) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      );

  static FilledButtonThemeData _filledButtonTheme(ColorScheme colors) =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      );

  static AppBarTheme _appBarTheme(ColorScheme colors) => AppBarTheme(
    backgroundColor: colors.surface,
    foregroundColor: colors.onSurface,
    elevation: 0,
    scrolledUnderElevation: 1,
    shadowColor: colors.shadow.withValues(alpha: 0.1),
    centerTitle: false,
    titleTextStyle: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: colors.onSurface,
    ),
  );

  static NavigationBarThemeData _navBarTheme(ColorScheme colors) =>
      NavigationBarThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        shadowColor: colors.shadow.withValues(alpha: 0.1),
        indicatorColor: colors.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return GoogleFonts.outfit(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          );
        }),
      );

  static SnackBarThemeData _snackBarTheme(ColorScheme colors) =>
      SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: colors.inverseSurface,
        contentTextStyle: GoogleFonts.outfit(color: colors.onInverseSurface),
      );

  static ChipThemeData _chipTheme(ColorScheme colors) => ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    labelStyle: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w500),
  );

  // ---------------------------------------------------------------------------
  // Public factory methods
  // ---------------------------------------------------------------------------

  /// Creates the light [ThemeData].
  static ThemeData light({Color? seedColor}) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor ?? primaryBlue,
      brightness: Brightness.light,
      surface: surfaceLight,
    );
    final text = _buildTextTheme(scheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: text,
      scaffoldBackgroundColor: surfaceLight,
      cardTheme: _cardTheme(scheme),
      inputDecorationTheme: _inputTheme(scheme),
      elevatedButtonTheme: _elevatedButtonTheme(scheme),
      filledButtonTheme: _filledButtonTheme(scheme),
      appBarTheme: _appBarTheme(scheme),
      navigationBarTheme: _navBarTheme(scheme),
      snackBarTheme: _snackBarTheme(scheme),
      chipTheme: _chipTheme(scheme),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant.withValues(alpha: 0.5),
        thickness: 1,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }

  /// Creates the dark [ThemeData].
  static ThemeData dark({Color? seedColor}) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor ?? primaryBlue,
      brightness: Brightness.dark,
      surface: cardDark,
    );
    final text = _buildTextTheme(scheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: text,
      scaffoldBackgroundColor: surfaceDark,
      cardTheme: _cardTheme(scheme),
      inputDecorationTheme: _inputTheme(scheme),
      elevatedButtonTheme: _elevatedButtonTheme(scheme),
      filledButtonTheme: _filledButtonTheme(scheme),
      appBarTheme: _appBarTheme(scheme),
      navigationBarTheme: _navBarTheme(scheme),
      snackBarTheme: _snackBarTheme(scheme),
      chipTheme: _chipTheme(scheme),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant.withValues(alpha: 0.3),
        thickness: 1,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}

/// Spacing constants following an 8-point grid.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Border radius constants.
abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 999;
}
