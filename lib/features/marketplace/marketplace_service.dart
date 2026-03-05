import 'package:dio/dio.dart';

import '../../core/api/interceptors/error_interceptor.dart';
import '../../core/models/response_wrapper.dart';
import 'marketplace_models.dart';

class MarketplaceService {
  const MarketplaceService(this._dio);

  final Dio _dio;

  Future<ApiResult<List<MarketplaceShiftDto>>> getOverview({
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (from != null) queryParams['from'] = from.toIso8601String();
      if (to != null) queryParams['till'] = to.toIso8601String();

      final response = await _dio.get<List<dynamic>>(
        '/Marketplace/overview',
        queryParameters: queryParams.isEmpty ? null : queryParams,
      );
      final data = response.data ?? [];
      final shifts = data
          .map((e) => MarketplaceShiftDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiSuccess(shifts);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<void>> scheduleShift(int shiftId) async {
    try {
      await _dio.post<void>('/Marketplace/schedule', data: {'shiftId': shiftId});
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<void>> unscheduleShift(int shiftId) async {
    try {
      await _dio.delete<void>('/Marketplace/schedule/$shiftId');
      return const ApiSuccess(null);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }

  Future<ApiResult<MarketplaceShiftDto>> getShiftDetails(int shiftId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/Marketplace/shift/$shiftId',
      );
      final shift = MarketplaceShiftDto.fromJson(response.data!);
      return ApiSuccess(shift);
    } on DioException catch (e) {
      return ApiFailure(e.apiError);
    }
  }
}
