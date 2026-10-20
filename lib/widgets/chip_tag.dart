import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Chip de tecnología (equivalente a `.chip` del CSS original).
///
/// Si [hot] es true usa el color de acento (como `.chip.hot`).
class ChipTag extends StatelessWidget {
  const ChipTag(this.label, {super.key, this.hot = false});

  final String label;
  final bool hot;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: hot ? c.accentSoft : c.surface2,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: hot ? c.accent : c.border),
      ),
      child: Text(
        label,
        style: AppTypography.mono(12, hot ? c.accent : c.fg),
      ),
    );
  }
}
