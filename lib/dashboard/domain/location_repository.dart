import 'package:pollen_meter/core/utils/coordinates.dart';

abstract class LocationRepository {
  Future<Coordinates> getLocation();
}
