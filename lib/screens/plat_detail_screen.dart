import 'package:flutter/material.dart';

import '../models/plat.dart';
import '../widgets/plat_image.dart';

/// Page de détail d'un plat, ouverte quand on clique sur une carte.
class PlatDetailScreen extends StatelessWidget {
  final Plat plat;

  const PlatDetailScreen({super.key, required this.plat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plat.nom),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // SingleChildScrollView pour pouvoir scroller en mode paysage
      // si la page est plus haute que l'écran
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PlatImage(url: plat.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row : nom à gauche, prix à droite
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          plat.nom,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        formatPrix(plat.prix),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Chip(label: Text(plat.categorie)),
                  const SizedBox(height: 12),
                  // ici la description est affichée en entier
                  Text(plat.description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
