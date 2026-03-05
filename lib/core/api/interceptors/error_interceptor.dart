import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../models/response_wrapper.dart';

/// Dio interceptor that transforms API errors into [ApiError] instances and
/// logs all network traffic in debug mode.
class ErrorInterceptor extends Interceptor {
  final _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d(
      '→ ${options.method} ${options.path}',
      error: options.queryParameters.isNotEmpty
          ? options.queryParameters
          : null,
    );
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    _logger.d('← ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;

    String message;
    String? code;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Verbindingstime-out. Controleer je internetverbinding.';
        code = 'TIMEOUT';
      case DioExceptionType.connectionError:
        message = 'Geen verbinding. Controleer je internetverbinding.';
        code = 'NO_CONNECTION';
      case DioExceptionType.badResponse:
        final body = err.response?.data;
        message = _extractErrorMessage(body) ?? 'Onbekende serverfout ($statusCode).';
        code = _extractErrorCode(body) ?? 'HTTP_$statusCode';
      case DioExceptionType.cancel:
        message = 'Verzoek geannuleerd.';
        code = 'CANCELLED';
      default:
        message = 'Er is een onverwachte fout opgetreden.';
        code = 'UNKNOWN';
    }

    _logger.e(
      '✕ $statusCode $path — $message',
      error: err,
    );

    // Attach parsed error to the exception for consumers.
    handler.next(
      err.copyWith(
        message: message,
        error: ApiError(
          message: message,
          code: code,
          statusCode: statusCode,
        ),
      ),
    );
  }

  String? _extractErrorMessage(dynamic body) {
    if (body is Map<String, dynamic>) {
      return (body['errorMessage'] as String?) ??
          (body['title'] as String?) ??
          (body['error_description'] as String?);
    }
    return null;
  }

  String? _extractErrorCode(dynamic body) {
    if (body is Map<String, dynamic>) {
      return (body['errorCode'] as String?) ??
          (body['error'] as String?);
    }
    return null;
  }
}

extension DioExceptionX on DioException {
  /// Returns the [ApiError] attached by [ErrorInterceptor], or a generic one.
  ApiError get apiError {
    if (error is ApiError) return error as ApiError;
    return ApiError(
      message: message ?? 'Onbekende fout',
      statusCode: response?.statusCode,
    );
  }
}
