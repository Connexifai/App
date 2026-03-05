import 'package:flutter_test/flutter_test.dart';
import 'package:planbition_app/core/auth/session_model.dart';

SessionModel _makeSession({
  DateTime? accessTokenExpiresAt,
  DateTime? refreshTokenExpiresAt,
}) {
  return SessionModel(
    tenantIdentity: 'test-tenant',
    clientId: 'client-123',
    clientSecret: 'secret-abc',
    accessToken: 'access-token-value',
    refreshToken: 'refresh-token-value',
    accessTokenExpiresAt: accessTokenExpiresAt ?? DateTime.utc(2099, 12, 31),
    refreshTokenExpiresAt: refreshTokenExpiresAt ?? DateTime.utc(2099, 12, 31),
  );
}

void main() {
  group('isAccessTokenExpired', () {
    test('returns false for a future expiry date', () {
      final session = _makeSession(
        accessTokenExpiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
      );
      expect(session.isAccessTokenExpired, isFalse);
    });

    test('returns true for a past expiry date', () {
      final session = _makeSession(
        accessTokenExpiresAt: DateTime.now().toUtc().subtract(const Duration(hours: 1)),
      );
      expect(session.isAccessTokenExpired, isTrue);
    });
  });

  group('isRefreshTokenExpired', () {
    test('returns false for a future expiry date', () {
      final session = _makeSession(
        refreshTokenExpiresAt: DateTime.now().toUtc().add(const Duration(days: 1)),
      );
      expect(session.isRefreshTokenExpired, isFalse);
    });

    test('returns true for a past expiry date', () {
      final session = _makeSession(
        refreshTokenExpiresAt: DateTime.now().toUtc().subtract(const Duration(days: 1)),
      );
      expect(session.isRefreshTokenExpired, isTrue);
    });
  });

  group('isValid', () {
    test('returns true when refresh token is not expired', () {
      final session = _makeSession(
        refreshTokenExpiresAt: DateTime.now().toUtc().add(const Duration(days: 7)),
      );
      expect(session.isValid, isTrue);
    });

    test('returns false when refresh token has expired', () {
      final session = _makeSession(
        refreshTokenExpiresAt: DateTime.now().toUtc().subtract(const Duration(days: 1)),
      );
      expect(session.isValid, isFalse);
    });
  });

  group('fromJson / toJson round-trip', () {
    test('preserves all fields', () {
      final original = SessionModel(
        tenantIdentity: 'my-tenant',
        clientId: 'my-client',
        clientSecret: 'my-secret',
        accessToken: 'access-abc',
        refreshToken: 'refresh-xyz',
        accessTokenExpiresAt: DateTime.utc(2025, 6, 12, 8, 30),
        refreshTokenExpiresAt: DateTime.utc(2025, 7, 12, 8, 30),
        userIdentity: 'user-001',
      );

      final json = original.toJson();
      final restored = SessionModel.fromJson(json);

      expect(restored.tenantIdentity, equals(original.tenantIdentity));
      expect(restored.clientId, equals(original.clientId));
      expect(restored.clientSecret, equals(original.clientSecret));
      expect(restored.accessToken, equals(original.accessToken));
      expect(restored.refreshToken, equals(original.refreshToken));
      expect(restored.accessTokenExpiresAt, equals(original.accessTokenExpiresAt));
      expect(restored.refreshTokenExpiresAt, equals(original.refreshTokenExpiresAt));
      expect(restored.userIdentity, equals(original.userIdentity));
    });

    test('userIdentity defaults to empty string when absent', () {
      final json = {
        'tenantIdentity': 'tenant',
        'clientId': 'cid',
        'clientSecret': 'cs',
        'accessToken': 'at',
        'refreshToken': 'rt',
        'accessTokenExpiresAt': '2099-12-31T00:00:00.000Z',
        'refreshTokenExpiresAt': '2099-12-31T00:00:00.000Z',
      };
      final session = SessionModel.fromJson(json);
      expect(session.userIdentity, equals(''));
    });
  });
}
