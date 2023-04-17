import 'package:pollen_meter/core/data/ambee_api/dto/pollen_dto.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergens.dart';

import '../../../domain/ambee_api/models/pollen_model.dart';

extension PollenDtoMapper on PollenDTO {
  PollenModel toPollenModel() {
    return PollenModel(
      count,
      risk,
      species.tree.entries
          .map((entry) => TreePollenLevel(entry.key, entry.value))
          .toList(),
      species.grass.entries
          .map((entry) => GrassPollenLevel(entry.key, entry.value))
          .toList(),
      species.weed.entries
          .map((entry) => WeedPollenLevel(entry.key, entry.value))
          .toList(),
    );
  }
}

Map<String, Allergens> _mapAllergens = {
  "Hazel": Allergens.hazel,
  "Elm": Allergens.elm,
  "Alder": Allergens.alder,
  "Poplar / Cottonwood": Allergens.poplar,
  "Oak": Allergens.oak,
  "Plane": Allergens.plane,
  "Birch": Allergens.birch,
  "Cypress": Allergens.cypress,
  "Mulberry": Allergens.myrtaceae,
  "Ash": Allergens.ash,
  "Maple": Allergens.maple,
  "Casuarina": Allergens.casuarina,
  "Acacia": Allergens.acacia,
  "Myrtaceae": Allergens.myrtaceae,
  "Willow": Allergens.willow,
  "Olive": Allergens.olive,
  "Pine": Allergens.pine,
  "Mugwort": Allergens.mugwort,
  "Chenopod": Allergens.chenopod,
  "Ragweed": Allergens.ragweed,
  "Nettle": Allergens.nettle,
  "Sedges": Allergens.sedges,
  "Aster": Allergens.aster,
  "Plantago": Allergens.plantago,
  "Rumex": Allergens.rumex,
  "Grass / Poaceae": Allergens.grass,
};
