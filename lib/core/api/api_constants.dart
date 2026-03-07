/// API configuration constants for the Planbition Self Schedule Mobile API.
library;

abstract final class ApiConstants {
  /// Base URL for the API.
  /// Override at build time with --dart-define=API_URL=http://localhost:8080
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://dev-mobile-api.planbition.nl',
  );

  /// API version header value.
  static const String apiVersion = '1.0';

  /// Content type used by this API.
  static const String contentType = 'application/json; ver=1.0';

  /// Geofencing radius in meters (client-side check).
  static const double geofenceRadiusMeters = 500.0;

  /// Connect timeout in seconds.
  static const int connectTimeoutSeconds = 30;

  /// Receive timeout in seconds.
  static const int receiveTimeoutSeconds = 30;
}

/// HTTP header name constants.
abstract final class ApiHeaders {
  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
  static const String apiVersion = 'X-Api-Version';
  static const String tenantIdentity = 'X-Tenant-Identity';
  static const String userIdentity = 'X-User-Identity';
  static const String timestamp = 'X-Timestamp';
  static const String acceptLanguage = 'Accept-Language';
}

/// OAuth grant type constants.
abstract final class OAuthGrantType {
  static const String clientCredentials = 'client_credentials';
  static const String refreshToken = 'refresh_token';
}
