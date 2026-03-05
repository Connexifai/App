import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import '../login/auth_provider.dart';
import 'dashboard_models.dart';
import 'dashboard_service.dart';

part 'dashboard_provider.g.dart';

@riverpod
DashboardService dashboardService(Ref ref) {
  return DashboardService(ref.watch(dioProvider));
}

/// Fetches the upcoming shifts for the authenticated employee.
@riverpod
Future<List<ShiftDto>> firstShifts(Ref ref) async {
  // Re-fetch when the auth state changes.
  ref.watch(authNotifierProvider);

  final service = ref.watch(dashboardServiceProvider);
  final result = await service.getFirstShifts();

  return result.when(
    success: (shifts) => shifts,
    failure: (error) => throw Exception(error.message),
  );
}

/// State for the punch-in/out operation.
@riverpod
class PunchNotifier extends _$PunchNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<ApiResult<void>> punchIn({required int scheduleId}) async {
    state = const AsyncValue.loading();
    final service = ref.read(dashboardServiceProvider);
    final result = await service.punchIn(scheduleId: scheduleId);

    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (e) => AsyncValue.error(e.message, StackTrace.current),
    );

    // Invalidate shifts so the status updates.
    ref.invalidate(firstShiftsProvider);
    return result;
  }

  Future<ApiResult<void>> punchOut({required int scheduleId}) async {
    state = const AsyncValue.loading();
    final service = ref.read(dashboardServiceProvider);
    final result = await service.punchOut(scheduleId: scheduleId);

    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (e) => AsyncValue.error(e.message, StackTrace.current),
    );

    ref.invalidate(firstShiftsProvider);
    return result;
  }
}
