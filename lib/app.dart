import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'features/home/home_page.dart';

/// Raíz de la app: configura MaterialApp, los temas claro/oscuro y reacciona
/// al [ThemeController] para repintar al cambiar de modo.
class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final _theme = ThemeController();

  @override
  void dispose() {
    _theme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _theme,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'David Ventura — Portafolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: mode,
          home: HomePage(theme: _theme),
        );
      },
    );
  }
}
