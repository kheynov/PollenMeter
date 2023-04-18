import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pollen_meter/core/domain/profile/enums/allergen.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final data = ProfileDataModel(ThemeTypes.dark, [
    Allergen.alder,
    Allergen.ash,
    Allergen.birch,
    Allergen.chenopod,
    Allergen.cypress,
    Allergen.elm,
  ]);

  await ServiceLocator.initApp();

  await GetIt.instance.allReady();

  await Future.delayed(const Duration(seconds: 1));

  final repository = ServiceLocator.profileDataRepository;

  await repository.saveProfile(data);
  final profile = await repository.getProfile();
  debugPrint(profile.toString());
}
