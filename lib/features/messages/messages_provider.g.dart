// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageServiceHash() => r'c1edc4d5cc767ef0e160eafcefe763cad7483b57';

/// See also [messageService].
@ProviderFor(messageService)
final messageServiceProvider = AutoDisposeProvider<MessageService>.internal(
  messageService,
  name: r'messageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MessageServiceRef = AutoDisposeProviderRef<MessageService>;
String _$messagesHash() => r'1f63f2bc4cd112824163b1e21187d79346625af6';

/// Fetches and caches the full message list for the authenticated employee.
///
/// Automatically re-fetches when the auth state changes. Invalidate this
/// provider after any mutation to trigger a refresh.
///
/// Copied from [messages].
@ProviderFor(messages)
final messagesProvider = AutoDisposeFutureProvider<List<MessageDto>>.internal(
  messages,
  name: r'messagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MessagesRef = AutoDisposeFutureProviderRef<List<MessageDto>>;
String _$unreadMessageCountHash() =>
    r'37df07b2664257be2e3bc3d68ad2d0da78ae21b2';

/// Returns the number of unread messages, or 0 while loading.
///
/// Copied from [unreadMessageCount].
@ProviderFor(unreadMessageCount)
final unreadMessageCountProvider = AutoDisposeProvider<int>.internal(
  unreadMessageCount,
  name: r'unreadMessageCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadMessageCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnreadMessageCountRef = AutoDisposeProviderRef<int>;
String _$messageActionsNotifierHash() =>
    r'66a5ebbf66fba41fe63a4a0b7f9b4e0636fe44d6';

/// Handles mark-as-read and PlanPush accept/decline operations.
///
/// Mutations invalidate [messagesProvider] so the list refreshes automatically.
///
/// Copied from [MessageActionsNotifier].
@ProviderFor(MessageActionsNotifier)
final messageActionsNotifierProvider =
    AutoDisposeNotifierProvider<
      MessageActionsNotifier,
      AsyncValue<void>
    >.internal(
      MessageActionsNotifier.new,
      name: r'messageActionsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$messageActionsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MessageActionsNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
