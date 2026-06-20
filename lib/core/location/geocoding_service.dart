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
}
