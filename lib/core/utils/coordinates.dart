class Coordinates {
  final double latitude, longitude;

  Coordinates(this.latitude, this.longitude);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinates &&
          other.latitude == latitude &&
          other.longitude == longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() {
    return 'Coordinates{latitude: $latitude, longitude: $longitude}';
  }
}
