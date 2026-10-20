import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Abre una URL externa (demo, repo, LinkedIn) en el navegador / app adecuada.
Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('No se pudo abrir: $url');
  }
}

/// Abre el cliente de correo con el destinatario ya puesto.
Future<void> openEmail(String address) async {
  final uri = Uri(scheme: 'mailto', path: address);
  if (!await launchUrl(uri)) {
    debugPrint('No se pudo abrir el correo: $address');
  }
}
