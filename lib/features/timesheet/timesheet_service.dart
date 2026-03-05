import 'package:dio/dio.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'timesheet_models.dart';

class TimesheetService {
  const TimesheetService(this._dio);

  final Dio _dio;

  Future<ApiResult<List<TimesheetPeriodDto>>> getPeriods() async {
    try {
      final response = await _dio.get<List<dynamic>>('/Timesheet/periods');
      final data = response.data ?? [];
      final periods = data
          .map((e) => TimesheetPeriodDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiSuccess(periods);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<List<TimesheetShiftDto>>> getShifts({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/Timesheet/shifts',
        queryParameters: {
          'from': from.toIso8601String(),
          'to': to.toIso8601String(),
        },
      );
      final data = response.data ?? [];
      final shifts = data
          .map((e) => TimesheetShiftDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiSuccess(shifts);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<void>> submitHours(
    List<TimesheetSubmitRequestDto> entries,
  ) async {
    try {
      await _dio.post<void>(
        '/Timesheet/submit',
        data: entries.map((e) => e.toJson()).toList(),
      );
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
