import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_profile_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FirebaseProfileDto {
  final ProfileDataModel data;
  final String uid;

  FirebaseProfileDto({required this.data, required this.uid});

  factory FirebaseProfileDto.fromJson(Map<String, dynamic> json) {
    return _$FirebaseProfileDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FirebaseProfileDtoToJson(this);
}
