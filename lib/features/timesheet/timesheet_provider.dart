import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import 'timesheet_models.dart';
import 'timesheet_service.dart';

part 'timesheet_provider.g.dart';

@riverpod
TimesheetService timesheetService(Ref ref) {
  return TimesheetService(ref.watch(dioProvider));
}

@riverpod
Future<List<TimesheetShiftDto>> timesheetShifts(
  Ref ref, {
  required DateTime startDate,
  required DateTime endDate,
}) async {
  final service = ref.watch(timesheetServiceProvider);
  final result = await service.getShifts(from: startDate, to: endDate);
  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}

@riverpod
Future<List<TimesheetPeriodDto>> timesheetPeriods(Ref ref) async {
  final service = ref.watch(timesheetServiceProvider);
  final result = await service.getPeriods();
  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}

@riverpod
class TimesheetSubmitNotifier extends _$TimesheetSubmitNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> submit(List<TimesheetSubmitRequestDto> entries) async {
    state = const AsyncValue.loading();
    final service = ref.read(timesheetServiceProvider);
    final result = await service.submitHours(entries);
    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (error) => AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
