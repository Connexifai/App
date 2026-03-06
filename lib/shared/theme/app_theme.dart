import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

export 'app_colors.dart';
export 'app_typography.dart';

/// The Planbition design system.
///
/// Provides Material 3 [ThemeData] for light and dark modes.
///
/// **Branding toggle:**
/// ```dart
/// // Default Planbition brand (blue)
/// AppTheme.light()
///
/// // Adecco brand (orange #EE7203 + dark blue #003DA5)
/// AppTheme.light(adecco: true)
/// ```
///
/// The [seedColor] parameter overrides the brand seed entirely — useful for
/// per-tenant dynamic branding fetched from the `/Branding` API endpoint.
abstract final class AppTheme {
  // ── Public factory methods ─────────────────────────────────────────────────

  /// Creates the light [ThemeData].
  ///
  /// Set [adecco] = `true` to activate the Adecco brand palette.
  /// An explicit [seedColor] always takes precedence over [adecco].
  static ThemeData light({bool adecco = false, Color? seedColor}) {
    final seed = seedColor ?? AppColors.primarySeed(adecco: adecco);
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
      surface: AppColors.surfaceLight,
      secondary: adecco ? AppColors.adeccoSecondary : null,
    );
    final text = AppTypography.buildTextTheme(scheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: text,
      scaffoldBackgroundColor: AppColors.surfaceLight,
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
  ///
  /// Set [adecco] = `true` to activate the Adecco brand palette.
  /// An explicit [seedColor] always takes precedence over [adecco].
  static ThemeData dark({bool adecco = false, Color? seedColor}) {
    final seed = seedColor ?? AppColors.primarySeed(adecco: adecco);
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
      surface: AppColors.cardDark,
      secondary: adecco ? AppColors.adeccoSecondary : null,
    );
    final text = AppTypography.buildTextTheme(scheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: text,
      scaffoldBackgroundColor: AppColors.surfaceDark,
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

  // ── Component themes ───────────────────────────────────────────────────────

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
          textStyle: AppTypography.button(),
        ),
      );

  static FilledButtonThemeData _filledButtonTheme(ColorScheme colors) =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTypography.button(),
        ),
      );

  static AppBarTheme _appBarTheme(ColorScheme colors) => AppBarTheme(
    backgroundColor: colors.surface,
    foregroundColor: colors.onSurface,
    elevation: 0,
    scrolledUnderElevation: 1,
    shadowColor: colors.shadow.withValues(alpha: 0.1),
    centerTitle: false,
    titleTextStyle: AppTypography.appBarTitle(colors.onSurface),
  );

  static NavigationBarThemeData _navBarTheme(ColorScheme colors) =>
      NavigationBarThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        shadowColor: colors.shadow.withValues(alpha: 0.1),
        indicatorColor: colors.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return AppTypography.navLabel(selected: isSelected);
        }),
      );

  static SnackBarThemeData _snackBarTheme(ColorScheme colors) =>
      SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: colors.inverseSurface,
        contentTextStyle: AppTypography.snackBar(colors.onInverseSurface),
      );

  static ChipThemeData _chipTheme(ColorScheme colors) => ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    labelStyle: AppTypography.chip(),
  );
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
