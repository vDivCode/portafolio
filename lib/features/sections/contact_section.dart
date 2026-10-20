import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/utils/launch.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/content_wrap.dart';
import '../../widgets/link_button.dart';

/// Banda de contacto (fondo surface-2) + pie de página.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      children: [
        // Banda de contacto a ancho completo.
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: c.surface2,
            border: Border(top: BorderSide(color: c.border)),
          ),
          child: ContentWrap(
            vertical: 56,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Profile.availability.toUpperCase(), style: AppTypography.eyebrow(c.muted)),
                const SizedBox(height: 14),
                Text('Conversemos', style: AppTypography.display(34, c.fg, height: 1.1)),
                const SizedBox(height: 14),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Text(Profile.contactPitch, style: AppTypography.body(15.5, c.muted)),
                ),
                const SizedBox(height: 26),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const _EmailBox(),
                    LinkButton(
                      label: 'LinkedIn',
                      icon: Icons.person_outline,
                      onTap: () => openUrl(Profile.linkedIn),
                    ),
                    LinkButton(
                      label: 'GitHub',
                      icon: Icons.code,
                      onTap: () => openUrl(Profile.github),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Pie.
        Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
          child: ContentWrap(
            vertical: 24,
            child: Wrap(
              spacing: 16,
              runSpacing: 8,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(Profile.footerLeft, style: AppTypography.mono(12, c.muted)),
                Text(Profile.footerRight, style: AppTypography.mono(12, c.muted)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Caja con el correo y botón de copiar.
class _EmailBox extends StatefulWidget {
  const _EmailBox();

  @override
  State<_EmailBox> createState() => _EmailBoxState();
}

class _EmailBoxState extends State<_EmailBox> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(const ClipboardData(text: Profile.email));
    setState(() => _copied = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(Profile.email, style: AppTypography.mono(13.5, c.fg)),
          const SizedBox(width: 10),
          Material(
            color: c.accent,
            borderRadius: BorderRadius.circular(7),
            child: InkWell(
              onTap: _copy,
              borderRadius: BorderRadius.circular(7),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  _copied ? '¡Copiado!' : 'Copiar',
                  style: AppTypography.mono(12, c.accentFg),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
