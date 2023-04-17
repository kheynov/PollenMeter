import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core_ui/gauge/models/gauge_model.dart';
//import '../../../utils/colors.dart';
//import '../../../utils/l10n.dart';
//import '../../profile/model/profile_data_model.dart';
import '../models/pollen_model.dart';

//TODO: переделать
extension PollenToGaugeMapper on PollenModel {
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

  // List<GaugeModel> toGaugeModelsAuxiliary(
  //     BuildContext context, WidgetRef ref, ProfileDataModel profile) {
  //   List<PollenLevel> grassList = (grassPollenLevels.where(
  //     (element) => profile.allergens.any(
  //       (innerElement) => element.name == innerElement.enName,
  //     ),
  //   )).toList();
  //
  //   List<PollenLevel> weedList =
  //       (weedPollenLevels.where((element) => profile.allergens.any(
  //             (innerElement) => element.name == innerElement.enName,
  //           ))).toList();
  //
  //   List<PollenLevel> treeList =
  //       (treePollenLevels.where((element) => profile.allergens.any(
  //             (innerElement) => element.name == innerElement.enName,
  //           ))).toList();
  //   return grassList
  //       .map(
  //         (e) => GaugeModel(
  //           value: e.level.toDouble(),
  //           title: getLocalizedName(context, e.name),
  //           icon: Icons.grass,
  //           color: getColorForLevel(
  //             e.level.toDouble(),
  //           ),
  //         ),
  //       )
  //       .followedBy(
  //         weedList.map(
  //           (e) => GaugeModel(
  //               value: e.level.toDouble(),
  //               title: getLocalizedName(context, e.name),
  //               icon: Icons.nature,
  //               color: getColorForLevel(
  //                 e.level.toDouble(),
  //               )),
  //         ),
  //       )
  //       .followedBy(
  //         treeList.map(
  //           (e) => GaugeModel(
  //             value: e.level.toDouble(),
  //             title: getLocalizedName(context, e.name),
  //             icon: Icons.park,
  //             color: getColorForLevel(
  //               e.level.toDouble(),
  //             ),
  //           ),
  //         ),
  //       )
  //       .toList();
  // }
}
