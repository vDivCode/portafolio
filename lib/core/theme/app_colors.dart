import 'package:flutter/material.dart';

/// Paleta de la marca como ThemeExtension.
///
/// Patrón: en vez de esparcir `Color(0xFF...)` por toda la app, definimos los
/// tokens una sola vez (claro y oscuro) y los leemos con
/// `Theme.of(context).extension<AppColors>()!`. Si mañana cambias el acento,
/// lo cambias aquí y se propaga a todo.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.fg,
    required this.muted,
    required this.border,
    required this.accent,
    required this.accentSoft,
    required this.accentFg,
  });

  final Color bg; // fondo general
  final Color surface; // tarjetas
  final Color surface2; // superficies secundarias
  final Color fg; // texto principal
  final Color muted; // texto secundario
  final Color border; // bordes
  final Color accent; // ámbar de marca
  final Color accentSoft; // acento translúcido (fondos de chips "hot")
  final Color accentFg; // texto sobre el acento

  /// Tema claro — espejo de las variables :root del index.html original.
  static const light = AppColors(
    bg: Color(0xFFF6F7F9),
    surface: Color(0xFFFFFFFF),
    surface2: Color(0xFFEEF1F5),
    fg: Color(0xFF141A23),
    muted: Color(0xFF59636F),
    border: Color(0xFFDDE3EA),
    accent: Color(0xFFBB6A16),
    accentSoft: Color(0x1FBB6A16), // ~12% de opacidad
    accentFg: Color(0xFFFFFFFF),
  );

  /// Tema oscuro — espejo del bloque prefers-color-scheme:dark.
  static const dark = AppColors(
    bg: Color(0xFF0D1016),
    surface: Color(0xFF141A22),
    surface2: Color(0xFF1B232E),
    fg: Color(0xFFE8EDF3),
    muted: Color(0xFF93A0B0),
    border: Color(0xFF26303C),
    accent: Color(0xFFE8A33D),
    accentSoft: Color(0x24E8A33D), // ~14% de opacidad
    accentFg: Color(0xFF1A1205),
  );

  @override
  AppColors copyWith({
    Color? bg,
    Color? surface,
    Color? surface2,
    Color? fg,
    Color? muted,
    Color? border,
    Color? accent,
    Color? accentSoft,
    Color? accentFg,
  }) {
    return AppColors(
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surface2: surface2 ?? this.surface2,
      fg: fg ?? this.fg,
      muted: muted ?? this.muted,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      accentFg: accentFg ?? this.accentFg,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      fg: Color.lerp(fg, other.fg, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      border: Color.lerp(border, other.border, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      accentFg: Color.lerp(accentFg, other.accentFg, t)!,
    );
  }
}

/// Azúcar sintáctico: `context.colors.accent` en vez del extension largo.
extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
