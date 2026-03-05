import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'calendar_models.dart';

/// Service for calendar-related API calls.
class CalendarService {
  const CalendarService(this._dio);

  final Dio _dio;

  static final _dateFmt = DateFormat('yyyy-MM-dd');

  /// GET /Calendar/day — fetches schedules, absences, availabilities and
  /// requested absences for the given [from]–[till] date range.
  Future<ApiResult<CalendarDto>> getCalendar({
    required DateTime from,
    required DateTime till,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/Calendar/day',
        queryParameters: {
          'from': _dateFmt.format(from),
          'till': _dateFmt.format(till),
        },
      );

      final wrapper = ResponseWrapper<CalendarDto>.fromJson(
        response.data!,
        (json) => CalendarDto.fromJson(json as Map<String, dynamic>),
      );

      if (wrapper.isSuccess) {
        return ApiSuccess(wrapper.data ?? const CalendarDto());
      }

      return ApiFailure(
        ApiError(
          message: wrapper.errorMessage ?? 'Kalender ophalen mislukt',
          code: wrapper.errorCode,
        ),
      );
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
