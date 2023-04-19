import 'package:flutter/material.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/core/extensions/theme_colors_build_context.dart';
import '../../../../core_ui/pollen/models/pollen_ui_model.dart';
import '../../profile/enums/allergen_type.dart';
import '../../profile/model/profile_data_model.dart';
import '../models/pollen_model.dart';

//TODO: переделать

/*
    Get the plant category with the highest risk. Make a list of the three categories,
    sort it, and take the 1st element.
 */
extension PollenToPollenUIMapper on PollenModel {
  PollenUIModel toPollenModelBasic(BuildContext context) {
    List result = [
      PollenUIModel(
        value: count.treePollen.toDouble(),
        title: context.fromPollenLevel(
            allergenType: AllergenType.tree, count: count.treePollen),
        icon: Icons.park,
        color: context.fromRiskLevel(context.fromPollenLevelUnlocalized(
            allergenType: AllergenType.tree, count: count.treePollen)),
        bottomTitle: context.fromAllergenType(AllergenType.tree),
        allergenType: AllergenType.tree,
      ),
      PollenUIModel(
        value: count.weedPollen.toDouble(),
        title: context.fromPollenLevel(
            allergenType: AllergenType.weed, count: count.weedPollen),
        icon: Icons.nature,
        color: context.fromRiskLevel(context.fromPollenLevelUnlocalized(
            allergenType: AllergenType.weed, count: count.weedPollen)),
        bottomTitle: context.fromAllergenType(AllergenType.weed),
        allergenType: AllergenType.weed,
      ),
      PollenUIModel(
        value: count.grassPollen.toDouble(),
        title: context.fromPollenLevel(
            allergenType: AllergenType.grass, count: count.grassPollen),
        icon: Icons.grass,
        color: context.fromRiskLevel(context.fromPollenLevelUnlocalized(
            allergenType: AllergenType.grass, count: count.grassPollen)),
        bottomTitle: context.fromAllergenType(AllergenType.grass),
        allergenType: AllergenType.grass,
      ),
    ];
    result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return result[0];
  }

  List<PollenUIModel> toPollenUIModelsEverything(BuildContext context) {
    List<PollenUIModel> result = weedPollenLevels
        .map(
          (e) => PollenUIModel(
            value: e.level.toDouble(),
            title: context.fromAllergen(e.allergen),
            icon: Icons.nature,
            color: context.fromRiskLevel(
              context.fromPollenLevelUnlocalized(
                  allergenType: AllergenType.weed, count: e.level),
            ),
            allergenType: AllergenType.weed,
          ),
        )
        .followedBy(
          grassPollenLevels.map(
            (e) => PollenUIModel(
              value: e.level.toDouble(),
              title: context.fromAllergen(e.allergen),
              icon: Icons.grass,
              color: context.fromRiskLevel(
                context.fromPollenLevelUnlocalized(
                    allergenType: AllergenType.grass, count: e.level),
              ),
              allergenType: AllergenType.grass,
            ),
          ),
        )
        .followedBy(
          treePollenLevels.map(
            (e) => PollenUIModel(
                value: e.level.toDouble(),
                title: context.fromAllergen(e.allergen),
                icon: Icons.park,
                color: context.fromRiskLevel(
                  context.fromPollenLevelUnlocalized(
                      allergenType: AllergenType.tree, count: e.level),
                ),
                allergenType: AllergenType.tree),
          ),
        )
        .toList();
    result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return result;
  }

/*
    Make three lists of the categories, filter them by the user's allergens,
    and then make a single combined list of GaugeModels from the three filtered lists.
 */
  List<PollenUIModel> toPollenUIModelsWithPrefs(
      BuildContext context, ProfileDataModel profile) {
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
    List<PollenUIModel> result = grassList
        .map(
          (pollenLevel) => PollenUIModel(
            value: pollenLevel.level.toDouble(),
            title: context.fromAllergen(pollenLevel.allergen),
            icon: Icons.grass,
            color: context.fromRiskLevel(
              context.fromPollenLevelUnlocalized(
                  allergenType: AllergenType.grass, count: pollenLevel.level),
            ),
            allergenType: AllergenType.grass,
          ),
        )
        .followedBy(
          weedList.map(
            (pollenLevel) => PollenUIModel(
              value: pollenLevel.level.toDouble(),
              title: context.fromAllergen(pollenLevel.allergen),
              icon: Icons.nature,
              color: context.fromRiskLevel(
                context.fromPollenLevelUnlocalized(
                    allergenType: AllergenType.weed, count: pollenLevel.level),
              ),
              allergenType: AllergenType.weed,
            ),
          ),
        )
        .followedBy(
          treeList.map(
            (pollenLevel) => PollenUIModel(
              value: pollenLevel.level.toDouble(),
              title: context.fromAllergen(pollenLevel.allergen),
              icon: Icons.park,
              color: context.fromRiskLevel(
                context.fromPollenLevelUnlocalized(
                    allergenType: AllergenType.tree, count: pollenLevel.level),
              ),
              allergenType: AllergenType.tree,
            ),
          ),
        )
        .toList();
    result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
    return result;
  }
}
