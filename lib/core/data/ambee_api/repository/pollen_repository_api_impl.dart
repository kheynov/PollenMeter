import 'package:pollen_meter/core/data/ambee_api/ambee_api.dart';
import 'package:pollen_meter/core/data/ambee_api/mappers/api_to_model_mapper.dart';
import 'package:pollen_meter/core/domain/ambee_api/repository/pollen_repository.dart';

import '../../../domain/ambee_api/models/pollen_model.dart';

class PollenRepositoryApiImpl implements PollenRepository {
  final DioClient _service;

  PollenRepositoryApiImpl(this._service);

  @override
  Future<PollenModel> fetchData(
      {required int latitude, required int longitude}) async {
    final res =
        await _service.getPollenData(latitude: latitude, longitude: longitude);
    return res.toPollenModel();
  }
}
