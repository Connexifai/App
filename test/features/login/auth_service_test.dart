import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:planbition_app/core/auth/session_model.dart';
import 'package:planbition_app/core/auth/token_storage.dart';
import 'package:planbition_app/core/models/response_wrapper.dart';
import 'package:planbition_app/features/login/auth_service.dart';

// ---------------------------------------------------------------------------
// Fake in-memory TokenStorage - no FlutterSecureStorage I/O.
// We pass a FlutterSecureStorage() to super but override every method, so
// the underlying storage is never touched.
// ---------------------------------------------------------------------------
class FakeTokenStorage extends TokenStorage {
  // Pass a real (but unused) FlutterSecureStorage to satisfy the super ctor.
  FakeTokenStorage() : super(const FlutterSecureStorage());

  SessionModel? _stored;

  @override
  Future<void> saveSession(SessionModel session) async => _stored = session;

  @override
  Future<SessionModel?> getSession() async => _stored;

  @override
  Future<void> clearSession() async => _stored = null;
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late FakeTokenStorage tokenStorage;
  late AuthService service;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.planbition.nl'));
    adapter = DioAdapter(dio: dio);
    tokenStorage = FakeTokenStorage();
    service = AuthService(dio: dio, tokenStorage: tokenStorage);
  });

  // -------------------------------------------------------------------------
  // login
  // -------------------------------------------------------------------------
  group('login', () {
    const loginResponse = {
      'access_token': 'test-access-token',
      'token_type': 'Bearer',
      'expires_in': 3600,
      'refresh_token': 'test-refresh-token',
      'refresh_token_expires_in': 86400,
    };

    test('success returns ApiSuccess with SessionModel', () async {
      adapter.onPost(
        '/Auth/oauth/token',
        (server) => server.reply(200, loginResponse),
        data: Matchers.any,
      );

      final result = await service.login(
        tenantIdentity: 'my-tenant',
        clientId: 'client-1',
        clientSecret: 'secret-1',
      );

      expect(result.isSuccess, isTrue);
      final session = (result as ApiSuccess<SessionModel>).data;
      expect(session.accessToken, equals('test-access-token'));
      expect(session.refreshToken, equals('test-refresh-token'));
      expect(session.tenantIdentity, equals('my-tenant'));
      expect(session.clientId, equals('client-1'));
    });

    test('success saves session to token storage', () async {
      adapter.onPost(
        '/Auth/oauth/token',
        (server) => server.reply(200, loginResponse),
        data: Matchers.any,
      );

      await service.login(
        tenantIdentity: 'my-tenant',
        clientId: 'client-1',
        clientSecret: 'secret-1',
      );

      final stored = await tokenStorage.getSession();
      expect(stored, isNotNull);
      expect(stored!.accessToken, equals('test-access-token'));
    });

    test('failure returns ApiFailure', () async {
      adapter.onPost(
        '/Auth/oauth/token',
        (server) => server.reply(
          401,
          {'errorMessage': 'Invalid credentials', 'errorCode': 'UNAUTHORIZED'},
        ),
        data: Matchers.any,
      );

      final result = await service.login(
        tenantIdentity: 'bad-tenant',
        clientId: 'bad-id',
        clientSecret: 'bad-secret',
      );

      expect(result.isFailure, isTrue);
      expect(result.errorOrNull, isNotNull);
    });
  });

  // -------------------------------------------------------------------------
  // getAccessRights
  // -------------------------------------------------------------------------
  group('getAccessRights', () {
    test('success returns ApiSuccess with AccessRights', () async {
      adapter.onGet(
        '/Auth/access-rights',
        (server) => server.reply(200, {
          'isSuccess': true,
          'data': {
            'featureRequestAbsenceEnabled': true,
            'featureTimesheetsEnabled': false,
          },
        }),
      );

      final result = await service.getAccessRights();

      expect(result.isSuccess, isTrue);
      final rights = result.dataOrNull!;
      expect(rights.featureRequestAbsenceEnabled, isTrue);
      expect(rights.featureTimesheetsEnabled, isFalse);
    });

    test('failure from HTTP 500 returns ApiFailure', () async {
      adapter.onGet(
        '/Auth/access-rights',
        (server) => server.reply(500, {'errorMessage': 'Internal server error'}),
      );

      final result = await service.getAccessRights();

      expect(result.isFailure, isTrue);
      expect(result.errorOrNull, isNotNull);
    });

    test('isSuccess false in wrapper body returns ApiFailure', () async {
      adapter.onGet(
        '/Auth/access-rights',
        (server) => server.reply(200, {
          'isSuccess': false,
          'data': null,
          'errorMessage': 'Access denied',
        }),
      );

      final result = await service.getAccessRights();

      expect(result.isFailure, isTrue);
    });
  });

  // -------------------------------------------------------------------------
  // logout
  // -------------------------------------------------------------------------
  group('logout', () {
    test('clears the stored session', () async {
      await tokenStorage.saveSession(
        SessionModel(
          tenantIdentity: 'tenant',
          clientId: 'cid',
          clientSecret: 'cs',
          accessToken: 'at',
          refreshToken: 'rt',
          accessTokenExpiresAt: DateTime.utc(2099),
          refreshTokenExpiresAt: DateTime.utc(2099),
        ),
      );

      await service.logout();

      expect(await tokenStorage.getSession(), isNull);
    });
  });
}
