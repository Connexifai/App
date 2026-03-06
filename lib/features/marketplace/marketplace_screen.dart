import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loading_widget.dart';
import 'marketplace_models.dart';
import 'marketplace_provider.dart';

class MarketplaceScreen extends ConsumerStatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  ConsumerState<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends ConsumerState<MarketplaceScreen> {
  bool _showScheduled = false;

  @override
  Widget build(BuildContext context) {
    final shiftsAsync = ref.watch(marketplaceShiftsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _BackHeader(
            title: 'Marketplace',
            onBack: () => context.go(AppRoutes.dashboard),
          ),
          Expanded(
            child: shiftsAsync.when(
              loading: () => const Center(
                  child: LoadingWidget(message: 'Marktplaats laden...')),
              error: (err, _) => AppErrorWidget(
                message: err.toString().replaceFirst('Exception: ', ''),
                onRetry: () => ref.invalidate(marketplaceShiftsProvider),
              ),
              data: (shifts) => _MarketplaceBody(
                shifts: shifts,
                showScheduled: _showScheduled,
                onTabChanged: (v) => setState(() => _showScheduled = v),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketplaceBody extends StatelessWidget {
  const _MarketplaceBody({
    required this.shifts,
    required this.showScheduled,
    required this.onTabChanged,
  });

  final List<MarketplaceShiftDto> shifts;
  final bool showScheduled;
  final ValueChanged<bool> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final filtered =
        shifts.where((s) => showScheduled ? s.isScheduled : !s.isScheduled).toList();
    final availableCount = shifts.where((s) => !s.isScheduled).length;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.muted,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _TabBtn(
                  label: 'Beschikbaar',
                  icon: Icons.shopping_bag_outlined,
                  badge: availableCount > 0 ? '$availableCount' : null,
                  selected: !showScheduled,
                  onTap: () => onTabChanged(false),
                ),
                _TabBtn(
                  label: 'Ingepland',
                  icon: Icons.check_circle_outline_rounded,
                  selected: showScheduled,
                  onTap: () => onTabChanged(true),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_bag_outlined,
                          size: 48,
                          color: AppColors.mutedForeground.withValues(alpha: 0.4)),
                      const SizedBox(height: 12),
                      Text(
                        showScheduled
                            ? 'Nog geen diensten ingepland'
                            : 'Geen beschikbare diensten',
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.mutedForeground),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) => _ShiftCard(shift: filtered[i]),
                ),
        ),
      ],
    );
  }
}

class _TabBtn extends StatelessWidget {
  const _TabBtn({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final String? badge;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 16,
                  color: selected
                      ? AppColors.textPrimary
                      : AppColors.mutedForeground),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected
                      ? AppColors.textPrimary
                      : AppColors.mutedForeground,
                ),
              ),
              if (badge != null) ...[
                const SizedBox(width: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.secondaryForeground,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ShiftCard extends StatelessWidget {
  const _ShiftCard({required this.shift});
  final MarketplaceShiftDto shift;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left color strip
          Container(
            width: 5,
            color: AppColors.shiftAfternoon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shift.clientName != null
                        ? '${shift.name} | ${shift.clientName}'
                        : shift.name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary),
                  ),
                  if (shift.departmentName != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      shift.departmentName!,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.mutedForeground),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined,
                          size: 13, color: AppColors.mutedForeground),
                      const SizedBox(width: 4),
                      Text(
                        _fmtDate(shift.scheduleDate),
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textSecondary),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time_outlined,
                          size: 13, color: AppColors.mutedForeground),
                      const SizedBox(width: 4),
                      Text(
                        '${_fmtTime(shift.startTime)} - ${_fmtTime(shift.endTime)}',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 1, color: AppColors.border),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                          shift.isScheduled
                              ? Icons.delete_outline_rounded
                              : Icons.add_rounded,
                          size: 16),
                      label: Text(shift.isScheduled ? 'Verwijderen' : 'Inplannen'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _fmtDate(Map<String, dynamic> d) {
    final day = (d['day'] as num?)?.toInt() ?? 0;
    final month = (d['month'] as num?)?.toInt() ?? 0;
    const months = [
      'jan', 'feb', 'mrt', 'apr', 'mei', 'jun',
      'jul', 'aug', 'sep', 'okt', 'nov', 'dec',
    ];
    final m = month >= 1 && month <= 12 ? months[month - 1] : '';
    return '$day $m';
  }

  String _fmtTime(Map<String, dynamic> t) {
    final h = (t['hour'] as num?)?.toInt() ?? 0;
    final m = (t['minute'] as num?)?.toInt() ?? 0;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }
}

// ---------------------------------------------------------------------------
// Shared back-arrow header
// ---------------------------------------------------------------------------

class _BackHeader extends StatelessWidget {
  const _BackHeader({required this.title, required this.onBack});

  final String title;
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
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
