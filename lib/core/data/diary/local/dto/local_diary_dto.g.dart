// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_diary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalDiaryDto _$LocalDiaryDtoFromJson(Map<String, dynamic> json) =>
    LocalDiaryDto(
      (json['data'] as List<dynamic>)
          .map((e) => DiaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalDiaryDtoToJson(LocalDiaryDto instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
