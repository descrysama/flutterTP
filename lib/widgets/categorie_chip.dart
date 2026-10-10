import 'package:flutter/material.dart';

/// Bouton d'une catégorie dans la barre horizontale.
/// On réutilise ce widget pour chaque catégorie.
class CategorieChip extends StatelessWidget {
  final String label;
  final bool selectionne;
  final VoidCallback onTap;

  const CategorieChip({
    super.key,
    required this.label,
    required this.selectionne,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selectionne,
        onSelected: (_) => onTap(),
      ),
    );
  }
}
