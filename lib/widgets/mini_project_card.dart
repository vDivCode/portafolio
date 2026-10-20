import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../core/utils/launch.dart';
import '../data/models/project.dart';

/// Tarjeta compacta para la grilla "Más proyectos en vivo" (`.mini`).
class MiniProjectCard extends StatelessWidget {
  const MiniProjectCard(this.project, {super.key});

  final MiniProject project;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(project.title, style: AppTypography.display(17, c.fg, height: 1.2)),
          const SizedBox(height: 8),
          Text(project.description, style: AppTypography.body(13.5, c.muted)),
          const SizedBox(height: 14),
          InkWell(
            onTap: () => openUrl(project.liveUrl),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ver en vivo', style: AppTypography.mono(12.5, c.accent)),
                const SizedBox(width: 6),
                Icon(Icons.north_east, size: 13, color: c.accent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
