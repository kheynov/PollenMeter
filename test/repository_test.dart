import 'package:flutter/cupertino.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await ServiceLocator.initApp();

  var fetchDataUseCase = ServiceLocator.fetchDataFromAmbeeUseCase;
  var res = await fetchDataUseCase(coordinates: Coordinates(45, 47));
  debugPrint(res.toString());
}
