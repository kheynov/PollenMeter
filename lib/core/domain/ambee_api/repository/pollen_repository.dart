import '../models/pollen_model.dart';

abstract class PollenRepository {
  Future<PollenModel> fetchData({
    required double latitude,
    required double longitude,
  });
}
