// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardServiceHash() => r'bb26b4da97cb84b20dad1d4e1e4f79e0876ee5ab';

/// See also [dashboardService].
@ProviderFor(dashboardService)
final dashboardServiceProvider = AutoDisposeProvider<DashboardService>.internal(
  dashboardService,
  name: r'dashboardServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardServiceRef = AutoDisposeProviderRef<DashboardService>;
String _$firstShiftsHash() => r'9bf76d76fb439d7929126bba888a53cbd0fcec91';

/// Fetches the upcoming shifts for the authenticated employee.
///
/// Copied from [firstShifts].
@ProviderFor(firstShifts)
final firstShiftsProvider = AutoDisposeFutureProvider<List<ShiftDto>>.internal(
  firstShifts,
  name: r'firstShiftsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firstShiftsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirstShiftsRef = AutoDisposeFutureProviderRef<List<ShiftDto>>;
String _$punchNotifierHash() => r'afe4c7be59fd8882fab9ba219d9c2e7b315f372c';

/// State for the punch-in/out operation.
///
/// Copied from [PunchNotifier].
@ProviderFor(PunchNotifier)
final punchNotifierProvider =
    AutoDisposeNotifierProvider<PunchNotifier, AsyncValue<void>>.internal(
      PunchNotifier.new,
      name: r'punchNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$punchNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PunchNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
