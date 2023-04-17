import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergens.dart';

extension LocalizedBuildContextExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

  String stringFromLocAllergens(Allergens allergens) {
    final appLocal = AppLocalizations.of(this)!;
    switch (allergens) {
      case Allergens.hazel:
        return appLocal.hazel;
      case Allergens.elm:
        return appLocal.elm;
      case Allergens.alder:
        return appLocal.alder;
      case Allergens.cottonWood:
        return appLocal.cottonWood;
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
