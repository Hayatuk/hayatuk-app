import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/home/presentation/home_map_options.dart';
import 'package:latlong2/latlong.dart';

/// Regression test for the NaN-camera crash ("LatLng is not finite").
///
/// Web Mercator is singular at the poles. Without zoom and latitude
/// constraints, ordinary pinch/fling gestures can drive the camera to
/// negative zoom and polar latitudes, where the projection math collapses
/// to NaN — after which every tile update throws. The seeded gesture fuzz
/// below reproduced that deterministically against unconstrained options
/// (camera reached lat 89.999…, zoom -0.05, then NaN on the next fling).
void main() {
  testWidgets('camera stays finite under adversarial gestures', (tester) async {
    final controller = MapController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FlutterMap(
            mapController: controller,
            options: homeMapOptions(
              initialCenter: const LatLng(36.7538, 3.0588),
            ),
            children: const [],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final rng = Random(42);
    final center = tester.getCenter(find.byType(FlutterMap));

    for (var i = 0; i < 150; i++) {
      final action = rng.nextInt(4);
      switch (action) {
        case 0: // plain pinch in/out
          final g1 = await tester.startGesture(center - const Offset(60, 0));
          final g2 = await tester.startGesture(center + const Offset(60, 0));
          final d = (rng.nextDouble() * 110 - 55);
          for (var s = 1; s <= 4; s++) {
            await g1.moveBy(Offset(-d / 4, 0));
            await g2.moveBy(Offset(d / 4, 0));
            await tester.pump(const Duration(milliseconds: 16));
          }
          await g1.up();
          await g2.up();
        case 1: // pinch with a finger added/removed mid-gesture
          final g1 = await tester.startGesture(center - const Offset(60, 0));
          final g2 = await tester.startGesture(center + const Offset(60, 0));
          await g1.moveBy(const Offset(-40, 0));
          await g2.moveBy(const Offset(40, 0));
          await tester.pump(const Duration(milliseconds: 16));
          final g3 = await tester.startGesture(center + const Offset(0, 80));
          await tester.pump(const Duration(milliseconds: 16));
          await g2.up();
          await tester.pump(const Duration(milliseconds: 16));
          for (var s = 1; s <= 6; s++) {
            await g1.moveBy(const Offset(9, 0));
            await g3.moveBy(const Offset(0, -12));
            await tester.pump(const Duration(milliseconds: 16));
          }
          await g1.up();
          await g3.up();
        case 2: // double-tap-hold drag zoom
          await tester.tapAt(center);
          await tester.pump(const Duration(milliseconds: 50));
          final g = await tester.startGesture(center);
          await tester.pump(const Duration(milliseconds: 50));
          for (var s = 1; s <= 5; s++) {
            await g.moveBy(Offset(0, rng.nextDouble() * 60 - 30));
            await tester.pump(const Duration(milliseconds: 16));
          }
          await g.up();
        case 3: // fast fling drag
          await tester.flingFrom(
            center,
            Offset(rng.nextDouble() * 300 - 150, rng.nextDouble() * 300 - 150),
            2500,
          );
      }
      await tester.pumpAndSettle(const Duration(milliseconds: 50));

      final e = tester.takeException();
      expect(e, isNull, reason: 'exception at iteration $i (action $action)');

      final c = controller.camera;
      final finite =
          c.center.latitude.isFinite &&
          c.center.longitude.isFinite &&
          c.zoom.isFinite;
      expect(
        finite,
        isTrue,
        reason:
            'non-finite camera at iteration $i (action $action): '
            'center=${c.center} zoom=${c.zoom}',
      );
    }
  });
}
