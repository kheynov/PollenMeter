import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core_ui/models/gauge/gauge_model.dart';
import '../../profile/model/profile_data_model.dart';
import '../models/pollen_model.dart';

extension PollenToGaugeMapper on PollenModel {
  Color getColorForLevel(double level) {
    if (level < 100) {
      //Тут на глазок - для маленьких кругляшков по видам, так как там не дается risk в явном виде
      return Colors.green;
    } else if (level < 200) {
      return Colors.yellow;
    } else if (level < 300) {
      return Colors.orange;
    } else if (level < 400) {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

  GaugeModel toGaugeModelMain(BuildContext context) {
    Map<String, Color> riskColors = {
      'Low': Colors.green,
      'Moderate': Colors.yellow,
      'High': Colors.red,
      'Very High': Colors.purple,
    };
    Map<String, String?> riskNames = {
      'Low': AppLocalizations.of(context)?.lowRisk,
      'Moderate': AppLocalizations.of(context)?.moderateRisk,
      'High': AppLocalizations.of(context)?.highRisk,
      'Very High': AppLocalizations.of(context)?.veryHighRisk,
    };

    List result = [
      GaugeModel(
        value: count.treePollen.toDouble(),
        title: riskNames[risk.treePollen] ?? 'Error',
        icon: Icons.park,
        color: riskColors[risk.treePollen] ?? Colors.white60,
        bottomTitle: AppLocalizations.of(context)?.treePollen,
      ),
      GaugeModel(
        value: count.weedPollen.toDouble(),
        title: riskNames[risk.weedPollen] ?? 'Error',
        icon: Icons.nature,
        color: riskColors[risk.weedPollen] ?? Colors.white60,
        bottomTitle: AppLocalizations.of(context)?.weedPollen,
      ),
      GaugeModel(
        value: count.grassPollen.toDouble(),
        title: riskNames[risk.grassPollen] ?? 'Error',
        icon: Icons.grass,
        color: riskColors[risk.grassPollen] ?? Colors.white60,
        bottomTitle: AppLocalizations.of(context)?.grassPollen,
      ),
    ];
    result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return result[0];
  }

  List<GaugeModel> toGaugeModelsAuxiliary(
      BuildContext context, WidgetRef ref, ProfileDataModel profile) {
    Map<String, String?> plantNames = {
      'Hazel': AppLocalizations.of(context)?.hazel,
      'Elm': AppLocalizations.of(context)?.elm,
      'Alder': AppLocalizations.of(context)?.alder,
      'Poplar / Cottonwood': AppLocalizations.of(context)?.poplar,
      'Oak': AppLocalizations.of(context)?.oak,
      'Plane': AppLocalizations.of(context)?.plane,
      'Birch': AppLocalizations.of(context)?.birch,
      'Cypress': AppLocalizations.of(context)?.cypress,
      'Mulberry': AppLocalizations.of(context)?.mulberry,
      'Ash': AppLocalizations.of(context)?.ash,
      'Maple': AppLocalizations.of(context)?.maple,
      'Casuarina': AppLocalizations.of(context)?.casuarina,
      'Acacia': AppLocalizations.of(context)?.acacia,
      'Myrtaceae': AppLocalizations.of(context)?.myrtaceae,
      'Willow': AppLocalizations.of(context)?.willow,
      'Olive': AppLocalizations.of(context)?.olive,
      'Pine': AppLocalizations.of(context)?.pine,
      'Mugwort': AppLocalizations.of(context)?.mugwort,
      'Chenopod': AppLocalizations.of(context)?.chenopod,
      'Ragweed': AppLocalizations.of(context)?.ragweed,
      'Nettle': AppLocalizations.of(context)?.nettle,
      'Sedges': AppLocalizations.of(context)?.sedges,
      'Aster': AppLocalizations.of(context)?.aster,
      'Plantago': AppLocalizations.of(context)?.plantago,
      'Rumex': AppLocalizations.of(context)?.rumex,
    };
    List<PollenLevel> grassList = (grassPollenLevels.where(
      (element) => profile.allergens.any(
        (innerElement) => element.name == innerElement.enName,
      ),
    )).toList();

    List<PollenLevel> weedList =
        (weedPollenLevels.where((element) => profile.allergens.any(
              (innerElement) => element.name == innerElement.enName,
            ))).toList();

    List<PollenLevel> treeList =
        (treePollenLevels.where((element) => profile.allergens.any(
              (innerElement) => element.name == innerElement.enName,
            ))).toList();
    return grassList
        .map(
          (e) => GaugeModel(
            value: e.level.toDouble(),
            title: plantNames[e.name] ?? e.name,
            icon: Icons.grass,
            color: getColorForLevel(
              e.level.toDouble(),
            ),
          ),
        )
        .followedBy(
          weedList.map(
            (e) => GaugeModel(
                value: e.level.toDouble(),
                title: plantNames[e.name] ?? e.name,
                icon: Icons.nature,
                color: getColorForLevel(
                  e.level.toDouble(),
                )),
          ),
        )
        .followedBy(
          treeList.map(
            (e) => GaugeModel(
              value: e.level.toDouble(),
              title: plantNames[e.name] ?? e.name,
              icon: Icons.park,
              color: getColorForLevel(
                e.level.toDouble(),
              ),
            ),
          ),
        )
        .toList();
  }
}
