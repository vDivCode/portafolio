import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tipografía de la marca.
///
/// - Bricolage Grotesque: títulos (display).
/// - IBM Plex Sans: cuerpo.
/// - IBM Plex Mono: etiquetas, "eyebrows", botones y chips.
///
/// `google_fonts` descarga las fuentes en runtime y las cachea, así no hay que
/// empaquetar los .ttf a mano.
class AppTypography {
  const AppTypography._();

  static TextStyle display(double size, Color color, {double height = 1.05}) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: height,
        color: color,
      );

  static TextStyle body(double size, Color color, {FontWeight? weight}) =>
      GoogleFonts.ibmPlexSans(
        fontSize: size,
        fontWeight: weight ?? FontWeight.w400,
        height: 1.6,
        color: color,
      );

  static TextStyle mono(
    double size,
    Color color, {
    FontWeight weight = FontWeight.w500,
    double spacing = 0.2,
  }) =>
      GoogleFonts.ibmPlexMono(
        fontSize: size,
        fontWeight: weight,
        letterSpacing: spacing,
        color: color,
      );

  /// "Eyebrow": etiqueta mono en mayúsculas sobre los títulos.
  static TextStyle eyebrow(Color color) => GoogleFonts.ibmPlexMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.2,
        color: color,
      );
}
