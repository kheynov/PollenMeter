import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_diary_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LocalDiaryDto {
  final List<DiaryModel> data;

  LocalDiaryDto(this.data);

  factory LocalDiaryDto.fromJson(Map<String, dynamic> json) {
    return _$LocalDiaryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocalDiaryDtoToJson(this);
}
