// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$marketplaceServiceHash() =>
    r'1f00027df87e1df2ccd1498f33455885b28ebb93';

/// See also [marketplaceService].
@ProviderFor(marketplaceService)
final marketplaceServiceProvider =
    AutoDisposeProvider<MarketplaceService>.internal(
      marketplaceService,
      name: r'marketplaceServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$marketplaceServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MarketplaceServiceRef = AutoDisposeProviderRef<MarketplaceService>;
String _$marketplaceShiftsHash() => r'4e837420291ef8965b7528a087f4fe0ed25f71ea';

/// See also [marketplaceShifts].
@ProviderFor(marketplaceShifts)
final marketplaceShiftsProvider =
    AutoDisposeFutureProvider<List<MarketplaceShiftDto>>.internal(
      marketplaceShifts,
      name: r'marketplaceShiftsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$marketplaceShiftsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MarketplaceShiftsRef =
    AutoDisposeFutureProviderRef<List<MarketplaceShiftDto>>;
String _$marketplaceScheduleNotifierHash() =>
    r'6c4c8c0677fcdd1d5cd5498a1f6572b143e36b8f';

/// See also [MarketplaceScheduleNotifier].
@ProviderFor(MarketplaceScheduleNotifier)
final marketplaceScheduleNotifierProvider =
    AutoDisposeNotifierProvider<
      MarketplaceScheduleNotifier,
      AsyncValue<void>
    >.internal(
      MarketplaceScheduleNotifier.new,
      name: r'marketplaceScheduleNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$marketplaceScheduleNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MarketplaceScheduleNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
