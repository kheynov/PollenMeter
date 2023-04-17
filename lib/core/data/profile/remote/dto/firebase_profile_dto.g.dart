// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseProfileDto _$FirebaseProfileDtoFromJson(Map<String, dynamic> json) =>
    FirebaseProfileDto(
      data: ProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$FirebaseProfileDtoToJson(FirebaseProfileDto instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'uid': instance.uid,
    };
