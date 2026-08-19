import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/core/config/app_config.dart';
import 'package:hayatuk/core/location/fuzzy.dart';

void main() {
  group('fuzzyCoordinate', () {
    const grid = AppConfig.locationFuzzDegrees;

    test('snaps a coordinate to the configured grid', () {
      // Closest multiple of 0.01 to 36.7538 is 36.75.
      expect(fuzzyCoordinate(36.7538), closeTo(36.75, 1e-9));
    });

    test('is idempotent: snapping an already-snapped value is a no-op', () {
      final once = fuzzyCoordinate(3.0588);
      expect(fuzzyCoordinate(once), closeTo(once, 1e-9));
    });

    test('output is always an integer multiple of the grid', () {
      for (final coord in [0.0, -7.123, 51.9999, 36.75123]) {
        final snapped = fuzzyCoordinate(coord);
        expect(
          (snapped / grid - (snapped / grid).round()).abs(),
          lessThan(1e-6),
        );
      }
    });
  });
}
