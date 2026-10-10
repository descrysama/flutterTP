import 'package:flutter/material.dart';

import '../models/plat.dart';

/// Carte qui affiche un plat : image, nom, description et prix.
/// Le même widget est utilisé pour tous les plats (pas de duplication).
class PlatCard extends StatelessWidget {
  final Plat plat;

  const PlatCard({super.key, required this.plat});

  @override
  Widget build(BuildContext context) {
    return Card(
      // pour que l'image suive les coins arrondis de la carte
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // hauteur fixe pour que toutes les images aient la même taille
          SizedBox(
            height: 160,
            width: double.infinity,
            child: _buildImage(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plat.nom,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // description limitée à 2 lignes
                Text(
                  plat.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  formatPrix(plat.prix),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      plat.imageUrl,
      fit: BoxFit.cover,
      // loader pendant le chargement de l'image
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      // si pas de connexion on met une icône à la place
      errorBuilder: (context, error, stack) {
        return const Icon(Icons.restaurant, size: 48);
      },
    );
  }
}
