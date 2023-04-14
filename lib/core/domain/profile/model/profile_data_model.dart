import 'package:pollen_meter/core/domain/profile/enums/allergen_types.dart';

class ProfileDataModel {
  final bool theme;
  final List<AllergenTypes> allergens;

  ProfileDataModel(this.theme, this.allergens);

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    // TODO: add parsing
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    //TODO: add serialization
    throw UnimplementedError();
  }
}
