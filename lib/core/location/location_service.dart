import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:hayatuk/core/permissions/permission_gate.dart';

import 'location_error_type.dart';
import 'location_exception.dart';

class LocationService {
  static const _fixTimeout = Duration(seconds: 60);

  Future<Position> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationException(LocationErrorType.servicesDisabled);
    }
    var permission = await PermissionGate.serialize(() async {
      var p = await Geolocator.checkPermission();
      if (p == LocationPermission.denied) {
        p = await Geolocator.requestPermission();
      }
      return p;
    });
    if (permission == LocationPermission.denied) {
      throw const LocationException(LocationErrorType.permissionDenied);
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationException(LocationErrorType.permissionDeniedForever);
    }

    try {
      final knownPos = await Geolocator.getLastKnownPosition();

      if (knownPos != null &&
          DateTime.now().difference(knownPos.timestamp) <
              const Duration(minutes: 15)) {
        return knownPos;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: _fixTimeout,
        ),
      );
    } on TimeoutException {
      throw const LocationException(LocationErrorType.timeout);
    }
  }
}
