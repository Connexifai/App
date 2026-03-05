import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_wrapper.freezed.dart';
part 'response_wrapper.g.dart';

/// Generic API response wrapper returned by all endpoints.
///
/// The Planbition API wraps every response in:
/// ```json
/// {
///   "isSuccess": true,
///   "data": { ... },
///   "errorMessage": null
/// }
/// ```
@Freezed(genericArgumentFactories: true)
abstract class ResponseWrapper<T> with _$ResponseWrapper<T> {
  const factory ResponseWrapper({
    /// Whether the request succeeded.
    required bool isSuccess,

    /// The response payload; null when [isSuccess] is false.
    T? data,

    /// Human-readable error message when [isSuccess] is false.
    String? errorMessage,

    /// Machine-readable error code.
    String? errorCode,
  }) = _ResponseWrapper<T>;

  factory ResponseWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
}

/// Represents a failed API call with an error message.
@freezed
abstract class ApiError with _$ApiError {
  const factory ApiError({
    required String message,
    String? code,
    int? statusCode,
  }) = _ApiError;
}

/// Sealed result type for API calls.
sealed class ApiResult<T> {
  const ApiResult();
}

final class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess(this.data);
  final T data;
}

final class ApiFailure<T> extends ApiResult<T> {
  const ApiFailure(this.error);
  final ApiError error;
}

extension ApiResultX<T> on ApiResult<T> {
  bool get isSuccess => this is ApiSuccess<T>;
  bool get isFailure => this is ApiFailure<T>;

  T? get dataOrNull => switch (this) {
        ApiSuccess<T>(data: final d) => d,
        ApiFailure<T>() => null,
      };

  ApiError? get errorOrNull => switch (this) {
        ApiSuccess<T>() => null,
        ApiFailure<T>(error: final e) => e,
      };

  R when<R>({
    required R Function(T data) success,
    required R Function(ApiError error) failure,
  }) =>
      switch (this) {
        ApiSuccess<T>(data: final d) => success(d),
        ApiFailure<T>(error: final e) => failure(e),
      };
}
