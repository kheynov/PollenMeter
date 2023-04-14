import 'package:json_annotation/json_annotation.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen_types.dart';

part 'profile_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileDataModel {
  bool isDarkTheme;
  List<Allergens> allergens;

  ProfileDataModel(this.isDarkTheme, this.allergens);

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);

  @override
  String toString() {
    return 'ProfileDataModel{isDarkTheme: $isDarkTheme, allergens: $allergens}';
  }
}
