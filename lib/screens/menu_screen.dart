import 'package:flutter/material.dart';

import '../data/menu_data.dart';
import '../widgets/categorie_chip.dart';

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
          const Expanded(
            child: Center(child: Text('Liste des plats')),
          ),
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
}
