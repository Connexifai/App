import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/models/response_wrapper.dart';
import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loading_widget.dart';
import 'message_models.dart';
import 'messages_provider.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  const MessagesScreen({super.key});

  @override
  ConsumerState<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  bool _showArchive = false;

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(messagesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _MessagesHeader(onBack: () => context.go(AppRoutes.dashboard)),
          // Tabs
          Container(
            color: AppColors.card,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _TabBtn(
                    label: 'Inbox',
                    selected: !_showArchive,
                    onTap: () => setState(() => _showArchive = false),
                  ),
                  _TabBtn(
                    label: 'Archief',
                    selected: _showArchive,
                    onTap: () => setState(() => _showArchive = true),
                  ),
                ],
              ),
            ),
          ),
          // Content
          Expanded(
            child: messagesAsync.when(
              loading: () =>
                  const Center(child: LoadingWidget(message: 'Berichten laden...')),
              error: (err, _) => AppErrorWidget(
                message: err.toString().replaceFirst('Exception: ', ''),
                onRetry: () => ref.invalidate(messagesProvider),
              ),
              data: (messages) {
                if (messages.isEmpty) return const _EmptyMessages();
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(messagesProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: messages.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: AppColors.border),
                    itemBuilder: (context, i) => _MessageTile(
                      message: messages[i],
                      onTap: () => _openDetail(context, ref, messages[i]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, WidgetRef ref, MessageDto message) {
    if (!message.isRead) {
      ref.read(messageActionsNotifierProvider.notifier).markRead(message.id);
    }
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => _MessageDetailSheet(message: message, ref: ref),
    );
  }
}

class _MessagesHeader extends StatelessWidget {
  const _MessagesHeader({required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.paddingOf(context).top;
    return Container(
      padding: EdgeInsets.only(top: safeTop, left: 4, right: 16, bottom: 0),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
                size: 22, color: AppColors.textPrimary),
            onPressed: onBack,
          ),
          const Text(
            'Berichten',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _TabBtn extends StatelessWidget {
  const _TabBtn(
      {required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected ? AppColors.card : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: selected
                ? [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 4,
                        offset: const Offset(0, 1))
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected
                  ? AppColors.textPrimary
                  : AppColors.mutedForeground,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({required this.message, required this.onTap});
  final MessageDto message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isPlanPush = message.type == MessageType.planPush;
    final isUnread = !message.isRead;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    isPlanPush
                        ? Icons.notifications_active_rounded
                        : Icons.info_outline_rounded,
                    color: AppColors.accentForeground,
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
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.card, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                isUnread ? FontWeight.w700 : FontWeight.w400,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _fmtDate(message.createdAt),
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.mutedForeground),
                      ),
                    ],
                  ),
                  if (message.description != null &&
                      message.description!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      message.description!,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textSecondary),
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

  String _fmtDate(String iso) {
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

class _MessageDetailSheet extends ConsumerStatefulWidget {
  const _MessageDetailSheet({required this.message, required this.ref});
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
            content: Text(action == PlanPushAction.accept
                ? 'Dienst geaccepteerd'
                : 'Dienst afgewezen'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      failure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.destructive,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24),
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
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isPlanPush
                              ? Icons.notifications_active_rounded
                              : Icons.info_outline_rounded,
                          color: AppColors.accentForeground,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(msg.title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary)),
                            const SizedBox(height: 2),
                            Text(
                              _fmtFull(msg.createdAt),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (msg.description != null &&
                      msg.description!.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(msg.description!,
                        style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary,
                            height: 1.6)),
                  ],
                  if (isPlanPush) ...[
                    const SizedBox(height: 24),
                    const Divider(color: AppColors.border),
                    const SizedBox(height: 16),
                    const Text('Actie vereist',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    const Text(
                      'Accepteer of wijs de voorgestelde roosterwijziging af.',
                      style: TextStyle(
                          fontSize: 12, color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 16),
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
                                    foregroundColor: AppColors.destructive,
                                    side: const BorderSide(
                                        color: AppColors.destructive),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
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
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _fmtFull(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return DateFormat('EEEE d MMMM yyyy, HH:mm', 'nl_NL').format(dt);
    } catch (_) {
      return iso;
    }
  }
}

class _EmptyMessages extends StatelessWidget {
  const _EmptyMessages();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mark_email_read_rounded,
              size: 64, color: Color(0x33626C7A)),
          SizedBox(height: 16),
          Text('Geen berichten',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary)),
          SizedBox(height: 4),
          Text('Je hebt momenteel geen berichten.',
              style: TextStyle(fontSize: 13, color: AppColors.mutedForeground)),
        ],
      ),
    );
  }
}
