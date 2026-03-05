import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import '../login/auth_provider.dart';
import 'message_models.dart';
import 'message_service.dart';

part 'messages_provider.g.dart';

// ---------------------------------------------------------------------------
// Service provider
// ---------------------------------------------------------------------------

@riverpod
MessageService messageService(Ref ref) {
  return MessageService(ref.watch(dioProvider));
}

// ---------------------------------------------------------------------------
// Messages list provider
// ---------------------------------------------------------------------------

/// Fetches and caches the full message list for the authenticated employee.
///
/// Automatically re-fetches when the auth state changes. Invalidate this
/// provider after any mutation to trigger a refresh.
@riverpod
Future<List<MessageDto>> messages(Ref ref) async {
  ref.watch(authNotifierProvider);

  final service = ref.watch(messageServiceProvider);
  final result = await service.getMessages();

  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}

// ---------------------------------------------------------------------------
// Message actions notifier
// ---------------------------------------------------------------------------

/// Handles mark-as-read and PlanPush accept/decline operations.
///
/// Mutations invalidate [messagesProvider] so the list refreshes automatically.
@riverpod
class MessageActionsNotifier extends _$MessageActionsNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Marks the message with [id] as read.
  Future<ApiResult<void>> markRead(int id) async {
    state = const AsyncValue.loading();
    final service = ref.read(messageServiceProvider);
    final result = await service.markRead(id: id);

    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (e) => AsyncValue.error(e.message, StackTrace.current),
    );

    if (result.isSuccess) ref.invalidate(messagesProvider);
    return result;
  }

  /// Executes a PlanPush [action] (accept or decline) for message [id].
  Future<ApiResult<void>> executeAction(int id, PlanPushAction action) async {
    state = const AsyncValue.loading();
    final service = ref.read(messageServiceProvider);
    final result = await service.executeAction(id: id, action: action);

    state = result.when(
      success: (_) => const AsyncValue.data(null),
      failure: (e) => AsyncValue.error(e.message, StackTrace.current),
    );

    if (result.isSuccess) ref.invalidate(messagesProvider);
    return result;
  }
}

// ---------------------------------------------------------------------------
// Convenience providers
// ---------------------------------------------------------------------------

/// Returns the number of unread messages, or 0 while loading.
@riverpod
int unreadMessageCount(Ref ref) {
  final async = ref.watch(messagesProvider);
  return async.when(
    data: (list) => list.where((m) => !m.isRead).length,
    loading: () => 0,
    error: (_, __) => 0,
  );
}
