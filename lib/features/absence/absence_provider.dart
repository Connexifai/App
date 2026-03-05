import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import 'absence_models.dart';
import 'absence_service.dart';

part 'absence_provider.g.dart';

@riverpod
AbsenceService absenceService(Ref ref) {
  return AbsenceService(ref.watch(dioProvider));
}

@riverpod
Future<List<AbsencePresenceSettingDto>> absenceSettings(Ref ref) async {
  final service = ref.watch(absenceServiceProvider);
  final result = await service.getAbsenceSettings();
  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}

@riverpod
class AbsenceRequestNotifier extends _$AbsenceRequestNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> submit(AbsenceRequestDto dto) async {
    state = const AsyncValue.loading();
    final service = ref.read(absenceServiceProvider);
    final result = await service.requestAbsence(dto);
    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (error) => AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
