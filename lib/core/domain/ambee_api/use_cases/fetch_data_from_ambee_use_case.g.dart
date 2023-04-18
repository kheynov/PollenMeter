// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_data_from_ambee_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmbeeApiCacheDto _$AmbeeApiCacheDtoFromJson(Map<String, dynamic> json) =>
    AmbeeApiCacheDto(
      Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      DateTime.parse(json['timestamp'] as String),
      PollenModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmbeeApiCacheDtoToJson(AmbeeApiCacheDto instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates.toJson(),
      'timestamp': instance.timestamp.toIso8601String(),
      'data': instance.data.toJson(),
    };
