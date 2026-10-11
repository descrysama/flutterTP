# TP Flutter – Menu d'un restaurant

Application Flutter qui affiche le menu d'un restaurant par catégories
(Formules, Entrées, Plats, Desserts, Boissons).

## Fonctionnalités

- Barre de catégories défilable horizontalement (`SingleChildScrollView` + `Row`
  de `ChoiceChip`)
- Liste verticale des plats de la catégorie sélectionnée (`ListView.builder`)
- Chaque plat est affiché dans une `Card` : image, nom, description courte
  et prix
- Mode portrait : cartes en liste, image au-dessus du texte
- Mode paysage / écran large : grille de cartes avec l'image à gauche
  (`LayoutBuilder` + `GridView`)
- Fondu au changement de catégorie (`AnimatedSwitcher`)
- Clic sur une carte : page de détail du plat (`Navigator.push`)

## Organisation du code

```
lib/
├── main.dart                  // point d'entrée, thème de l'appli
├── models/plat.dart           // classe Plat
├── data/menu_data.dart        // catégories et plats codés en dur
├── screens/
│   ├── menu_screen.dart       // écran principal (AppBar, catégories, plats)
│   └── plat_detail_screen.dart // page de détail d'un plat
└── widgets/
    ├── categorie_chip.dart    // bouton d'une catégorie
    ├── plat_card.dart         // carte réutilisable pour un plat
    └── plat_image.dart        // image d'un plat (carte + détail)
```

## Lancer le projet

```bash
flutter pub get
flutter run
```

Les images sont chargées depuis internet (TheMealDB / TheCocktailDB), une
icône s'affiche à la place si l'appareil n'a pas de connexion.
