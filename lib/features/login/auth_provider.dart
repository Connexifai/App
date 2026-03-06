import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/auth/session_model.dart';
import '../../core/auth/token_storage.dart';
import '../../core/models/access_rights.dart';
import '../../core/models/response_wrapper.dart';
import 'auth_service.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

/// Describes the authentication state of the application.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated({
    required SessionModel session,
    required AccessRights accessRights,
  }) = AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String message) = AuthStateError;
}

extension AuthStateX on AuthState {
  bool get isAuthenticated => this is AuthStateAuthenticated;

  AccessRights? get accessRights =>
      (this as AuthStateAuthenticated?)?.accessRights;
}

// ---------------------------------------------------------------------------
// Service provider
// ---------------------------------------------------------------------------

@riverpod
AuthService authService(Ref ref) {
  return AuthService(
    dio: ref.watch(dioProvider),
    tokenStorage: ref.watch(tokenStorageProvider),
  );
}

// ---------------------------------------------------------------------------
// Notifier
// ---------------------------------------------------------------------------

/// Manages the global authentication state.
///
/// Exposes [login], [logout], and [restoreSession] for the app lifecycle.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Attempt to restore a previous session on first build.
    _restoreSession();
    return const AuthState.initial();
  }

  /// Restores a persisted session from secure storage on app launch.
  Future<void> _restoreSession() async {
    state = const AuthState.loading();
    final storage = ref.read(tokenStorageProvider);
    final session = await storage.getSession();

    if (session == null || !session.isValid) {
      state = const AuthState.unauthenticated();
      return;
    }

    // Session exists — fetch access rights to confirm the token is still valid.
    final service = ref.read(authServiceProvider);
    final result = await service.getAccessRights();

    state = result.when(
      success: (rights) => AuthState.authenticated(
        session: session,
        accessRights: rights,
      ),
      failure: (_) => const AuthState.unauthenticated(),
    );
  }

  /// Authenticates with the given credentials.
  Future<ApiResult<void>> login({
    required String tenantIdentity,
    required String clientId,
    required String clientSecret,
  }) async {
    state = const AuthState.loading();
    final service = ref.read(authServiceProvider);

    try {
      final loginResult = await service.login(
        tenantIdentity: tenantIdentity,
        clientId: clientId,
        clientSecret: clientSecret,
      );

      if (loginResult is ApiFailure<SessionModel>) {
        state = AuthState.error(loginResult.error.message);
        return ApiFailure<void>(loginResult.error);
      }

      final session = (loginResult as ApiSuccess<SessionModel>).data;

      // Access rights are best-effort: don't block login if the call fails.
      var accessRights = const AccessRights();
      try {
        final rightsResult = await service.getAccessRights();
        rightsResult.when(
          success: (rights) => accessRights = rights,
          failure: (_) {}, // keep defaults
        );
      } catch (_) {
        // keep defaults — user is logged in regardless
      }

      state = AuthState.authenticated(
        session: session,
        accessRights: accessRights,
      );
      return const ApiSuccess(null);
    } catch (e) {
      final message = 'Inloggen mislukt. Probeer opnieuw.';
      state = AuthState.error(message);
      return ApiFailure<void>(ApiError(message: message));
    }
  }

  /// Signs the user out and clears the session.
  Future<void> logout() async {
    final service = ref.read(authServiceProvider);
    await service.logout();
    state = const AuthState.unauthenticated();
  }
}

// ---------------------------------------------------------------------------
// Convenience providers
// ---------------------------------------------------------------------------

/// Returns the current [SessionModel], or null when unauthenticated.
@riverpod
SessionModel? currentSession(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.when(
    initial: () => null,
    loading: () => null,
    authenticated: (session, _) => session,
    unauthenticated: () => null,
    error: (_) => null,
  );
}

/// Returns the current [AccessRights], or a restrictive default when unavailable.
@riverpod
AccessRights accessRights(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.when(
    initial: () => const AccessRights(),
    loading: () => const AccessRights(),
    authenticated: (_, rights) => rights,
    unauthenticated: () => const AccessRights(),
    error: (_) => const AccessRights(),
  );
}
