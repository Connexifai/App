import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planbition_app/features/marketplace/marketplace_models.dart';
import 'package:planbition_app/features/marketplace/marketplace_provider.dart';
import 'package:planbition_app/shared/theme/app_theme.dart';
import 'package:planbition_app/shared/widgets/loading_widget.dart';
import 'package:planbition_app/shared/widgets/error_widget.dart' as app_widgets;

class MarketplaceScreen extends ConsumerWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftsAsync = ref.watch(marketplaceShiftsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marktplaats'),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(marketplaceShiftsProvider),
        child: shiftsAsync.when(
          loading: () => const LoadingWidget(),
          error: (e, _) => app_widgets.AppErrorWidget(
            message: e.toString(),
            onRetry: () => ref.invalidate(marketplaceShiftsProvider),
          ),
          data: (shifts) {
            if (shifts.isEmpty) {
              return ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(AppSpacing.xl),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.storefront_outlined,
                              size: 64, color: Colors.grey),
                          SizedBox(height: AppSpacing.md),
                          Text(
                            'Geen diensten beschikbaar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: shifts.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, i) =>
                  _ShiftCard(shift: shifts[i]),
            );
          },
        ),
      ),
    );
  }
}

class _ShiftCard extends ConsumerStatefulWidget {
  const _ShiftCard({required this.shift});

  final MarketplaceShiftDto shift;

  @override
  ConsumerState<_ShiftCard> createState() => _ShiftCardState();
}

class _ShiftCardState extends ConsumerState<_ShiftCard> {
  bool _isLoading = false;

  String _formatTime(Map<String, dynamic> t) {
    final h = (t['hour'] as num?)?.toInt() ?? 0;
    final m = (t['minute'] as num?)?.toInt() ?? 0;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  String _formatDate(Map<String, dynamic> d) {
    final day = (d['day'] as num?)?.toInt() ?? 0;
    final month = (d['month'] as num?)?.toInt() ?? 0;
    final year = (d['year'] as num?)?.toInt() ?? 0;
    return '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
  }

  Future<void> _toggleSchedule() async {
    setState(() => _isLoading = true);
    try {
      final notifier =
          ref.read(marketplaceScheduleNotifierProvider.notifier);
      if (widget.shift.isScheduled) {
        await notifier.unschedule(widget.shift.id);
      } else {
        await notifier.schedule(widget.shift.id);
      }

      if (!mounted) return;
      final state = ref.read(marketplaceScheduleNotifierProvider);
      state.when(
        data: (_) => _showSnackBar(
          widget.shift.isScheduled
              ? 'Uitgeschreven van dienst.'
              : 'Ingeschreven voor dienst.',
        ),
        loading: () {},
        error: (e, _) => _showSnackBar(e.toString(), isError: true),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final shift = widget.shift;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    shift.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (shift.isScheduled)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(
                      'Ingeschreven',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            if (shift.clientName != null) ...[
              Row(
                children: [
                  Icon(Icons.business_outlined,
                      size: 16, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    shift.clientName!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
            ],
            Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 16, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  _formatDate(shift.scheduleDate),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(width: AppSpacing.md),
                Icon(Icons.access_time_outlined,
                    size: 16, color: colorScheme.onSurfaceVariant),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '${_formatTime(shift.startTime)} - ${_formatTime(shift.endTime)}',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            if (shift.distance != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 16, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '${shift.distance!.toStringAsFixed(1)} km',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              width: double.infinity,
              child: _isLoading
                  ? const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : shift.isScheduled
                      ? OutlinedButton.icon(
                          onPressed: _toggleSchedule,
                          icon: const Icon(Icons.remove_circle_outline),
                          label: const Text('Uitschrijven'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: colorScheme.error,
                            side: BorderSide(color: colorScheme.error),
                          ),
                        )
                      : FilledButton.icon(
                          onPressed: _toggleSchedule,
                          icon: const Icon(Icons.add_circle_outline),
                          label: const Text('Inschrijven'),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
