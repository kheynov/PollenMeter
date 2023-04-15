import 'package:flutter/cupertino.dart';
import 'package:pollen_meter/core/utils/di.dart';

void main() async {
  await ServiceLocator.initApp();
  var repository = ServiceLocator.pollenRepository;
  var res = await repository.fetchData(latitude: 45, longitude: 47);
  debugPrint(res.toString());
}
