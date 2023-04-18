import 'package:pollen_meter/core/data/ambee_api/dto/pollen_dto.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen.dart';

import '../../../domain/ambee_api/models/pollen_model.dart';

extension PollenDtoMapper on PollenDTO {
  PollenModel toPollenModel() {
    return PollenModel(
      PollenCount(count.grassPollen, count.treePollen, count.grassPollen),
      species.tree.entries
          .map((entry) => PollenLevel(_mapAllergens[entry.key]!, entry.value))
          .toList(),
      species.grass.entries
          .map((entry) => PollenLevel(_mapAllergens[entry.key]!, entry.value))
          .toList(),
      species.weed.entries
          .map((entry) => PollenLevel(_mapAllergens[entry.key]!, entry.value))
          .toList(),
    );
  }
}

Map<String, Allergen> _mapAllergens = {
  "Hazel": Allergen.hazel,
  "Elm": Allergen.elm,
  "Alder": Allergen.alder,
  "Poplar / Cottonwood": Allergen.poplar,
  "Oak": Allergen.oak,
  "Plane": Allergen.plane,
  "Birch": Allergen.birch,
  "Cypress": Allergen.cypress,
  "Mulberry": Allergen.myrtaceae,
  "Ash": Allergen.ash,
  "Maple": Allergen.maple,
  "Casuarina": Allergen.casuarina,
  "Acacia": Allergen.acacia,
  "Myrtaceae": Allergen.myrtaceae,
  "Willow": Allergen.willow,
  "Olive": Allergen.olive,
  "Pine": Allergen.pine,
  "Mugwort": Allergen.mugwort,
  "Chenopod": Allergen.chenopod,
  "Ragweed": Allergen.ragweed,
  "Nettle": Allergen.nettle,
  "Sedges": Allergen.sedges,
  "Aster": Allergen.aster,
  "Plantago": Allergen.plantago,
  "Rumex": Allergen.rumex,
  "Grass / Poaceae": Allergen.grass,
};
