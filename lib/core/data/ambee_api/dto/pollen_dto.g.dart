// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollen_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollenDTO _$PollenDTOFromJson(Map<String, dynamic> json) => PollenDTO(
      json['Count'] == null
          ? null
          : PollenCountDTO.fromJson(json['Count'] as Map<String, dynamic>),
      json['Risk'] == null
          ? null
          : PollenRiskDTO.fromJson(json['Risk'] as Map<String, dynamic>),
      json['Species'] == null
          ? null
          : PollenSpeciesDTO.fromJson(json['Species'] as Map<String, dynamic>),
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$PollenDTOToJson(PollenDTO instance) => <String, dynamic>{
      'Count': instance.count?.toJson(),
      'Risk': instance.risk?.toJson(),
      'Species': instance.species?.toJson(),
      'updatedAt': instance.updatedAt,
    };

PollenCountDTO _$PollenCountDTOFromJson(Map<String, dynamic> json) =>
    PollenCountDTO(
      json['grass_pollen'] as int,
      json['tree_pollen'] as int,
      json['weed_pollen'] as int,
    );

Map<String, dynamic> _$PollenCountDTOToJson(PollenCountDTO instance) =>
    <String, dynamic>{
      'grass_pollen': instance.grassPollen,
      'tree_pollen': instance.treePollen,
      'weed_pollen': instance.weedPollen,
    };

PollenRiskDTO _$PollenRiskDTOFromJson(Map<String, dynamic> json) =>
    PollenRiskDTO(
      json['grass_pollen'] as String,
      json['tree_pollen'] as String,
      json['weed_pollen'] as String,
    );

Map<String, dynamic> _$PollenRiskDTOToJson(PollenRiskDTO instance) =>
    <String, dynamic>{
      'grass_pollen': instance.grassPollen,
      'tree_pollen': instance.treePollen,
      'weed_pollen': instance.weedPollen,
    };

PollenSpeciesDTO _$PollenSpeciesDTOFromJson(Map<String, dynamic> json) =>
    PollenSpeciesDTO(
      Map<String, int>.from(json['Grass'] as Map),
      Map<String, int>.from(json['Tree'] as Map),
      Map<String, int>.from(json['Weed'] as Map),
      json['Others'] as int,
    );

Map<String, dynamic> _$PollenSpeciesDTOToJson(PollenSpeciesDTO instance) =>
    <String, dynamic>{
      'Grass': instance.grass,
      'Tree': instance.tree,
      'Weed': instance.weed,
      'Others': instance.other,
    };
