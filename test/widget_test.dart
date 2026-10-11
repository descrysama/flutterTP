import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tprestaurantflutter/main.dart';

void main() {
  testWidgets('Affiche le titre et les catégories', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Menu du Restaurant X'), findsOneWidget);
    expect(find.text('Formules'), findsOneWidget);
    expect(find.text('Desserts'), findsOneWidget);
  });

  testWidgets('Changer de catégorie affiche les bons plats', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Formule Midi'), findsOneWidget);

    await tester.tap(find.text('Desserts'));
    await tester.pumpAndSettle();

    expect(find.text('Tarte Tatin'), findsOneWidget);
    expect(find.text('Formule Midi'), findsNothing);
  });

  testWidgets('Pas de débordement en portrait et en paysage', (
    WidgetTester tester,
  ) async {
    for (final taille in const [Size(360, 740), Size(800, 360)]) {
      tester.view.physicalSize = taille;
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(const RestaurantApp());

      for (final categorie in ['Entrées', 'Plats', 'Boissons']) {
        await tester.tap(find.text(categorie));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
    }
    tester.view.reset();
  });

  testWidgets('Cliquer sur une carte ouvre la page de détail', (
    WidgetTester tester,
  ) async {
    for (final taille in const [Size(360, 740), Size(800, 360)]) {
      tester.view.physicalSize = taille;
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(const RestaurantApp());

      await tester.tap(find.text('Formule Midi'));
      await tester.pumpAndSettle();

      // le nom du plat est dans l'AppBar et dans la page
      expect(find.text('Formule Midi'), findsNWidgets(2));
      expect(find.byType(BackButton), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.text('Formule Midi'), findsOneWidget);
    }
    tester.view.reset();
  });
}
