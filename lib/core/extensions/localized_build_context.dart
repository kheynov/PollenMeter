import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen_type.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen.dart';
import 'package:pollen_meter/core/domain/profile/enums/risk_level.dart';

extension LocalizedBuildContextExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

/*
    Transform a count of pollen into a localized name of the risk level
 */
  String fromPollenLevel(
      {required AllergenType allergenType, required int count}) {
    switch (
        fromPollenLevelUnlocalized(allergenType: allergenType, count: count)) {
      case RiskLevel.low:
        return loc.lowRisk;
      case RiskLevel.moderate:
        return loc.moderateRisk;
      case RiskLevel.high:
        return loc.highRisk;
      case RiskLevel.veryHigh:
        return loc.veryHighRisk;
    }
  }

/*
    Get the localized name of an "allergen type" (tree grass etc)
 */
  String fromAllergenType(AllergenType allergenType) {
    switch (allergenType) {
      case AllergenType.weed:
        return loc.weedPollen;
      case AllergenType.tree:
        return loc.treePollen;
      case AllergenType.grass:
        return loc.grassPollen;
    }
  }
/*
    Get the raw enum of the risk level. This is used to get the color of the gauge and statistic widgets.
    The risk level is determined by the count of pollen and the "allergen type". The levels are:
    - Weed: 20, 77, 266
    - Tree: 95, 207, 703
    - Grass: 29, 60, 341

 */

  RiskLevel fromPollenLevelUnlocalized(
      {required AllergenType allergenType, required int count}) {
    switch (allergenType) {
      case AllergenType.weed:
        return _levelRiskName(
            count: count, level1: 20, level2: 77, level3: 266);
      case AllergenType.tree:
        return _levelRiskName(
            count: count, level1: 95, level2: 207, level3: 703);
      case AllergenType.grass:
        return _levelRiskName(
            count: count, level1: 29, level2: 60, level3: 341);
    }
  }

  RiskLevel _levelRiskName({
    required int count,
    required int level1,
    required int level2,
    required int level3,
  }) {
    if (count <= level1) {
      return RiskLevel.low;
    } else if (count <= level2) {
      return RiskLevel.moderate;
    } else if (count <= level3) {
      return RiskLevel.high;
    } else {
      return RiskLevel.veryHigh;
    }
  }

  double reasonableTypeLimit({required AllergenType allergenType}) {
    switch (allergenType) {
      case AllergenType.weed:
        return 300;
      case AllergenType.tree:
        return 800;
      case AllergenType.grass:
        return 400;
    }
  }

/*
    Get the localized name of an "allergen" (elm, oak, etc)
 */
  String fromAllergen(Allergen allergen) {
    final appLocal = AppLocalizations.of(this)!;
    switch (allergen) {
      case Allergen.hazel:
        return appLocal.hazel;
      case Allergen.elm:
        return appLocal.elm;
      case Allergen.alder:
        return appLocal.alder;
      case Allergen.poplar:
        return appLocal.poplar;
      case Allergen.oak:
        return appLocal.oak;
      case Allergen.plane:
        return appLocal.plane;
      case Allergen.birch:
        return appLocal.birch;
      case Allergen.cypress:
        return appLocal.cypress;
      case Allergen.mulberry:
        return appLocal.mulberry;
      case Allergen.ash:
        return appLocal.ash;
      case Allergen.maple:
        return appLocal.maple;
      case Allergen.casuarina:
        return appLocal.casuarina;
      case Allergen.acacia:
        return appLocal.acacia;
      case Allergen.myrtaceae:
        return appLocal.myrtaceae;
      case Allergen.willow:
        return appLocal.willow;
      case Allergen.olive:
        return appLocal.olive;
      case Allergen.pine:
        return appLocal.pine;
      case Allergen.mugwort:
        return appLocal.mugwort;
      case Allergen.chenopod:
        return appLocal.chenopod;
      case Allergen.ragweed:
        return appLocal.ragweed;
      case Allergen.nettle:
        return appLocal.nettle;
      case Allergen.sedges:
        return appLocal.sedges;
      case Allergen.aster:
        return appLocal.aster;
      case Allergen.plantago:
        return appLocal.plantago;
      case Allergen.rumex:
        return appLocal.rumex;
      case Allergen.grass:
        return appLocal.grass;
    }
  }
}
