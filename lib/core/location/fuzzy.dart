// Snap coordinates to a grid before sending to the server.
// This keeps the exact location of users on their device only.
import 'package:hayatuk/core/config/app_config.dart';

double fuzzyCoordinate(double coord) {
  return (coord / AppConfig.locationFuzzDegrees).round() *
      AppConfig.locationFuzzDegrees;
}
