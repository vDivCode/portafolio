import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../core/utils/launch.dart';
import '../data/models/project.dart';
import 'chip_tag.dart';
import 'link_button.dart';

/// Tarjeta de proyecto. Recibe un [Project] y lo pinta: aquí está la ganancia
/// del refactor — un widget, muchos proyectos, cero copy-paste.
class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final featured = project.featured;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: featured ? c.accent.withValues(alpha: 0.45) : c.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- título + badge destacado ----
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: AppTypography.display(
                        featured ? 22 : 19,
                        c.fg,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(project.role, style: AppTypography.mono(12.5, c.accent)),
                  ],
                ),
              ),
              if (featured) _Badge(label: 'Destacado'),
            ],
          ),
          const SizedBox(height: 12),

          // ---- descripción ----
          Text(project.description, style: AppTypography.body(14.5, c.muted)),
          const SizedBox(height: 16),

          // ---- chips de tecnologías ----
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              for (final tag in project.tags)
                ChipTag(tag, hot: project.hotTags.contains(tag)),
            ],
          ),

          // ---- acciones ----
          if (project.hasLive || project.hasCode || project.privateNote != null) ...[
            const SizedBox(height: 18),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (project.hasLive)
                  LinkButton(
                    label: 'Probar en vivo',
                    icon: Icons.north_east,
                    solid: true,
                    onTap: () => openUrl(project.liveUrl!),
                  ),
                if (project.hasCode)
                  LinkButton(
                    label: 'Código',
                    icon: Icons.code,
                    onTap: () => openUrl(project.codeUrl!),
                  ),
                if (project.privateNote != null) _PrivateTag(project.privateNote!),
              ],
            ),
          ],

          // ---- nota de demo ----
          if (project.demoNote != null) ...[
            const SizedBox(height: 12),
            Text(project.demoNote!, style: AppTypography.mono(11.5, c.muted)),
          ],
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: c.accent,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTypography.mono(10.5, c.accentFg, weight: FontWeight.w600, spacing: 0.8),
      ),
    );
  }
}

class _PrivateTag extends StatelessWidget {
  const _PrivateTag(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.lock_outline, size: 14, color: c.muted),
        const SizedBox(width: 7),
        Flexible(child: Text(text, style: AppTypography.mono(12, c.muted))),
      ],
    );
  }
}
