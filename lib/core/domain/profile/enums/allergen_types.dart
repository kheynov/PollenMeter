import 'package:pollen_meter/core/domain/profile/enums/allergens.dart';

enum AllergenType {
  weed,
  tree,
  grass,
}

extension AllergenTypeExtension on AllergenType {

  List<Allergens> get listAllergens {
    switch (this) {
      case AllergenType.weed:
        return [
          Allergens.mugwort,
          Allergens.chenopod,
          Allergens.ragweed,
          Allergens.nettle,
          Allergens.sedges,
          Allergens.aster,
          Allergens.plantago,
          Allergens.rumex,
        ];
      case AllergenType.tree:
        return [
          Allergens.hazel,
          Allergens.elm,
          Allergens.alder,
          Allergens.poplar,
          Allergens.oak,
          Allergens.plane,
          Allergens.birch,
          Allergens.cypress,
          Allergens.mulberry,
          Allergens.ash,
          Allergens.maple,
          Allergens.casuarina,
          Allergens.acacia,
          Allergens.myrtaceae,
          Allergens.willow,
          Allergens.olive,
          Allergens.pine,
        ];
      case AllergenType.grass:
        return [Allergens.grass];
    }
  }
}
