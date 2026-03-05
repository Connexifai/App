// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availabilityServiceHash() =>
    r'075be17fe0ed5b95292ff00cd34c69993bd5bb86';

/// See also [availabilityService].
@ProviderFor(availabilityService)
final availabilityServiceProvider =
    AutoDisposeProvider<AvailabilityService>.internal(
      availabilityService,
      name: r'availabilityServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availabilityServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailabilityServiceRef = AutoDisposeProviderRef<AvailabilityService>;
String _$availabilitySettingsHash() =>
    r'6c4e1791f8eb3258a0f21fd4465824b7ff6b2bcd';

/// See also [availabilitySettings].
@ProviderFor(availabilitySettings)
final availabilitySettingsProvider =
    AutoDisposeFutureProvider<AvailabilitySettingsDto>.internal(
      availabilitySettings,
      name: r'availabilitySettingsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availabilitySettingsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailabilitySettingsRef =
    AutoDisposeFutureProviderRef<AvailabilitySettingsDto>;
String _$availabilitySubmitNotifierHash() =>
    r'23ff619b928dd695ae9ebd6a43d3046dca563f90';

/// See also [AvailabilitySubmitNotifier].
@ProviderFor(AvailabilitySubmitNotifier)
final availabilitySubmitNotifierProvider =
    AutoDisposeNotifierProvider<
      AvailabilitySubmitNotifier,
      AsyncValue<void>
    >.internal(
      AvailabilitySubmitNotifier.new,
      name: r'availabilitySubmitNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availabilitySubmitNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AvailabilitySubmitNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
