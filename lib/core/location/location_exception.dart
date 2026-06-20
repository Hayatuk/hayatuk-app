import 'location_error_type.dart';

class LocationException implements Exception {
  final LocationErrorType type;

  const LocationException(this.type);
}
