import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/theme_controller.dart';
import '../../widgets/content_wrap.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/stack_section.dart';

/// Pantalla única: barra fija arriba + secciones scrolleables.
///
/// Una sola pantalla con scroll (igual que el sitio original de una página).
/// Las anclas de navegación usan Scrollable.ensureVisible sobre GlobalKeys.
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.theme});

  final ThemeController theme;

  final _projectsKey = GlobalKey();
  final _stackKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _TopBar(
            theme: theme,
            onProjects: () => _scrollTo(_projectsKey),
            onStack: () => _scrollTo(_stackKey),
            onContact: () => _scrollTo(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(onSeeProjects: () => _scrollTo(_projectsKey)),
                  _Rule(),
                  KeyedSubtree(key: _projectsKey, child: const ProjectsSection()),
                  _Rule(),
                  KeyedSubtree(key: _stackKey, child: const StackSection()),
                  KeyedSubtree(key: _contactKey, child: const ContactSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Barra superior fija con marca, navegación y toggle de tema.
class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.theme,
    required this.onProjects,
    required this.onStack,
    required this.onContact,
  });

  final ThemeController theme;
  final VoidCallback onProjects;
  final VoidCallback onStack;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isMobile = MediaQuery.sizeOf(context).width < Breakpoints.tablet;

    return Container(
      decoration: BoxDecoration(
        color: c.bg.withValues(alpha: 0.9),
        border: Border(bottom: BorderSide(color: c.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: ContentWrap(
          vertical: 10,
          child: Row(
            children: [
              // Marca: vDiv + Code (Code en acento).
              RichText(
                text: TextSpan(
                  style: AppTypography.mono(15, c.fg),
                  children: [
                    const TextSpan(text: 'vDiv'),
                    TextSpan(text: 'Code', style: TextStyle(color: c.accent)),
                  ],
                ),
              ),
              const Spacer(),
              if (!isMobile) ...[
                _NavLink('Proyectos', onProjects),
                _NavLink('Stack', onStack),
                _NavLink('Contacto', onContact),
                const SizedBox(width: 4),
              ],
              _ThemeToggle(theme: theme),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: c.muted),
      child: Text(label, style: AppTypography.mono(13, c.muted)),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle({required this.theme});
  final ThemeController theme;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return IconButton(
      onPressed: theme.toggle,
      tooltip: 'Cambiar tema',
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
          side: BorderSide(color: c.border),
        ),
      ),
      icon: Icon(
        theme.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        size: 18,
        color: c.fg,
      ),
    );
  }
}

/// Línea divisoria fina entre secciones (`<hr class="rule">`).
class _Rule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentWrap(child: Divider(height: 1, color: context.colors.border));
  }
}
