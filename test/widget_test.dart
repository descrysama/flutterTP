import 'package:flutter_test/flutter_test.dart';

import 'package:tprestaurantflutter/main.dart';

void main() {
  testWidgets('Affiche le titre et les catégories', (WidgetTester tester) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Menu du Restaurant X'), findsOneWidget);
    expect(find.text('Formules'), findsOneWidget);
    expect(find.text('Desserts'), findsOneWidget);
  });

  testWidgets('Changer de catégorie affiche les bons plats',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Formule Midi'), findsOneWidget);

    await tester.tap(find.text('Desserts'));
    await tester.pumpAndSettle();

    expect(find.text('Tarte Tatin'), findsOneWidget);
    expect(find.text('Formule Midi'), findsNothing);
  });
}
