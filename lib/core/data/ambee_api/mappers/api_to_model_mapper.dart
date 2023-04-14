import 'package:pollen_meter/core/data/ambee_api/dto/pollen_dto.dart';
import 'package:pollen_meter/core/domain/models/pollen_model.dart';

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
