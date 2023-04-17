import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen_types.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergens.dart';

extension LocalizedBuildContextExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

  String fromPollenLevel({required AllergenType allergenType, required int count}){
    switch (allergenType) {
      case AllergenType.weed:
        return _levelRiskName(count: count, level1: 20, level2: 77, level3: 266);
      case AllergenType.tree:
        return _levelRiskName(count: count, level1: 95, level2: 207, level3: 703);
      case AllergenType.grass:
        return _levelRiskName(count: count, level1: 29, level2: 60, level3: 341);
    }
  }

  String fromAllergensType(AllergenType allergenType){
    switch (allergenType) {
      case AllergenType.weed:
        return loc.weedPollen;
      case AllergenType.tree:
        return loc.treePollen;
      case AllergenType.grass:
        return loc.grassPollen;
    }
  }

  String _levelRiskName({required int count, required int level1, required int level2, required int level3,}) {
    if (count <= level1) {
      return loc.lowRisk;
    } else if (count <= level2) {
      return loc.moderateRisk;
    } else if (count <= level3) {
      return loc.highRisk;
    } else {
      return loc.veryHighRisk;
    }
  }

  String fromAllergens(Allergens allergens) {
    final appLocal = AppLocalizations.of(this)!;
    switch (allergens) {
      case Allergens.hazel:
        return appLocal.hazel;
      case Allergens.elm:
        return appLocal.elm;
      case Allergens.alder:
        return appLocal.alder;
      case Allergens.poplar:
        return appLocal.poplar;
      case Allergens.oak:
        return appLocal.oak;
      case Allergens.plane:
        return appLocal.plane;
      case Allergens.birch:
        return appLocal.birch;
      case Allergens.cypress:
        return appLocal.cypress;
      case Allergens.mulberry:
        return appLocal.mulberry;
      case Allergens.ash:
        return appLocal.ash;
      case Allergens.maple:
        return appLocal.maple;
      case Allergens.casuarina:
        return appLocal.casuarina;
      case Allergens.acacia:
        return appLocal.acacia;
      case Allergens.myrtaceae:
        return appLocal.myrtaceae;
      case Allergens.willow:
        return appLocal.willow;
      case Allergens.olive:
        return appLocal.olive;
      case Allergens.pine:
        return appLocal.pine;
      case Allergens.mugwort:
        return appLocal.mugwort;
      case Allergens.chenopod:
        return appLocal.chenopod;
      case Allergens.ragweed:
        return appLocal.ragweed;
      case Allergens.nettle:
        return appLocal.nettle;
      case Allergens.sedges:
        return appLocal.sedges;
      case Allergens.aster:
        return appLocal.aster;
      case Allergens.plantago:
        return appLocal.plantago;
      case Allergens.rumex:
        return appLocal.rumex;
      case Allergens.grass:
        return appLocal.grass;
    }
  }


}
