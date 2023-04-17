import 'package:flutter/material.dart';
import 'package:pollen_meter/core/utils/l10n.dart';
import '../../../../core_ui/statistic_pollen_tile/models/statistic_pollen_tile_model.dart';
import '../models/pollen_model.dart';

extension PollenToStatisticMapper on PollenModel {
  List<StatisticPollenTileModel> toStatisticPollenTileModels(
      BuildContext context) {
    List<StatisticPollenTileModel> result = weedPollenLevels
        .map(
          (e) => StatisticPollenTileModel(
            levelOfConcentration: e.level.toDouble(),
            title: getLocalizedName(context, e.name),
            icon: Icons.nature,
          ),
        )
        .followedBy(
          grassPollenLevels.map(
            (e) => StatisticPollenTileModel(
              levelOfConcentration: e.level.toDouble(),
              title: getLocalizedName(context, e.name),
              icon: Icons.grass,
            ),
          ),
        )
        .followedBy(
          treePollenLevels.map(
            (e) => StatisticPollenTileModel(
              levelOfConcentration: e.level.toDouble(),
              title: getLocalizedName(context, e.name),
              icon: Icons.park,
            ),
          ),
        )
        .toList();

    result.sort((lhs, rhs) =>
        rhs.levelOfConcentration.compareTo(lhs.levelOfConcentration));
    return result;
  }
}
