// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      $enumDecode(_$ThemeTypesEnumMap, json['theme']),
      (json['allergens'] as List<dynamic>)
          .map((e) => $enumDecode(_$AllergenEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'theme': _$ThemeTypesEnumMap[instance.theme]!,
      'allergens':
          instance.allergens.map((e) => _$AllergenEnumMap[e]!).toList(),
    };

const _$ThemeTypesEnumMap = {
  ThemeTypes.dark: 'dark',
  ThemeTypes.light: 'light',
  ThemeTypes.system: 'system',
};

const _$AllergenEnumMap = {
  Allergen.hazel: 'hazel',
  Allergen.elm: 'elm',
  Allergen.alder: 'alder',
  Allergen.poplar: 'poplar',
  Allergen.oak: 'oak',
  Allergen.plane: 'plane',
  Allergen.birch: 'birch',
  Allergen.cypress: 'cypress',
  Allergen.mulberry: 'mulberry',
  Allergen.ash: 'ash',
  Allergen.maple: 'maple',
  Allergen.casuarina: 'casuarina',
  Allergen.acacia: 'acacia',
  Allergen.myrtaceae: 'myrtaceae',
  Allergen.willow: 'willow',
  Allergen.olive: 'olive',
  Allergen.pine: 'pine',
  Allergen.mugwort: 'mugwort',
  Allergen.chenopod: 'chenopod',
  Allergen.ragweed: 'ragweed',
  Allergen.nettle: 'nettle',
  Allergen.sedges: 'sedges',
  Allergen.aster: 'aster',
  Allergen.plantago: 'plantago',
  Allergen.rumex: 'rumex',
  Allergen.grass: 'grass',
};
