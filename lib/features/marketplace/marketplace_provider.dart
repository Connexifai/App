import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import 'marketplace_models.dart';
import 'marketplace_service.dart';

part 'marketplace_provider.g.dart';

@riverpod
MarketplaceService marketplaceService(Ref ref) {
  return MarketplaceService(ref.watch(dioProvider));
}

@riverpod
Future<List<MarketplaceShiftDto>> marketplaceShifts(Ref ref) async {
  final service = ref.watch(marketplaceServiceProvider);
  final result = await service.getOverview();
  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}

@riverpod
class MarketplaceScheduleNotifier extends _$MarketplaceScheduleNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> schedule(int id) async {
    state = const AsyncValue.loading();
    final service = ref.read(marketplaceServiceProvider);
    final result = await service.scheduleShift(id);
    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (error) => AsyncValue.error(error.message, StackTrace.current),
    );
    if (state is AsyncData) ref.invalidate(marketplaceShiftsProvider);
  }

  Future<void> unschedule(int id) async {
    state = const AsyncValue.loading();
    final service = ref.read(marketplaceServiceProvider);
    final result = await service.unscheduleShift(id);
    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (error) => AsyncValue.error(error.message, StackTrace.current),
    );
    if (state is AsyncData) ref.invalidate(marketplaceShiftsProvider);
  }
}
