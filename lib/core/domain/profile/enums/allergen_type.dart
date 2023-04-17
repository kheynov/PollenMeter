import 'package:pollen_meter/core/domain/profile/enums/allergen.dart';

enum AllergenType {
  weed,
  tree,
  grass,
}

extension AllergenTypeExtension on AllergenType {
  List<Allergen> get listAllergens {
    switch (this) {
      case AllergenType.weed:
        return [
          Allergen.mugwort,
          Allergen.chenopod,
          Allergen.ragweed,
          Allergen.nettle,
          Allergen.sedges,
          Allergen.aster,
          Allergen.plantago,
          Allergen.rumex,
        ];
      case AllergenType.tree:
        return [
          Allergen.hazel,
          Allergen.elm,
          Allergen.alder,
          Allergen.poplar,
          Allergen.oak,
          Allergen.plane,
          Allergen.birch,
          Allergen.cypress,
          Allergen.mulberry,
          Allergen.ash,
          Allergen.maple,
          Allergen.casuarina,
          Allergen.acacia,
          Allergen.myrtaceae,
          Allergen.willow,
          Allergen.olive,
          Allergen.pine,
        ];
      case AllergenType.grass:
        return [Allergen.grass];
    }
  }
}
