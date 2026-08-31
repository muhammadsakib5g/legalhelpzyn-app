import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:legalhelpzyn_app/main.dart';

void main() {
  testWidgets('placeholder screen renders the brand message', (tester) async {
    await tester.pumpWidget(const LegalHelpzynApp());

    expect(find.text('Legal services, handled properly.'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
