// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$absenceServiceHash() => r'4d7c3cd054b8d645c5db898a087bae6adbafffad';

/// See also [absenceService].
@ProviderFor(absenceService)
final absenceServiceProvider = AutoDisposeProvider<AbsenceService>.internal(
  absenceService,
  name: r'absenceServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$absenceServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AbsenceServiceRef = AutoDisposeProviderRef<AbsenceService>;
String _$absenceSettingsHash() => r'55dcd382797cf770615fdeb27f8c0ca4c88dc710';

/// See also [absenceSettings].
@ProviderFor(absenceSettings)
final absenceSettingsProvider =
    AutoDisposeFutureProvider<List<AbsencePresenceSettingDto>>.internal(
      absenceSettings,
      name: r'absenceSettingsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$absenceSettingsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AbsenceSettingsRef =
    AutoDisposeFutureProviderRef<List<AbsencePresenceSettingDto>>;
String _$absenceHistoryHash() => r'fea48d2b18d5efbf65589c607b2e97fa96b40095';

/// See also [absenceHistory].
@ProviderFor(absenceHistory)
final absenceHistoryProvider =
    AutoDisposeFutureProvider<List<AbsenceResponseDto>>.internal(
      absenceHistory,
      name: r'absenceHistoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$absenceHistoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AbsenceHistoryRef =
    AutoDisposeFutureProviderRef<List<AbsenceResponseDto>>;
String _$absenceRequestNotifierHash() =>
    r'039071d61be947ce6123baa582bfc4b54dfca7df';

/// See also [AbsenceRequestNotifier].
@ProviderFor(AbsenceRequestNotifier)
final absenceRequestNotifierProvider =
    AutoDisposeNotifierProvider<
      AbsenceRequestNotifier,
      AsyncValue<void>
    >.internal(
      AbsenceRequestNotifier.new,
      name: r'absenceRequestNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$absenceRequestNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AbsenceRequestNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
