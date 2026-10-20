import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/content_wrap.dart';
import '../../widgets/mini_project_card.dart';
import '../../widgets/project_card.dart';

/// Sección de proyectos: destacado a ancho completo + grilla responsive, y
/// debajo la grilla compacta de "Más proyectos en vivo".
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;

    return ContentWrap(
      vertical: 56,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final cols = width >= Breakpoints.tablet ? 2 : 1;
          final miniCols = width >= Breakpoints.tablet ? 3 : 1;

          final featured = kProjects.where((p) => p.featured).toList();
          final rest = kProjects.where((p) => !p.featured).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado inline (01 · Proyectos) — reutilizamos tipografía.
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('01', style: AppTypography.mono(13, c.accent)),
                    const SizedBox(width: 14),
                    Text('Proyectos', style: AppTypography.display(28, c.fg, height: 1.1)),
                  ],
                ),
              ),

              // Destacado a ancho completo.
              for (final p in featured) ...[
                ProjectCard(p),
                const SizedBox(height: 20),
              ],

              // Grilla del resto.
              _Grid(
                columns: cols,
                spacing: 20,
                children: [for (final p in rest) ProjectCard(p)],
              ),

              const SizedBox(height: 34),
              Text(
                '// Más proyectos en vivo',
                style: AppTypography.mono(15, c.muted, weight: FontWeight.w600, spacing: 0.8),
              ),
              const SizedBox(height: 16),
              _Grid(
                columns: miniCols,
                spacing: 14,
                children: [for (final m in kMiniProjects) MiniProjectCard(m)],
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Grilla responsive por filas de ancho fijo.
///
/// Reparte los hijos en filas de [columns] columnas, cada celda del mismo
/// ancho. Es un patrón reutilizable y predecible (frente a GridView, que exige
/// una relación de aspecto fija y no se adapta a alturas variables).
class _Grid extends StatelessWidget {
  const _Grid({required this.columns, required this.spacing, required this.children});

  final int columns;
  final double spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalGaps = spacing * (columns - 1);
        final cellWidth = (constraints.maxWidth - totalGaps) / columns;

        final rows = <Widget>[];
        for (var i = 0; i < children.length; i += columns) {
          final rowItems = <Widget>[];
          for (var j = 0; j < columns; j++) {
            final index = i + j;
            if (j > 0) rowItems.add(SizedBox(width: spacing));
            rowItems.add(
              SizedBox(
                width: cellWidth,
                child: index < children.length ? children[index] : const SizedBox(),
              ),
            );
          }
          if (rows.isNotEmpty) rows.add(SizedBox(height: spacing));
          rows.add(
            IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: rowItems),
            ),
          );
        }
        return Column(children: rows);
      },
    );
  }
}
