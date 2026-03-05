import 'package:flutter_test/flutter_test.dart';
import 'package:planbition_app/core/utils/geofencing_utils.dart';

void main() {
  group("haversineDistance", () {
    test("Amsterdam to Rotterdam is approximately 77 km", () {
      // Amsterdam Centraal: 52.3791, 4.8997
      // Rotterdam Centraal: 51.9244, 4.4777
      final dist = GeofencingUtils.haversineDistance(
        lat1: 52.3791,
        lon1: 4.8997,
        lat2: 51.9244,
        lon2: 4.4777,
      );
      // Should be roughly 57-80 km (straight line)
      expect(dist, greaterThan(50000));
      expect(dist, lessThan(90000));
    });

    test("same coordinates returns zero distance", () {
      final dist = GeofencingUtils.haversineDistance(
        lat1: 52.3791,
        lon1: 4.8997,
        lat2: 52.3791,
        lon2: 4.8997,
      );
      expect(dist, equals(0.0));
    });

    test("points approximately 500 m apart return ~500", () {
      // Move roughly 500 m north of Amsterdam (0.0045 degrees lat ~ 500 m)
      final dist = GeofencingUtils.haversineDistance(
        lat1: 52.3791,
        lon1: 4.8997,
        lat2: 52.3836,
        lon2: 4.8997,
      );
      expect(dist, greaterThan(400));
      expect(dist, lessThan(600));
    });

    test("distance is symmetric", () {
      final d1 = GeofencingUtils.haversineDistance(
        lat1: 52.3791, lon1: 4.8997, lat2: 51.9244, lon2: 4.4777,
      );
      final d2 = GeofencingUtils.haversineDistance(
        lat1: 51.9244, lon1: 4.4777, lat2: 52.3791, lon2: 4.8997,
      );
      expect((d1 - d2).abs(), lessThan(0.01));
    });
  });

  group("formatDistance", () {
    test("below 1000 m returns Xm format", () {
      expect(GeofencingUtils.formatDistance(250), equals("250 m"));
    });

    test("exactly 999 m returns 999m", () {
      expect(GeofencingUtils.formatDistance(999), equals("999 m"));
    });

    test("exactly 1000 m returns 1.0km", () {
      expect(GeofencingUtils.formatDistance(1000), equals("1.0 km"));
    });

    test("above 1000 m returns X.Xkm format", () {
      expect(GeofencingUtils.formatDistance(1500), equals("1.5 km"));
    });

    test("large distance returns correct km string", () {
      expect(GeofencingUtils.formatDistance(77000), equals("77.0 km"));
    });

    test("0 m returns 0m", () {
      expect(GeofencingUtils.formatDistance(0), equals("0 m"));
    });
  });

  group("GeofenceResult sealed types", () {
    test("GeofenceInsideRadius and GeofenceOutsideRadius are distinct types", () {
      const inside = GeofenceInsideRadius(distanceMeters: 100);
      const outside = GeofenceOutsideRadius(distanceMeters: 600);
      expect(inside, isA<GeofenceInsideRadius>());
      expect(outside, isA<GeofenceOutsideRadius>());
      expect(inside, isNot(isA<GeofenceOutsideRadius>()));
      expect(outside, isNot(isA<GeofenceInsideRadius>()));
    });

    test("GeofenceInsideRadius stores distanceMeters", () {
      const inside = GeofenceInsideRadius(distanceMeters: 123.45);
      expect(inside.distanceMeters, equals(123.45));
    });

    test("GeofenceOutsideRadius stores distanceMeters", () {
      const outside = GeofenceOutsideRadius(distanceMeters: 999.9);
      expect(outside.distanceMeters, equals(999.9));
    });

    test("both are subtypes of GeofenceResult", () {
      const inside = GeofenceInsideRadius(distanceMeters: 50);
      const outside = GeofenceOutsideRadius(distanceMeters: 1200);
      expect(inside, isA<GeofenceResult>());
      expect(outside, isA<GeofenceResult>());
    });
  });
}
