import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loading_widget.dart';
import 'message_models.dart';
import '../../core/models/response_wrapper.dart';
import 'messages_provider.dart';

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class MessagesScreen extends ConsumerWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final messagesAsync = ref.watch(messagesProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Berichten'),
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: theme.colorScheme.surfaceTint,
        actions: [
          messagesAsync.whenOrNull(
                data: (msgs) {
                  final unread = msgs.where((m) => !m.isRead).length;
                  if (unread == 0) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.sm),
                    child: Chip(
                      label: Text('$unread ongelezen'),
                      labelStyle: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                      backgroundColor: theme.colorScheme.primary,
                      padding: EdgeInsets.zero,
                    ),
                  );
                },
              ) ??
              const SizedBox.shrink(),
        ],
      ),
      body: messagesAsync.when(
        loading: () => const LoadingWidget(message: 'Berichten laden\u2026'),
        error: (err, _) => AppErrorWidget(
          message: err.toString().replaceFirst('Exception: ', ''),
          onRetry: () => ref.invalidate(messagesProvider),
        ),
        data: (messages) {
          if (messages.isEmpty) {
            return const _EmptyMessagesState();
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(messagesProvider),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
              ),
              itemCount: messages.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                indent: AppSpacing.md + 40 + AppSpacing.md,
              ),
              itemBuilder: (context, index) {
                final msg = messages[index];
                return _MessageListTile(
                  message: msg,
                  onTap: () => _openDetail(context, ref, msg),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _openDetail(BuildContext context, WidgetRef ref, MessageDto message) {
    // Mark as read when opening detail.
    if (!message.isRead) {
      ref.read(messageActionsNotifierProvider.notifier).markRead(message.id);
    }
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.xl),
        ),
      ),
      builder: (_) => _MessageDetailSheet(message: message, ref: ref),
    );
  }
}

// ---------------------------------------------------------------------------
// List tile
// ---------------------------------------------------------------------------

class _MessageListTile extends StatelessWidget {
  const _MessageListTile({
    required this.message,
    required this.onTap,
  });

  final MessageDto message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPlanPush = message.type == MessageType.planPush;
    final isUnread = !message.isRead;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unread dot + type icon stack
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isPlanPush
                        ? theme.colorScheme.tertiaryContainer
                        : theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Icon(
                    isPlanPush
                        ? Icons.notifications_active_rounded
                        : Icons.info_outline_rounded,
                    color: isPlanPush
                        ? theme.colorScheme.onTertiaryContainer
                        : theme.colorScheme.onSecondaryContainer,
                    size: 20,
                  ),
                ),
                if (isUnread)
                  Positioned(
                    top: -3,
                    right: -3,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.scaffoldBackgroundColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSpacing.md),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message.title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: isUnread
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        _formatDate(message.createdAt),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  if (message.description != null &&
                      message.description!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      message.description!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      final now = DateTime.now();
      final diff = now.difference(dt);
      if (diff.inDays == 0) return DateFormat('HH:mm').format(dt);
      if (diff.inDays == 1) return 'Gisteren';
      if (diff.inDays < 7) return DateFormat('E', 'nl_NL').format(dt);
      return DateFormat('d MMM', 'nl_NL').format(dt);
    } catch (_) {
      return '';
    }
  }
}

// ---------------------------------------------------------------------------
// Detail bottom sheet
// ---------------------------------------------------------------------------

class _MessageDetailSheet extends ConsumerStatefulWidget {
  const _MessageDetailSheet({
    required this.message,
    required this.ref,
  });

  final MessageDto message;
  final WidgetRef ref;

  @override
  ConsumerState<_MessageDetailSheet> createState() =>
      _MessageDetailSheetState();
}

class _MessageDetailSheetState extends ConsumerState<_MessageDetailSheet> {
  bool _isActing = false;

  Future<void> _execute(PlanPushAction action) async {
    setState(() => _isActing = true);
    final result = await ref
        .read(messageActionsNotifierProvider.notifier)
        .executeAction(widget.message.id, action);
    if (!mounted) return;
    setState(() => _isActing = false);
    result.when(
      success: (_) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              action == PlanPushAction.accept
                  ? 'Dienst geaccepteerd'
                  : 'Dienst afgewezen',
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final msg = widget.message;
    final isPlanPush = msg.type == MessageType.planPush;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.55,
      minChildSize: 0.35,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: isPlanPush
                              ? theme.colorScheme.tertiaryContainer
                              : theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        child: Icon(
                          isPlanPush
                              ? Icons.notifications_active_rounded
                              : Icons.info_outline_rounded,
                          color: isPlanPush
                              ? theme.colorScheme.onTertiaryContainer
                              : theme.colorScheme.onSecondaryContainer,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _formatFullDate(msg.createdAt),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (msg.description != null &&
                      msg.description!.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      msg.description!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                        height: 1.6,
                      ),
                    ),
                  ],
                  if (isPlanPush) ...[
                    const SizedBox(height: AppSpacing.xl),
                    const Divider(),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Actie vereist',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Accepteer of wijs de voorgestelde roosterwijziging af.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _isActing
                        ? const Center(child: CircularProgressIndicator())
                        : Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () =>
                                      _execute(PlanPushAction.decline),
                                  icon: const Icon(Icons.close_rounded),
                                  label: const Text('Afwijzen'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: theme.colorScheme.error,
                                    side: BorderSide(
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: FilledButton.icon(
                                  onPressed: () =>
                                      _execute(PlanPushAction.accept),
                                  icon: const Icon(Icons.check_rounded),
                                  label: const Text('Accepteren'),
                                ),
                              ),
                            ],
                          ),
                  ],
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatFullDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return DateFormat('EEEE d MMMM yyyy, HH:mm', 'nl_NL').format(dt);
    } catch (_) {
      return iso;
    }
  }
}

// ---------------------------------------------------------------------------
// Empty state
// ---------------------------------------------------------------------------

class _EmptyMessagesState extends StatelessWidget {
  const _EmptyMessagesState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.mark_email_read_rounded,
              size: 72,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Geen berichten',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Je hebt momenteel geen berichten\nin je berichtencentrum.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
