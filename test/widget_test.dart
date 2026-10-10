import 'package:flutter_test/flutter_test.dart';

import 'package:tprestaurantflutter/main.dart';

void main() {
  testWidgets('Affiche le titre et les catégories', (WidgetTester tester) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Menu du Restaurant X'), findsOneWidget);
    expect(find.text('Formules'), findsOneWidget);
    expect(find.text('Desserts'), findsOneWidget);
  });
}
