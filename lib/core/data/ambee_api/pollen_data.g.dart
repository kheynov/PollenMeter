// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollenDTO _$PollenDTOFromJson(Map<String, dynamic> json) => PollenDTO(
      PollenCount.fromJson(json['count'] as Map<String, dynamic>),
      PollenRisk.fromJson(json['risk'] as Map<String, dynamic>),
      PollenSpecies.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PollenDTOToJson(PollenDTO instance) => <String, dynamic>{
      'count': instance.count.toJson(),
      'risk': instance.risk.toJson(),
      'species': instance.species.toJson(),
    };

PollenCount _$PollenCountFromJson(Map<String, dynamic> json) => PollenCount(
      json['grass_pollen'] as String,
      json['tree_pollen'] as String,
      json['weed_pollen'] as String,
    );

Map<String, dynamic> _$PollenCountToJson(PollenCount instance) =>
    <String, dynamic>{
      'grass_pollen': instance.grassPollen,
      'tree_pollen': instance.treePollen,
      'weed_pollen': instance.weedPollen,
    };

PollenRisk _$PollenRiskFromJson(Map<String, dynamic> json) => PollenRisk(
      json['grass_pollen'] as String,
      json['tree_pollen'] as String,
      json['weed_pollen'] as String,
    );

Map<String, dynamic> _$PollenRiskToJson(PollenRisk instance) =>
    <String, dynamic>{
      'grass_pollen': instance.grassPollen,
      'tree_pollen': instance.treePollen,
      'weed_pollen': instance.weedPollen,
    };

PollenSpecies _$PollenSpeciesFromJson(Map<String, dynamic> json) =>
    PollenSpecies(
      Map<String, int>.from(json['Grass'] as Map),
      Map<String, int>.from(json['Tree'] as Map),
      Map<String, int>.from(json['Weed'] as Map),
      json['Others'] as int,
    );

Map<String, dynamic> _$PollenSpeciesToJson(PollenSpecies instance) =>
    <String, dynamic>{
      'Grass': instance.grass,
      'Tree': instance.tree,
      'Weed': instance.weed,
      'Others': instance.other,
    };
