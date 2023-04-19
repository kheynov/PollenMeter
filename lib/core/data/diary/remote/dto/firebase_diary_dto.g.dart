// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_diary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseDiaryDto _$FirebaseDiaryDtoFromJson(Map<String, dynamic> json) =>
    FirebaseDiaryDto(
      data: DiaryModel.fromJson(json['data'] as Map<String, dynamic>),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$FirebaseDiaryDtoToJson(FirebaseDiaryDto instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'uid': instance.uid,
    };
