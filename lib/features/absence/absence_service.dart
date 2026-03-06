import 'package:dio/dio.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'absence_models.dart';

class AbsenceService {
  const AbsenceService(this._dio);

  final Dio _dio;

  Future<ApiResult<List<AbsencePresenceSettingDto>>> getAbsenceSettings() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/AbsencePresence/settings',
      );
      final data = response.data ?? [];
      final settings = data
          .map((e) => AbsencePresenceSettingDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiSuccess(settings);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<List<AbsenceResponseDto>>> getAbsenceHistory() async {
    try {
      final response = await _dio.get<List<dynamic>>('/AbsencePresence');
      final data = response.data ?? [];
      final items = data
          .map((e) =>
              AbsenceResponseDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiSuccess(items);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<void>> requestAbsence(AbsenceRequestDto dto) async {
    try {
      await _dio.post<void>('/AbsencePresence/add', data: dto.toJson());
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
