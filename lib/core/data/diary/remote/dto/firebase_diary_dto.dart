import 'package:json_annotation/json_annotation.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';

part 'firebase_diary_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FirebaseDiaryDto {
  final DiaryModel data;
  final String uid;

  FirebaseDiaryDto({required this.data, required this.uid});

  factory FirebaseDiaryDto.fromJson(Map<String, dynamic> json) {
    return _$FirebaseDiaryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FirebaseDiaryDtoToJson(this);
}
