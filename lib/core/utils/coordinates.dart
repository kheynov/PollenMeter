import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Coordinates {
  final double latitude, longitude;

  Coordinates(this.latitude, this.longitude);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinates &&
          other.latitude == latitude &&
          other.longitude == longitude;

  double getDistance(Coordinates other) {
    return sqrt(pow(other.latitude - latitude, 2) +
        pow(other.longitude - longitude, 2));
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() {
    return 'Coordinates{latitude: $latitude, longitude: $longitude}';
  }

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
