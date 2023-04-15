import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core_ui/models/gauge_model.dart';
import '../models/pollen_model.dart';

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
      ),
      GaugeModel(
        value: count.weedPollen.toDouble(),
        title: riskNames[risk.weedPollen] ?? 'Error',
        icon: Icons.nature,
        color: riskColors[risk.weedPollen] ?? Colors.white60,
      ),
      GaugeModel(
        value: count.grassPollen.toDouble(),
        title: riskNames[risk.grassPollen] ?? 'Error',
        icon: Icons.grass,
        color: riskColors[risk.grassPollen] ?? Colors.white60,
      ),
    ];
    result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return result[0];
  }

  Future<List<GaugeModel>> toGaugeModelsAuxiliary(
      BuildContext context, WidgetRef ref) async {
    // ProfileDataModel profile =
    //     await ServiceLocator.profileDataRepository.getProfile();
    // List<PollenLevel> result = (grassPollenLevels.where(
    //   (element) => profile.allergens.any(
    //     (innerElement) => element.name == innerElement.enName,
    //   ),
    // ))
    //     .followedBy(weedPollenLevels.where((element) => false) as Iterable<GrassPollenLevel>)
    //     .followedBy(treePollenLevels.where((element) => false) as Iterable<GrassPollenLevel>)
    //     .toList();
    throw UnimplementedError();
  }
}
