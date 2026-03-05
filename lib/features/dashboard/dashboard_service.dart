import 'package:dio/dio.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'dashboard_models.dart';

/// Service for dashboard-related API calls.
class DashboardService {
  const DashboardService(this._dio);

  final Dio _dio;

  /// GET /Dashboard/firstshifts — the upcoming shifts for the employee.
  Future<ApiResult<List<ShiftDto>>> getFirstShifts() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/Dashboard/firstshifts',
      );

      final wrapper = ResponseWrapper<List<ShiftDto>>.fromJson(
        response.data!,
        (json) => (json as List<dynamic>)
            .map((e) => ShiftDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

      if (wrapper.isSuccess) {
        return ApiSuccess(wrapper.data ?? []);
      }
      return ApiFailure(
        ApiError(message: wrapper.errorMessage ?? 'Diensten ophalen mislukt'),
      );
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// POST /Dashboard/punchin — registers a punch-in for [scheduleId].
  Future<ApiResult<void>> punchIn({required int scheduleId}) async {
    try {
      await _dio.post<void>(
        '/Dashboard/punchin',
        data: {'scheduleId': scheduleId},
      );
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  /// POST /Dashboard/punchout — registers a punch-out for [scheduleId].
  Future<ApiResult<void>> punchOut({required int scheduleId}) async {
    try {
      await _dio.post<void>(
        '/Dashboard/punchout',
        data: {'scheduleId': scheduleId},
      );
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
