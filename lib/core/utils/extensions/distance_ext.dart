extension DistanceExt on double {
  /// Converts a distance in kilometers to miles.
  double kmToMiles() {
    return this * 0.621371;
  }

  /// Converts a distance in miles to kilometers.
  double milesToKm() {
    return this / 0.621371;
  }

  /// Converts a distance in meters to kilometers.
  double metersToKm() {
    return this / 1000;
  }

  /// Converts a distance in kilometers to meters.
  double kmToMeters() {
    return this * 1000;
  }
}
