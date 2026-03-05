import 'package:dio/dio.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'availability_models.dart';

class AvailabilityService {
  const AvailabilityService(this._dio);

  final Dio _dio;

  Future<ApiResult<AvailabilitySettingsDto>> getSettings() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/availability/settings',
      );
      final settings = AvailabilitySettingsDto.fromJson(
        response.data!,
      );
      return ApiSuccess(settings);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<void>> addAvailability(AvailabilityRequestDto dto) async {
    try {
      await _dio.post<void>('/availability', data: dto.toJson());
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
