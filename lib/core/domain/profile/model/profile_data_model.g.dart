// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      json['is_dark_theme'] as bool,
      (json['allergens'] as List<dynamic>)
          .map((e) => $enumDecode(_$AllergensEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'is_dark_theme': instance.isDarkTheme,
      'allergens':
          instance.allergens.map((e) => _$AllergensEnumMap[e]!).toList(),
    };

const _$AllergensEnumMap = {
  Allergens.hazel: 'hazel',
  Allergens.elm: 'elm',
  Allergens.alder: 'alder',
  Allergens.cottonWood: 'cottonWood',
  Allergens.oak: 'oak',
  Allergens.plane: 'plane',
  Allergens.birch: 'birch',
  Allergens.cypress: 'cypress',
  Allergens.mulberry: 'mulberry',
  Allergens.ash: 'ash',
  Allergens.maple: 'maple',
  Allergens.casuarina: 'casuarina',
  Allergens.acacia: 'acacia',
  Allergens.myrtaceae: 'myrtaceae',
  Allergens.willow: 'willow',
  Allergens.olive: 'olive',
  Allergens.pine: 'pine',
  Allergens.mugwort: 'mugwort',
  Allergens.chenopod: 'chenopod',
  Allergens.ragweed: 'ragweed',
  Allergens.nettle: 'nettle',
  Allergens.sedges: 'sedges',
  Allergens.aster: 'aster',
  Allergens.plantago: 'plantago',
  Allergens.rumex: 'rumex',
};
