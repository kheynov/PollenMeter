import 'package:flutter/material.dart';
import 'package:pollen_meter/core/utils/colors.dart';
import '../../../../core_ui/statistic_pollen_tile/models/statistic_pollen_tile_model.dart';
import '../../profile/enums/allergen_type.dart';
import '../models/pollen_model.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

extension PollenToStatisticMapper on PollenModel {
  List<StatisticPollenTileModel> toStatisticPollenTileModels(
      BuildContext context) {
    List<StatisticPollenTileModel> result = weedPollenLevels
        .map(
          (e) => StatisticPollenTileModel(
            levelOfConcentration: e.level.toDouble(),
            title: context.fromAllergen(e.allergen),
            icon: Icons.nature,
            color: riskColor(context.fromPollenLevelUnlocalized(
                allergenType: AllergenType.weed, count: e.level)),
          ),
        )
        .followedBy(
          grassPollenLevels.map(
            (e) => StatisticPollenTileModel(
                levelOfConcentration: e.level.toDouble(),
                title: context.fromAllergen(e.allergen),
                icon: Icons.grass,
                color: riskColor(context.fromPollenLevelUnlocalized(
                    allergenType: AllergenType.grass, count: e.level))),
          ),
        )
        .followedBy(
          treePollenLevels.map(
            (e) => StatisticPollenTileModel(
                levelOfConcentration: e.level.toDouble(),
                title: context.fromAllergen(e.allergen),
                icon: Icons.park,
                color: riskColor(context.fromPollenLevelUnlocalized(
                    allergenType: AllergenType.tree, count: e.level))),
          ),
        )
        .toList();

    result.sort((lhs, rhs) =>
        rhs.levelOfConcentration.compareTo(lhs.levelOfConcentration));
    return result;
  }
}
