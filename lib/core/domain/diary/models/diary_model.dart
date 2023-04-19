import 'package:json_annotation/json_annotation.dart';
import 'package:pollen_meter/core/domain/diary/enums/well_being_state.dart';

part 'diary_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DiaryModel {
  final String message;
  final WellBeingState state;

  const DiaryModel(this.message, this.state);

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    return _$DiaryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiaryModelToJson(this);
}
