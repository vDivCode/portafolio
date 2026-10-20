import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Botón de enlace reutilizable (equivale a `.link-btn` / `.link-btn.solid`).
///
/// [solid] lo pinta con el acento relleno; si no, es contorneado.
class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.solid = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool solid;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Material(
      color: solid ? c.accent : c.bg,
      borderRadius: BorderRadius.circular(9),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: solid ? c.accent : c.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 15, color: solid ? c.accentFg : c.fg),
              const SizedBox(width: 7),
              Text(
                label,
                style: AppTypography.mono(13, solid ? c.accentFg : c.fg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
