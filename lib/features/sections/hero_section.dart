import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/utils/launch.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/content_wrap.dart';
import '../../widgets/link_button.dart';

/// Portada: eyebrow, nombre grande, lead, llamados a la acción y meta.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onSeeProjects});

  /// Callback para desplazar a la sección de proyectos.
  final VoidCallback onSeeProjects;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isMobile = MediaQuery.sizeOf(context).width < Breakpoints.tablet;

    return ContentWrap(
      vertical: isMobile ? 48 : 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Profile.eyebrow.toUpperCase(), style: AppTypography.eyebrow(c.muted)),
          const SizedBox(height: 18),
          Text(
            Profile.name,
            style: AppTypography.display(isMobile ? 42 : 64, c.fg, height: 1.02),
          ),
          const SizedBox(height: 22),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Text(Profile.lead, style: AppTypography.body(isMobile ? 17 : 19, c.muted)),
          ),
          const SizedBox(height: 34),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              LinkButton(
                label: 'Ver proyectos',
                icon: Icons.south,
                solid: true,
                onTap: onSeeProjects,
              ),
              LinkButton(
                label: 'Probar demo en vivo',
                icon: Icons.north_east,
                onTap: () => openUrl('https://campus-utp.onrender.com'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 22,
            runSpacing: 10,
            children: const [
              _MetaItem('Full stack · Java & TypeScript'),
              _MetaItem('Spring Boot · Next.js · Vue'),
              _MetaItem('Model Context Protocol'),
            ],
          ),
        ],
      ),
    )
        // Animación de entrada sobria: aparece y sube un poco.
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic);
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: c.accent, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label, style: AppTypography.mono(12.5, c.muted)),
      ],
    );
  }
}
