import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import 'availability_models.dart';
import 'availability_service.dart';

part 'availability_provider.g.dart';

@riverpod
AvailabilityService availabilityService(Ref ref) {
  return AvailabilityService(ref.watch(dioProvider));
}

@riverpod
Future<AvailabilitySettingsDto> availabilitySettings(Ref ref) async {
  final service = ref.watch(availabilityServiceProvider);
  final result = await service.getSettings();
  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}

@riverpod
class AvailabilitySubmitNotifier extends _$AvailabilitySubmitNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> submit(AvailabilityRequestDto dto) async {
    state = const AsyncValue.loading();
    final service = ref.read(availabilityServiceProvider);
    final result = await service.addAvailability(dto);
    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (error) => AsyncValue.error(error.message, StackTrace.current),
    );
  }
}
