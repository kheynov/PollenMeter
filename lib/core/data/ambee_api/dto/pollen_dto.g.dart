// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollen_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollenDTO _$PollenDTOFromJson(Map<String, dynamic> json) => PollenDTO(
      PollenCount.fromJson(json['Count'] as Map<String, dynamic>),
      PollenRisk.fromJson(json['Risk'] as Map<String, dynamic>),
      PollenSpecies.fromJson(json['Species'] as Map<String, dynamic>),
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$PollenDTOToJson(PollenDTO instance) => <String, dynamic>{
      'Count': instance.count.toJson(),
      'Risk': instance.risk.toJson(),
      'Species': instance.species.toJson(),
      'updatedAt': instance.updatedAt,
    };

PollenCount _$PollenCountFromJson(Map<String, dynamic> json) => PollenCount(
      json['grass_pollen'] as int,
      json['tree_pollen'] as int,
      json['weed_pollen'] as int,
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
