import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Web Mercator is only defined for latitudes within ±85.05112878°; the
/// projection is singular at the poles.
const _maxMercatorLatitude = 85.05112878;

/// Options for the home screen map.
///
/// The zoom and camera constraints are load-bearing: without them, ordinary
/// pinch/fling gestures can drive the camera to negative zoom levels and
/// polar latitudes where the projection math collapses to NaN, after which
/// every tile update throws `LatLng is not finite` (see
/// home_map_options_test.dart).
MapOptions homeMapOptions({required LatLng initialCenter}) {
  return MapOptions(
    initialCenter: initialCenter,
    initialZoom: 12,
    minZoom: 3,
    maxZoom: 19,
    cameraConstraint: CameraConstraint.containCenter(
      bounds: LatLngBounds(
        const LatLng(-_maxMercatorLatitude, -180),
        const LatLng(_maxMercatorLatitude, 180),
      ),
    ),
  );
}
