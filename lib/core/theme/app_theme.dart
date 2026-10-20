import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Construye el ThemeData claro/oscuro a partir de la paleta de marca.
///
/// Cada tema registra su [AppColors] como extensión, así los widgets leen los
/// tokens correctos según el modo activo sin saber en cuál están.
class AppTheme {
  const AppTheme._();

  static ThemeData light() => _build(AppColors.light, Brightness.light);
  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: c.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: c.accent,
        brightness: brightness,
      ).copyWith(surface: c.surface),
      extensions: [c],
      textTheme: base.textTheme.apply(
        bodyColor: c.fg,
        displayColor: c.fg,
        fontFamily: AppTypography.body(14, c.fg).fontFamily,
      ),
      dividerColor: c.border,
    );
  }
}
