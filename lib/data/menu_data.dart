import '../models/plat.dart';

// Données du menu codées en dur (autorisé par le sujet).

const List<String> categories = [
  'Formules',
  'Entrées',
  'Plats',
  'Desserts',
  'Boissons',
];

const String _meals = 'https://www.themealdb.com/images/media/meals';
const String _drinks = 'https://www.thecocktaildb.com/images/media/drink';

const List<Plat> plats = [
  // ---- Formules ----
  Plat(
    nom: 'Formule Midi',
    description: 'Entrée + plat du jour + café. Servie du lundi au vendredi.',
    prix: 16.90,
    imageUrl: '$_meals/vussxq1511882648.jpg',
    categorie: 'Formules',
  ),
  Plat(
    nom: 'Formule Bistrot',
    description: 'Plat + dessert au choix parmi la carte du jour.',
    prix: 21.50,
    imageUrl: '$_meals/wvpvsu1511786158.jpg',
    categorie: 'Formules',
  ),
  Plat(
    nom: 'Menu Découverte',
    description: 'Entrée, plat et dessert du chef, une boisson offerte.',
    prix: 29.00,
    imageUrl: '$_meals/vtqxtu1511784197.jpg',
    categorie: 'Formules',
  ),

  // ---- Entrées ----
  Plat(
    nom: 'Soupe à l\'oignon',
    description: 'Gratinée au comté, croûtons maison.',
    prix: 7.50,
    imageUrl: '$_meals/xvrrux1511783685.jpg',
    categorie: 'Entrées',
  ),
  Plat(
    nom: 'Salade liégeoise',
    description: 'Haricots verts, pommes de terre, lardons et oignons.',
    prix: 8.20,
    imageUrl: '$_meals/ji3mho1782499823.jpg',
    categorie: 'Entrées',
  ),
  Plat(
    nom: 'Pâté de foies de volaille',
    description: 'Servi avec pain grillé et cornichons.',
    prix: 6.90,
    imageUrl: '$_meals/hob03q1780264260.jpg',
    categorie: 'Entrées',
  ),
  Plat(
    nom: 'Velouté de champignons',
    description: 'Pleurotes, crème fraîche et ciboulette.',
    prix: 7.00,
    imageUrl: '$_meals/0r7y5n1782681336.jpg',
    categorie: 'Entrées',
  ),

  // ---- Plats ----
  Plat(
    nom: 'Bœuf bourguignon',
    description: 'Mijoté 6h au vin rouge, carottes et pommes vapeur.',
    prix: 17.50,
    imageUrl: '$_meals/vtqxtu1511784197.jpg',
    categorie: 'Plats',
  ),
  Plat(
    nom: 'Coq au vin',
    description: 'Recette traditionnelle, champignons et lardons.',
    prix: 16.80,
    imageUrl: '$_meals/qstyvs1505931190.jpg',
    categorie: 'Plats',
  ),
  Plat(
    nom: 'Confit de canard',
    description: 'Pommes sarladaises et salade verte.',
    prix: 18.90,
    imageUrl: '$_meals/wvpvsu1511786158.jpg',
    categorie: 'Plats',
  ),
  Plat(
    nom: 'Ratatouille',
    description: 'Légumes du soleil confits, plat végétarien.',
    prix: 13.50,
    imageUrl: '$_meals/wrpwuu1511786491.jpg',
    categorie: 'Plats',
  ),
  Plat(
    nom: 'Steak sauce Diane',
    description: 'Pièce de bœuf, sauce crème et cognac, frites maison.',
    prix: 19.90,
    imageUrl: '$_meals/vussxq1511882648.jpg',
    categorie: 'Plats',
  ),

  // ---- Desserts ----
  Plat(
    nom: 'Tarte Tatin',
    description: 'Pommes caramélisées, boule de glace vanille.',
    prix: 6.90,
    imageUrl: '$_meals/ryspuw1511786688.jpg',
    categorie: 'Desserts',
  ),
  Plat(
    nom: 'Crème brûlée',
    description: 'Au chocolat blanc, croûte caramélisée minute.',
    prix: 6.50,
    imageUrl: '$_meals/uryqru1511798039.jpg',
    categorie: 'Desserts',
  ),
  Plat(
    nom: 'Soufflé au chocolat',
    description: 'Cuit à la commande, prévoir 15 minutes.',
    prix: 7.80,
    imageUrl: '$_meals/twspvx1511784937.jpg',
    categorie: 'Desserts',
  ),
  Plat(
    nom: 'Crêpes',
    description: 'Sucre, confiture ou pâte à tartiner.',
    prix: 5.50,
    imageUrl: '$_meals/rwuyqx1511383174.jpg',
    categorie: 'Desserts',
  ),

  // ---- Boissons ----
  Plat(
    nom: 'Citronnade maison',
    description: 'Citrons pressés, menthe fraîche. 33 cl.',
    prix: 4.20,
    imageUrl: '$_drinks/spvvxp1468924425.jpg',
    categorie: 'Boissons',
  ),
  Plat(
    nom: 'Orangeade',
    description: 'Jus d\'orange pressé et eau pétillante. 33 cl.',
    prix: 4.20,
    imageUrl: '$_drinks/ytsxxw1441167732.jpg',
    categorie: 'Boissons',
  ),
  Plat(
    nom: 'Café glacé',
    description: 'Espresso, lait et glaçons.',
    prix: 3.80,
    imageUrl: '$_drinks/ytprxy1454513855.jpg',
    categorie: 'Boissons',
  ),
  Plat(
    nom: 'Kir',
    description: 'Vin blanc et crème de cassis. 12 cl.',
    prix: 4.90,
    imageUrl: '$_drinks/apneom1504370294.jpg',
    categorie: 'Boissons',
  ),
];

/// Renvoie uniquement les plats de la catégorie demandée.
List<Plat> platsParCategorie(String categorie) {
  return plats.where((p) => p.categorie == categorie).toList();
}
