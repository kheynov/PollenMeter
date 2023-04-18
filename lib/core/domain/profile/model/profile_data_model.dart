import 'package:json_annotation/json_annotation.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen.dart';

part 'profile_data_model.g.dart';

enum ThemeTypes { dark, light, system }

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileDataModel {
  ThemeTypes theme;
  List<Allergen> allergens;

  ProfileDataModel(this.theme, this.allergens);

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);

  @override
  String toString() {
    return 'ProfileDataModel{theme: $theme, allergens: $allergens}';
  }
}
