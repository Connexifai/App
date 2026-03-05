import 'package:dio/dio.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'message_models.dart';

/// Service for MessageCenter-related API calls.
class MessageService {
  const MessageService(this._dio);

  final Dio _dio;

  /// GET /MessageCenter/messages — returns all messages for the employee.
  Future<ApiResult<List<MessageDto>>> getMessages() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/MessageCenter/messages',
      );

      final wrapper = ResponseWrapper<List<MessageDto>>.fromJson(
        response.data!,
        (json) {
          // The API may return the list directly under data, or nested in an
          // object with a "messages" key. Handle both shapes defensively.
          if (json is List) {
            return json
                .map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          if (json is Map<String, dynamic> && json.containsKey('messages')) {
            return (json['messages'] as List<dynamic>)
                .map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          return <MessageDto>[];
        },
      );

      if (wrapper.isSuccess) {
        return ApiSuccess(wrapper.data ?? []);
      }
      return ApiFailure(
        ApiError(
          message: wrapper.errorMessage ?? 'Berichten ophalen mislukt',
          code: wrapper.errorCode,
        ),
      );
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// POST /MessageCenter/messages/{id}/read — marks a message as read.
  Future<ApiResult<void>> markRead({required int id}) async {
    try {
      await _dio.post<void>('/MessageCenter/messages/$id/read');
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// POST /MessageCenter/messages/{id}/execute — executes a PlanPush action.
  ///
  /// [action] is [PlanPushAction.accept] (1) or [PlanPushAction.decline] (2).
  Future<ApiResult<void>> executeAction({
    required int id,
    required PlanPushAction action,
  }) async {
    try {
      await _dio.post<void>(
        '/MessageCenter/messages/$id/execute',
        data: {'action': action.value},
      );
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
