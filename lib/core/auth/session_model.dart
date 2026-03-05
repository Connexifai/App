import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

/// Represents an authenticated user session.
@freezed
abstract class SessionModel with _$SessionModel {
  const factory SessionModel({
    /// The tenant identity (X-Tenant-Identity header value).
    required String tenantIdentity,

    /// The OAuth client_id used for authentication.
    required String clientId,

    /// The OAuth client_secret used for authentication.
    required String clientSecret,

    /// The current JWT access token.
    required String accessToken,

    /// The refresh token for obtaining a new access token.
    required String refreshToken,

    /// When the access token expires (UTC).
    required DateTime accessTokenExpiresAt,

    /// When the refresh token expires (UTC).
    required DateTime refreshTokenExpiresAt,

    /// Optional user identity (X-User-Identity header value).
    @Default('') String userIdentity,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

extension SessionModelX on SessionModel {
  /// Returns true if the access token has expired.
  bool get isAccessTokenExpired =>
      DateTime.now().toUtc().isAfter(accessTokenExpiresAt);

  /// Returns true if the refresh token has expired.
  bool get isRefreshTokenExpired =>
      DateTime.now().toUtc().isAfter(refreshTokenExpiresAt);

  /// Returns true if the session is still valid (refresh token not expired).
  bool get isValid => !isRefreshTokenExpired;
}
