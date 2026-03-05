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
String _$absenceSettingsHash() => r'416410269663311fbe58b1ef036a77808af23468';

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
