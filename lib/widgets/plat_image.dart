import 'package:flutter/material.dart';

/// Image d'un plat chargée depuis internet.
/// Utilisée dans la carte et dans la page de détail (pas de duplication).
class PlatImage extends StatelessWidget {
  final String url;

  const PlatImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
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
