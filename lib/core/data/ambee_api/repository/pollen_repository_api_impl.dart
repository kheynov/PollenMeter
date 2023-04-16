import 'package:pollen_meter/core/data/ambee_api/ambee_api.dart';
import 'package:pollen_meter/core/data/ambee_api/mappers/api_to_model_mapper.dart';
import 'package:pollen_meter/core/domain/ambee_api/repository/pollen_repository.dart';

import '../../../domain/ambee_api/models/pollen_model.dart';

class PollenRepositoryApiImpl implements PollenRepository {
  final AmbeeClient ambeeClient;

  PollenRepositoryApiImpl({required this.ambeeClient});

  @override
  Future<PollenModel> fetchData(
      {required double latitude, required double longitude}) async {
    final res = await ambeeClient.getPollenData(
      latitude: latitude,
      longitude: longitude,
    );
    return res.toPollenModel();
  }
}
