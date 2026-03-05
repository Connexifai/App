// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServiceHash() => r'fbe827e76d40540c26490cd4fe36721a9616339c';

/// See also [authService].
@ProviderFor(authService)
final authServiceProvider = AutoDisposeProvider<AuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthServiceRef = AutoDisposeProviderRef<AuthService>;
String _$currentSessionHash() => r'6cea295ef31c8716585f1cd1fda03cc2eb15183a';

/// Returns the current [SessionModel], or null when unauthenticated.
///
/// Copied from [currentSession].
@ProviderFor(currentSession)
final currentSessionProvider = AutoDisposeProvider<SessionModel?>.internal(
  currentSession,
  name: r'currentSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentSessionRef = AutoDisposeProviderRef<SessionModel?>;
String _$accessRightsHash() => r'4c180faa3f9515533af604ef0b2a6e7ddd135ebf';

/// Returns the current [AccessRights], or a restrictive default when unavailable.
///
/// Copied from [accessRights].
@ProviderFor(accessRights)
final accessRightsProvider = AutoDisposeProvider<AccessRights>.internal(
  accessRights,
  name: r'accessRightsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accessRightsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AccessRightsRef = AutoDisposeProviderRef<AccessRights>;
String _$authNotifierHash() => r'4d90df575b6bf793bead8d3c983e394aa05dc1da';

/// Manages the global authentication state.
///
/// Exposes [login], [logout], and [restoreSession] for the app lifecycle.
///
/// Copied from [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>.internal(
  AuthNotifier.new,
  name: r'authNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthNotifier = Notifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
