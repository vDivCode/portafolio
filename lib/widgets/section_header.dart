import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Encabezado de sección: número mono en acento + título display.
/// (equivale a `.sec-head` con su `.num`).
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.number, required this.title});

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(number, style: AppTypography.mono(13, c.accent)),
          const SizedBox(width: 14),
          Flexible(
            child: Text(title, style: AppTypography.display(28, c.fg, height: 1.1)),
          ),
        ],
      ),
    );
  }
}
