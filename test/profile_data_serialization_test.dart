import 'package:flutter/cupertino.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen_types.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final data = ProfileDataModel(true, [
    Allergens.alder,
    Allergens.ash,
    Allergens.birch,
    Allergens.chenopod,
    Allergens.cypress,
    Allergens.elm,
  ]);

  debugPrint(data.toJson() as String?);

  await ServiceLocator.initApp();

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({});

  final repository = ServiceLocator.profileDataRepository;

  await repository.saveProfile(data);
  final profile = await repository.getProfile();
  debugPrint(profile.toString());
}
