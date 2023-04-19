// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) => DiaryModel(
      json['message'] as String,
      $enumDecode(_$WellBeingStateEnumMap, json['state']),
    );

Map<String, dynamic> _$DiaryModelToJson(DiaryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'state': _$WellBeingStateEnumMap[instance.state]!,
    };

const _$WellBeingStateEnumMap = {
  WellBeingState.dead: 'dead',
  WellBeingState.bad: 'bad',
  WellBeingState.sad: 'sad',
  WellBeingState.ok: 'ok',
  WellBeingState.good: 'good',
  WellBeingState.veryGood: 'veryGood',
};
