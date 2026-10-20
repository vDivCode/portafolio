import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../data/models/stack_group.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/chip_tag.dart';
import '../../widgets/content_wrap.dart';
import '../../widgets/section_header.dart';

/// Sección de stack técnico: tarjetas por categoría con chips.
class StackSection extends StatelessWidget {
  const StackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentWrap(
      vertical: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(number: '02', title: 'Stack técnico'),
          LayoutBuilder(
            builder: (context, constraints) {
              final cols = constraints.maxWidth >= Breakpoints.mobile ? 2 : 1;
              final spacing = 16.0;
              final cellWidth =
                  (constraints.maxWidth - spacing * (cols - 1)) / cols;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (final group in kStack)
                    SizedBox(width: cellWidth, child: _StackCard(group)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StackCard extends StatelessWidget {
  const _StackCard(this.group);
  final StackGroup group;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.title.toUpperCase(),
            style: AppTypography.mono(12, c.muted, weight: FontWeight.w600, spacing: 1.2),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              for (final item in group.items)
                ChipTag(item, hot: group.hotItems.contains(item)),
            ],
          ),
        ],
      ),
    );
  }
}
