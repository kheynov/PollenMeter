import 'package:pollen_meter/core/domain/profile/enums/allergen_types.dart';

enum Allergens {
  hazel(type: AllergenType.tree),
  elm(type: AllergenType.tree),
  alder(type: AllergenType.tree),
  poplar(type: AllergenType.tree),
  oak(type: AllergenType.tree),
  plane(type: AllergenType.tree),
  birch(type: AllergenType.tree),
  cypress(type: AllergenType.tree),
  mulberry(type: AllergenType.tree),
  ash(type: AllergenType.tree),
  maple(type: AllergenType.tree),
  casuarina(type: AllergenType.tree),
  acacia(type: AllergenType.tree),
  myrtaceae(type: AllergenType.tree),
  willow(type: AllergenType.tree),
  olive(type: AllergenType.tree),
  pine(type: AllergenType.tree),
  //weeds
  mugwort(type: AllergenType.weed),
  chenopod(type: AllergenType.weed),
  ragweed(type: AllergenType.weed),
  nettle(type: AllergenType.weed),
  sedges(type: AllergenType.weed),
  aster(type: AllergenType.weed),
  plantago(type: AllergenType.weed),
  rumex(type: AllergenType.weed),
  //grass
  grass(type: AllergenType.grass);

  final AllergenType type;

  const Allergens({
    required this.type,
  });
}

extension AllergensExtension on Allergens {
  String get pathImage {
    switch (this) {
      default:
        return 'assets/images/pollen/default.svg';
    }
  }
}
