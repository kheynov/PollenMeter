import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getLocalizedName(BuildContext context, String apiName) {
  //TODO: this probably needs to go somewhere else...
  Map<String, String?> localizedAssets = {
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
    'Grass / Poaceae': AppLocalizations.of(context)?.grass,
  };
  return localizedAssets[apiName] ?? apiName;
}
