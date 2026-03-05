// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarServiceHash() => r'6aea2d4a8374eb705ab0283406403bb0d5b62e4f';

/// See also [calendarService].
@ProviderFor(calendarService)
final calendarServiceProvider = AutoDisposeProvider<CalendarService>.internal(
  calendarService,
  name: r'calendarServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CalendarServiceRef = AutoDisposeProviderRef<CalendarService>;
String _$calendarHash() => r'a0220d53d491432c837a72c9a87209bbf5599a9e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Fetches calendar data for the given date range.
///
/// The [param] record must contain a [from] and [to] [DateTime].
/// The provider re-fetches whenever the auth state changes.
///
/// Usage:
/// ```dart
/// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
/// ```
///
/// Copied from [calendar].
@ProviderFor(calendar)
const calendarProvider = CalendarFamily();

/// Fetches calendar data for the given date range.
///
/// The [param] record must contain a [from] and [to] [DateTime].
/// The provider re-fetches whenever the auth state changes.
///
/// Usage:
/// ```dart
/// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
/// ```
///
/// Copied from [calendar].
class CalendarFamily extends Family<AsyncValue<CalendarDto>> {
  /// Fetches calendar data for the given date range.
  ///
  /// The [param] record must contain a [from] and [to] [DateTime].
  /// The provider re-fetches whenever the auth state changes.
  ///
  /// Usage:
  /// ```dart
  /// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
  /// ```
  ///
  /// Copied from [calendar].
  const CalendarFamily();

  /// Fetches calendar data for the given date range.
  ///
  /// The [param] record must contain a [from] and [to] [DateTime].
  /// The provider re-fetches whenever the auth state changes.
  ///
  /// Usage:
  /// ```dart
  /// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
  /// ```
  ///
  /// Copied from [calendar].
  CalendarProvider call(({DateTime from, DateTime to}) param) {
    return CalendarProvider(param);
  }

  @override
  CalendarProvider getProviderOverride(covariant CalendarProvider provider) {
    return call(provider.param);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'calendarProvider';
}

/// Fetches calendar data for the given date range.
///
/// The [param] record must contain a [from] and [to] [DateTime].
/// The provider re-fetches whenever the auth state changes.
///
/// Usage:
/// ```dart
/// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
/// ```
///
/// Copied from [calendar].
class CalendarProvider extends AutoDisposeFutureProvider<CalendarDto> {
  /// Fetches calendar data for the given date range.
  ///
  /// The [param] record must contain a [from] and [to] [DateTime].
  /// The provider re-fetches whenever the auth state changes.
  ///
  /// Usage:
  /// ```dart
  /// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
  /// ```
  ///
  /// Copied from [calendar].
  CalendarProvider(({DateTime from, DateTime to}) param)
    : this._internal(
        (ref) => calendar(ref as CalendarRef, param),
        from: calendarProvider,
        name: r'calendarProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$calendarHash,
        dependencies: CalendarFamily._dependencies,
        allTransitiveDependencies: CalendarFamily._allTransitiveDependencies,
        param: param,
      );

  CalendarProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.param,
  }) : super.internal();

  final ({DateTime from, DateTime to}) param;

  @override
  Override overrideWith(
    FutureOr<CalendarDto> Function(CalendarRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CalendarProvider._internal(
        (ref) => create(ref as CalendarRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        param: param,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CalendarDto> createElement() {
    return _CalendarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CalendarRef on AutoDisposeFutureProviderRef<CalendarDto> {
  /// The parameter `param` of this provider.
  ({DateTime from, DateTime to}) get param;
}

class _CalendarProviderElement
    extends AutoDisposeFutureProviderElement<CalendarDto>
    with CalendarRef {
  _CalendarProviderElement(super.provider);

  @override
  ({DateTime from, DateTime to}) get param =>
      (origin as CalendarProvider).param;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
