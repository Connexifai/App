import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/token_storage.dart';
import '../utils/date_utils.dart';
import 'api_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

part 'api_client.g.dart';

/// Factory that creates and configures the application-wide [Dio] instance.
///
/// All requests are routed through:
/// 1. [ErrorInterceptor] — logging and error normalisation
/// 2. [AuthInterceptor]  — JWT injection and auto-refresh
Dio createDio({
  required TokenStorage tokenStorage,
  required Future<void> Function() onSessionExpired,
  String? baseUrl,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl ?? ApiConstants.baseUrl,
      connectTimeout:
          const Duration(seconds: ApiConstants.connectTimeoutSeconds),
      receiveTimeout:
          const Duration(seconds: ApiConstants.receiveTimeoutSeconds),
      contentType: ApiConstants.contentType,
      headers: {
        ApiHeaders.accept: ApiConstants.contentType,
        ApiHeaders.apiVersion: ApiConstants.apiVersion,
        ApiHeaders.timestamp: PlanbitionDateUtils.nowTimestamp(),
      },
    ),
  );

  // Order matters: error interceptor first (wraps all), auth interceptor after.
  dio.interceptors.addAll([
    ErrorInterceptor(),
    AuthInterceptor(
      tokenStorage: tokenStorage,
      dio: dio,
      onSessionExpired: onSessionExpired,
    ),
  ]);

  return dio;
}

/// Provides the configured [Dio] instance to the Riverpod graph.
///
/// The [onSessionExpired] callback is wired up in [AppProviders] after the
/// router is available so it can navigate to the login screen.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return createDio(
    tokenStorage: ref.watch(tokenStorageProvider),
    onSessionExpired: () async {
      // Handled by the router redirect — session cleared by AuthNotifier.
      final storage = ref.read(tokenStorageProvider);
      await storage.clearSession();
    },
  );
}
