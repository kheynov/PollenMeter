import 'package:location/location.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:pollen_meter/dashboard/domain/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final location = Location();

  @override
  Future<Coordinates> getLocation() async {
    final locationData = await location.getLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      throw LocationException('Cannot get current location');
    }
    return Coordinates(locationData.latitude!, locationData.longitude!);
  }
}

class LocationException implements Exception {
  String cause;

  LocationException(this.cause);
}
