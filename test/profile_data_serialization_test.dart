import 'package:flutter/cupertino.dart';
import 'package:pollen_meter/core/data/profile/local/profile_local_data_source.dart';
import 'package:pollen_meter/core/data/profile/repository/profile_data_repository_local_impl.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen_types.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final data = ProfileDataModel(ThemeTypes.dark, [
    Allergens.alder,
    Allergens.ash,
    Allergens.birch,
    Allergens.chenopod,
    Allergens.cypress,
    Allergens.elm,
  ]);

  debugPrint(data.toJson() as String?);

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({});

  final prefs = await SharedPreferences.getInstance();
  final localStorage = ProfileLocalDataStore(sharedPreferences: prefs);
  final repository =
      ProfileDataRepositoryLocalImpl(profileLocalDataSource: localStorage);

  await repository.saveProfile(data);
  final profile = await repository.getProfile();
  debugPrint(profile.toString());
}
