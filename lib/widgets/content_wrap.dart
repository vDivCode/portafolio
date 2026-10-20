import 'package:flutter/material.dart';

/// Breakpoints simples para decidir columnas según el ancho disponible.
class Breakpoints {
  static const double mobile = 560;
  static const double tablet = 760;
  static const double desktop = 1088; // ~68rem, el max-width del sitio original
}

/// Centra el contenido con un ancho máximo y márgenes laterales.
/// Equivale a `.wrap { max-width:68rem; margin-inline:auto; padding:0 20px }`.
class ContentWrap extends StatelessWidget {
  const ContentWrap({super.key, required this.child, this.vertical = 0});

  final Widget child;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Breakpoints.desktop),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}
