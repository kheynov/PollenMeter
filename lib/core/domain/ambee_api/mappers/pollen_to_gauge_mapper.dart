import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/core/utils/colors.dart';
import '../../../../core_ui/gauge/models/gauge_model.dart';
import '../../profile/enums/allergen_type.dart';
import '../../profile/model/profile_data_model.dart';
import '../models/pollen_model.dart';

//TODO: переделать

/*
    Get the plant category with the highest risk. Make a list of the three categories,
    sort it, and take the 1st element.
 */
extension PollenToGaugeMapper on PollenModel {
  GaugeModel toGaugeModelMain(BuildContext context) {
    List result = [
      GaugeModel(
        value: count.treePollen.toDouble(),
        title: context.fromPollenLevel(
            allergenType: AllergenType.tree, count: count.treePollen),
        icon: Icons.park,
        color: riskColor(context.fromPollenLevelUnlocalized(
            allergenType: AllergenType.tree, count: count.treePollen)),
        bottomTitle: context.fromAllergenType(AllergenType.tree),
        allergenType: AllergenType.tree,
      ),
      GaugeModel(
        value: count.weedPollen.toDouble(),
        title: context.fromPollenLevel(
            allergenType: AllergenType.weed, count: count.weedPollen),
        icon: Icons.nature,
        color: riskColor(context.fromPollenLevelUnlocalized(
            allergenType: AllergenType.weed, count: count.weedPollen)),
        bottomTitle: context.fromAllergenType(AllergenType.weed),
        allergenType: AllergenType.weed,
      ),
      GaugeModel(
        value: count.grassPollen.toDouble(),
        title: context.fromPollenLevel(
            allergenType: AllergenType.grass, count: count.grassPollen),
        icon: Icons.grass,
        color: riskColor(context.fromPollenLevelUnlocalized(
            allergenType: AllergenType.grass, count: count.grassPollen)),
        bottomTitle: context.fromAllergenType(AllergenType.grass),
        allergenType: AllergenType.grass,
      ),
    ];
    result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return result[0];
  }

/*
    Make three lists of the categories, filter them by the user's allergens,
    and then make a single combined list of GaugeModels from the three filtered lists.
 */
  List<GaugeModel> toGaugeModelsAuxiliary(
      BuildContext context, WidgetRef ref, ProfileDataModel profile) {
    List<PollenLevel> grassList = (grassPollenLevels.where(
      (apiElement) => profile.allergens.any(
        (profileElement) => apiElement.allergen == profileElement,
      ),
    )).toList();

    List<PollenLevel> weedList = (weedPollenLevels.where(
      (apiElement) => profile.allergens.any(
        (profileElement) => apiElement.allergen == profileElement,
      ),
    )).toList();
    List<PollenLevel> treeList = (treePollenLevels.where(
      (apiElement) => profile.allergens.any(
        (profileElement) => apiElement.allergen == profileElement,
      ),
    )).toList();

    return grassList
        .map(
          (pollenLevel) => GaugeModel(
            value: pollenLevel.level.toDouble(),
            title: context.fromAllergen(pollenLevel.allergen),
            icon: Icons.grass,
            color: riskColor(context.fromPollenLevelUnlocalized(
                allergenType: AllergenType.grass, count: pollenLevel.level)),
            allergenType: AllergenType.grass,
          ),
        )
        .followedBy(
          weedList.map(
            (pollenLevel) => GaugeModel(
              value: pollenLevel.level.toDouble(),
              title: context.fromAllergen(pollenLevel.allergen),
              icon: Icons.nature,
              color: riskColor(context.fromPollenLevelUnlocalized(
                  allergenType: AllergenType.weed, count: pollenLevel.level)),
              allergenType: AllergenType.weed,
            ),
          ),
        )
        .followedBy(
          treeList.map(
            (pollenLevel) => GaugeModel(
              value: pollenLevel.level.toDouble(),
              title: context.fromAllergen(pollenLevel.allergen),
              icon: Icons.park,
              color: riskColor(context.fromPollenLevelUnlocalized(
                  allergenType: AllergenType.tree, count: pollenLevel.level)),
              allergenType: AllergenType.tree,
            ),
          ),
        )
        .toList();
  }
}
