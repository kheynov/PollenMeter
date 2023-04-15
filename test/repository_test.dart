import 'package:flutter/cupertino.dart';
import 'package:pollen_meter/core/data/ambee_api/ambee_api.dart';
import 'package:pollen_meter/core/data/ambee_api/repository/pollen_repository_api_impl.dart';

void main() async {
  var service = AmbeeClient();
  var repository = PollenRepositoryApiImpl(service);
  var res = await repository.fetchData(latitude: 45, longitude: 47);
  debugPrint(res.toString());
}
