import 'package:pollen_meter/core/domain/models/pollen_model.dart';

abstract class PollenRepository {
  Future<PollenModel> fetchData({
    required int latitude,
    required int longitude,
  });
}
