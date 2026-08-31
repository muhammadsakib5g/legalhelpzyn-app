import 'package:flutter/material.dart';

/// Brand palette, sampled directly from the LegalHelpzyn logo.
///
/// Keep these in sync with the website's theme tokens in the `legalhelpzyn`
/// Laravel repo so the app and the site read as one product.
abstract final class BrandColors {
  /// Logo orange — primary action colour.
  static const orange = Color(0xFFFA6704);

  /// Logo navy — headings, surfaces, and the dark brand ground.
  static const navy = Color(0xFF084064);

  static const navyDeep = Color(0xFF052E48);
  static const navySoft = Color(0xFF0E5480);
  static const orangeSoft = Color(0xFFFF8534);

  static const ink = Color(0xFF0B1B26);
  static const muted = Color(0xFF5B7183);
  static const surface = Color(0xFFF7F9FB);
}

/// Single source of truth for app theming.
abstract final class BrandTheme {
  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: BrandColors.navy,
      primary: BrandColors.navy,
      secondary: BrandColors.orange,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: BrandColors.surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: BrandColors.navy,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: BrandColors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
