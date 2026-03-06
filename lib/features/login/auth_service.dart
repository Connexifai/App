import 'package:dio/dio.dart';

import '../../core/api/api_constants.dart';
import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/auth/session_model.dart';
import '../../core/auth/token_storage.dart';
import '../../core/models/access_rights.dart';
import '../../core/models/response_wrapper.dart';
import '../../core/utils/date_utils.dart';

/// Handles authentication and session management against the Planbition API.
class AuthService {
  const AuthService({
    required this.dio,
    required this.tokenStorage,
  });

  final Dio dio;
  final TokenStorage tokenStorage;

  /// Authenticates with the OAuth `client_credentials` grant.
  ///
  /// Returns an [ApiResult] containing the created [SessionModel] on success.
  Future<ApiResult<SessionModel>> login({
    required String tenantIdentity,
    required String clientId,
    required String clientSecret,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/Auth/oauth/token',
        data: {
          'grant_type': OAuthGrantType.clientCredentials,
          'client_id': clientId,
          'client_secret': clientSecret,
        },
        options: Options(
          headers: {
            ApiHeaders.tenantIdentity: tenantIdentity,
            ApiHeaders.apiVersion: ApiConstants.apiVersion,
            ApiHeaders.timestamp: PlanbitionDateUtils.nowTimestamp(),
            ApiHeaders.contentType: 'application/x-www-form-urlencoded',
          },
          contentType: 'application/x-www-form-urlencoded',
          // Skip auth interceptor for login — no token yet.
          extra: {'skipAuthInterceptor': true},
        ),
      );

      final data = response.data!;
      final now = DateTime.now().toUtc();

      final session = SessionModel(
        tenantIdentity: tenantIdentity,
        clientId: clientId,
        clientSecret: clientSecret,
        accessToken: data['access_token'] as String,
        refreshToken: data['refresh_token'] as String,
        accessTokenExpiresAt:
            now.add(Duration(seconds: data['expires_in'] as int)),
        refreshTokenExpiresAt: now.add(
          Duration(seconds: data['refresh_token_expires_in'] as int),
        ),
      );

      await tokenStorage.saveSession(session);
      return ApiSuccess(session);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// Fetches the feature flags for the current authenticated user.
  Future<ApiResult<AccessRights>> getAccessRights() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/Auth/access-rights',
      );

      final wrapper = ResponseWrapper<AccessRights>.fromJson(
        response.data!,
        (json) => AccessRights.fromJson(json as Map<String, dynamic>),
      );

      if (wrapper.isSuccess && wrapper.data != null) {
        return ApiSuccess(wrapper.data!);
      }

      return ApiFailure(
        ApiError(message: wrapper.errorMessage ?? 'Toegangsrechten ophalen mislukt'),
      );
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    } catch (e) {
      return ApiFailure(
        ApiError(message: 'Toegangsrechten ophalen mislukt.'),
      );
    }
  }

  /// Requests a password reset OTP for [email] in [tenant].
  Future<ApiResult<void>> requestPasswordReset({
    required String email,
    required String tenant,
  }) async {
    try {
      await dio.post<void>(
        '/Account/reset-password',
        data: {'email': email, 'tenant': tenant},
        options: Options(extra: {'skipAuthInterceptor': true}),
      );
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// Changes the password using either an OTP or a deeplink reset token.
  Future<ApiResult<void>> changePassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
    String? otp,
    String? resetToken,
  }) async {
    try {
      await dio.post<void>(
        '/Account/change-password',
        data: {
          'email': email,
          'newPass': newPassword,
          'confirmPass': confirmPassword,
          if (otp != null) 'otp': otp,
          if (resetToken != null) 'resetToken': resetToken,
        },
        options: Options(extra: {'skipAuthInterceptor': true}),
      );
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// Clears the persisted session (logout).
  Future<void> logout() async {
    await tokenStorage.clearSession();
  }
}
