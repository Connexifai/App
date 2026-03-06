// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timesheetServiceHash() => r'9346acdfbf81afe67237130bdfd26d98d6d672f7';

/// See also [timesheetService].
@ProviderFor(timesheetService)
final timesheetServiceProvider = AutoDisposeProvider<TimesheetService>.internal(
  timesheetService,
  name: r'timesheetServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timesheetServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TimesheetServiceRef = AutoDisposeProviderRef<TimesheetService>;
String _$timesheetShiftsHash() => r'c33dc765cba034e2756256b820741acf1f72565c';

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

/// See also [timesheetShifts].
@ProviderFor(timesheetShifts)
const timesheetShiftsProvider = TimesheetShiftsFamily();

/// See also [timesheetShifts].
class TimesheetShiftsFamily
    extends Family<AsyncValue<List<TimesheetShiftDto>>> {
  /// See also [timesheetShifts].
  const TimesheetShiftsFamily();

  /// See also [timesheetShifts].
  TimesheetShiftsProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return TimesheetShiftsProvider(startDate: startDate, endDate: endDate);
  }

  @override
  TimesheetShiftsProvider getProviderOverride(
    covariant TimesheetShiftsProvider provider,
  ) {
    return call(startDate: provider.startDate, endDate: provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'timesheetShiftsProvider';
}

/// See also [timesheetShifts].
class TimesheetShiftsProvider
    extends AutoDisposeFutureProvider<List<TimesheetShiftDto>> {
  /// See also [timesheetShifts].
  TimesheetShiftsProvider({
    required DateTime startDate,
    required DateTime endDate,
  }) : this._internal(
         (ref) => timesheetShifts(
           ref as TimesheetShiftsRef,
           startDate: startDate,
           endDate: endDate,
         ),
         from: timesheetShiftsProvider,
         name: r'timesheetShiftsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$timesheetShiftsHash,
         dependencies: TimesheetShiftsFamily._dependencies,
         allTransitiveDependencies:
             TimesheetShiftsFamily._allTransitiveDependencies,
         startDate: startDate,
         endDate: endDate,
       );

  TimesheetShiftsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime startDate;
  final DateTime endDate;

  @override
  Override overrideWith(
    FutureOr<List<TimesheetShiftDto>> Function(TimesheetShiftsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TimesheetShiftsProvider._internal(
        (ref) => create(ref as TimesheetShiftsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TimesheetShiftDto>> createElement() {
    return _TimesheetShiftsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimesheetShiftsProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TimesheetShiftsRef
    on AutoDisposeFutureProviderRef<List<TimesheetShiftDto>> {
  /// The parameter `startDate` of this provider.
  DateTime get startDate;

  /// The parameter `endDate` of this provider.
  DateTime get endDate;
}

class _TimesheetShiftsProviderElement
    extends AutoDisposeFutureProviderElement<List<TimesheetShiftDto>>
    with TimesheetShiftsRef {
  _TimesheetShiftsProviderElement(super.provider);

  @override
  DateTime get startDate => (origin as TimesheetShiftsProvider).startDate;
  @override
  DateTime get endDate => (origin as TimesheetShiftsProvider).endDate;
}

String _$timesheetPeriodsHash() => r'ba2aa1be096de1f857038c7041bcf454e30daee8';

/// See also [timesheetPeriods].
@ProviderFor(timesheetPeriods)
final timesheetPeriodsProvider =
    AutoDisposeFutureProvider<List<TimesheetPeriodDto>>.internal(
      timesheetPeriods,
      name: r'timesheetPeriodsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$timesheetPeriodsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TimesheetPeriodsRef =
    AutoDisposeFutureProviderRef<List<TimesheetPeriodDto>>;
String _$timesheetSubmitNotifierHash() =>
    r'fd59f951ac7157e5d121ef7bcd7bf30226c7efa9';

/// See also [TimesheetSubmitNotifier].
@ProviderFor(TimesheetSubmitNotifier)
final timesheetSubmitNotifierProvider =
    AutoDisposeNotifierProvider<
      TimesheetSubmitNotifier,
      AsyncValue<void>
    >.internal(
      TimesheetSubmitNotifier.new,
      name: r'timesheetSubmitNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$timesheetSubmitNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TimesheetSubmitNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
