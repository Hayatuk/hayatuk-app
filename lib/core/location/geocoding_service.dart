import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<String?> resolveRegion(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isEmpty) return null;
      return placemarks.first.administrativeArea;
    } catch (_) {
      return null;
    }
  }

  Future<String?> resolveCity(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isEmpty) return null;
      final place = placemarks.first;
      for (final candidate in [
        place.locality,
        place.subAdministrativeArea,
        place.administrativeArea,
      ]) {
        if (candidate != null && candidate.isNotEmpty) return candidate;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
