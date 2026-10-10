import 'package:flutter/material.dart';

import '../data/menu_data.dart';
import '../widgets/categorie_chip.dart';
import '../widgets/plat_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Catégorie affichée, par défaut la première de la liste
  String _categorieSelectionnee = categories.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu du Restaurant X'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Column : la barre de catégories en haut, puis la zone des plats
      body: Column(
        children: [
          _buildBarreCategories(),
          // Expanded : la liste prend toute la hauteur restante sous la barre
          Expanded(child: _buildListePlats()),
        ],
      ),
    );
  }

  /// Barre des catégories : une Row dans un SingleChildScrollView horizontal
  /// pour pouvoir faire défiler si toutes les catégories ne tiennent pas
  /// dans la largeur de l'écran.
  Widget _buildBarreCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: categories.map((categorie) {
          return CategorieChip(
            label: categorie,
            selectionne: categorie == _categorieSelectionnee,
            onTap: () {
              setState(() => _categorieSelectionnee = categorie);
            },
          );
        }).toList(),
      ),
    );
  }

  /// Liste verticale des plats de la catégorie sélectionnée.
  /// ListView.builder ne construit que les cartes visibles à l'écran.
  Widget _buildListePlats() {
    final platsAffiches = platsParCategorie(_categorieSelectionnee);

    if (platsAffiches.isEmpty) {
      return const Center(child: Text('Aucun plat dans cette catégorie'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: platsAffiches.length,
      itemBuilder: (context, index) {
        return PlatCard(plat: platsAffiches[index]);
      },
    );
  }
}
