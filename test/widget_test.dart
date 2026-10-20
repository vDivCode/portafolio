import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portafolio/app.dart';
import 'package:portafolio/data/portfolio_data.dart';

void main() {
  setUpAll(() {
    // En tests no hay red: usamos las fuentes de respaldo en vez de descargarlas
    // (si no, google_fonts deja un timer pendiente y el test falla).
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('El portafolio renderiza el nombre y una sección', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    // El nombre del hero aparece.
    expect(find.text(Profile.name), findsOneWidget);
    // El encabezado de proyectos existe.
    expect(find.text('Proyectos'), findsWidgets);
  });
}
