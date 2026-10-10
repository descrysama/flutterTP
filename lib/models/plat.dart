/// Représente un plat de la carte.
class Plat {
  final String nom;
  final String description;
  final double prix;
  final String imageUrl;
  final String categorie;

  const Plat({
    required this.nom,
    required this.description,
    required this.prix,
    required this.imageUrl,
    required this.categorie,
  });
}

/// Formate un prix à la française : 12.5 -> "12,50 €"
String formatPrix(double prix) {
  return '${prix.toStringAsFixed(2).replaceAll('.', ',')} €';
}
