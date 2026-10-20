import 'package:flutter/material.dart';

/// Estado del tema (claro/oscuro).
///
/// Un [ValueNotifier] basta para un dato tan pequeño: la app escucha con un
/// `ValueListenableBuilder` y se reconstruye sola al cambiar. Para estado más
/// grande (sesión, carrito, datos remotos) escalarías a Riverpod, Provider o
/// BLoC — aquí sería sobre-ingeniería.
class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.dark);

  bool get isDark => value == ThemeMode.dark;

  void toggle() {
    value = isDark ? ThemeMode.light : ThemeMode.dark;
  }
}
