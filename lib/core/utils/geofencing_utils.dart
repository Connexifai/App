import 'dart:math' as math;

import 'package:geolocator/geolocator.dart';

import '../api/api_constants.dart';

/// Result of a geofencing check.
sealed class GeofenceResult {
  const GeofenceResult();
}

/// User is within the geofence radius.
final class GeofenceInsideRadius extends GeofenceResult {
  const GeofenceInsideRadius({required this.distanceMeters});
  final double distanceMeters;
}

/// User is outside the geofence radius.
final class GeofenceOutsideRadius extends GeofenceResult {
  const GeofenceOutsideRadius({required this.distanceMeters});
  final double distanceMeters;
}

/// Location permission is not granted.
final class GeofencePermissionDenied extends GeofenceResult {
  const GeofencePermissionDenied();
}

/// Location services are disabled on the device.
final class GeofenceLocationDisabled extends GeofenceResult {
  const GeofenceLocationDisabled();
}

/// An unexpected error occurred during the geofence check.
final class GeofenceError extends GeofenceResult {
  const GeofenceError(this.message);
  final String message;
}

/// Provides geofencing utilities for punch-in/out based on location.
///
/// Uses the Haversine formula to calculate the distance between the device's
/// current GPS position and the shift address coordinates.
abstract final class GeofencingUtils {
  /// Earth's mean radius in metres.
  static const double _earthRadiusMeters = 6371000.0;

  /// Calculates the distance in metres between two geographic coordinates
  /// using the Haversine formula.
  static double haversineDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return _earthRadiusMeters * c;
  }

  static double _degreesToRadians(double degrees) =>
      degrees * (math.pi / 180.0);

  /// Checks whether the current device location is within
  /// [ApiConstants.geofenceRadiusMeters] of the given target coordinates.
  static Future<GeofenceResult> checkGeofence({
    required double targetLatitude,
    required double targetLongitude,
    double radiusMeters = ApiConstants.geofenceRadiusMeters,
  }) async {
    // Check if location services are enabled.
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const GeofenceLocationDisabled();
    }

    // Check and request permission.
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const GeofencePermissionDenied();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return const GeofencePermissionDenied();
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      final distance = haversineDistance(
        lat1: position.latitude,
        lon1: position.longitude,
        lat2: targetLatitude,
        lon2: targetLongitude,
      );

      if (distance <= radiusMeters) {
        return GeofenceInsideRadius(distanceMeters: distance);
      } else {
        return GeofenceOutsideRadius(distanceMeters: distance);
      }
    } catch (e) {
      return GeofenceError(e.toString());
    }
  }

  /// Formats a distance in metres as a human-readable string.
  static String formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.round()} m';
    }
    return '${(meters / 1000).toStringAsFixed(1)} km';
  }
}
