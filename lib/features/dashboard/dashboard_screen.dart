import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/models/access_rights.dart';
import '../../core/router/app_router.dart';
import '../../core/utils/date_utils.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/loading_widget.dart';
import '../login/auth_provider.dart';
import 'dashboard_models.dart';
import 'dashboard_provider.dart';
import 'widgets/next_shift_card.dart';
import 'widgets/punch_button.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftsAsync = ref.watch(firstShiftsProvider);
    final rights = ref.watch(accessRightsProvider);
    final authState = ref.watch(authNotifierProvider);

    final userName = authState.maybeWhen(
      authenticated: (session, _) => session.tenantIdentity,
      orElse: () => null,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _DashboardHeader(userName: userName),
          Expanded(
            child: shiftsAsync.when(
              loading: () =>
                  const Center(child: LoadingWidget(message: 'Laden...')),
              error: (err, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline,
                          size: 48, color: AppColors.destructive),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        err.toString().replaceFirst('Exception: ', ''),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      FilledButton(
                        onPressed: () => ref.invalidate(firstShiftsProvider),
                        child: const Text('Opnieuw'),
                      ),
                    ],
                  ),
                ),
              ),
              data: (shifts) => _DashboardBody(
                shifts: shifts,
                rights: rights,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Header
// ---------------------------------------------------------------------------

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({this.userName});

  final String? userName;

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Goedemorgen';
    if (hour < 18) return 'Goedemiddag';
    return 'Goedenavond';
  }

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.paddingOf(context).top;

    return Container(
      padding: EdgeInsets.only(
        top: safeTop + 4,
        bottom: 12,
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.fingerprint,
                        color: Colors.white, size: 18),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'StaffApp',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _HeaderIconBtn(
                    icon: Icons.notifications_outlined,
                    badge: true,
                    onTap: () => context.go(AppRoutes.messages),
                  ),
                  const SizedBox(width: 4),
                  _HeaderIconBtn(
                    icon: Icons.person_outline_rounded,
                    onTap: () => context.go(AppRoutes.profile),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _greeting,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            DateFormat('EEEE d MMMM yyyy', 'nl_NL').format(DateTime.now()),
            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconBtn extends StatelessWidget {
  const _HeaderIconBtn({
    required this.icon,
    required this.onTap,
    this.badge = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool badge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(icon, size: 22, color: AppColors.textPrimary),
            onPressed: onTap,
          ),
        ),
        if (badge)
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.destructive,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({required this.shifts, required this.rights});

  final List<ShiftDto> shifts;
  final AccessRights rights;

  @override
  Widget build(BuildContext context) {
    if (shifts.isEmpty) return const _EmptyDashboard();

    final nextShift = shifts.first;
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final sundayEnd = DateTime(
        monday.year, monday.month, monday.day + 6, 23, 59);

    final thisWeek = shifts.where((s) {
      final d = PlanbitionDateUtils.parseDateObject(s.scheduleDate);
      if (d == null) return false;
      final dayStart = DateTime(d.year, d.month, d.day);
      final weekStart =
          DateTime(monday.year, monday.month, monday.day);
      return !dayStart.isBefore(weekStart) && !dayStart.isAfter(sundayEnd);
    }).toList();

    double totalHours = 0;
    for (final s in shifts) {
      final start = PlanbitionDateUtils.parseTimeObject(s.startTime);
      final end = PlanbitionDateUtils.parseTimeObject(s.endTime);
      if (start != null && end != null && end > start) {
        totalHours += (end - start).inMinutes / 60.0;
      }
    }

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _StatsRow(
          totalShifts: shifts.length,
          thisWeekCount: thisWeek.length,
          totalHours: totalHours,
        ),
        const SizedBox(height: 16),

        if (rights.featureGeofencingEnabled || rights.featureQrCodeEnabled) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PunchButton(shift: nextShift, accessRights: rights),
          ),
          const SizedBox(height: 16),
        ],

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _NextShiftCard(shift: nextShift),
        ),

        if (thisWeek.isNotEmpty) ...[
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'DEZE WEEK',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.mutedForeground,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...thisWeek.map(
            (s) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              child: NextShiftCard(shift: s, isNext: s == nextShift),
            ),
          ),
        ],

        const SizedBox(height: 80),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Stats row
// ---------------------------------------------------------------------------

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.totalShifts,
    required this.thisWeekCount,
    required this.totalHours,
  });

  final int totalShifts;
  final int thisWeekCount;
  final double totalHours;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          _StatItem(
            icon: Icons.work_outline_rounded,
            value: '$totalShifts',
            label: 'Diensten',
          ),
          Container(width: 1, height: 40, color: AppColors.border),
          _StatItem(
            icon: Icons.calendar_today_outlined,
            value: '$thisWeekCount',
            label: 'Deze week',
          ),
          Container(width: 1, height: 40, color: AppColors.border),
          _StatItem(
            icon: Icons.access_time_outlined,
            value: totalHours.toStringAsFixed(0),
            label: 'Uren',
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppColors.mutedForeground),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Next shift card
// ---------------------------------------------------------------------------

class _NextShiftCard extends StatelessWidget {
  const _NextShiftCard({required this.shift});

  final ShiftDto shift;

  @override
  Widget build(BuildContext context) {
    final date = PlanbitionDateUtils.parseDateObject(shift.scheduleDate);
    final start = PlanbitionDateUtils.parseTimeObject(shift.startTime);
    final end = PlanbitionDateUtils.parseTimeObject(shift.endTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'VOLGENDE DIENST',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date header strip
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        size: 14, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      date != null
                          ? DateFormat('EEEE d MMMM', 'nl_NL').format(date)
                          : '—',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Details
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      [
                        shift.name,
                        if (shift.clientName != null) shift.clientName!,
                      ].join(' | '),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (shift.departmentName != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        shift.departmentName!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_time_outlined,
                            size: 14, color: AppColors.mutedForeground),
                        const SizedBox(width: 4),
                        Text(
                          (start != null && end != null)
                              ? '${_fmt(start)} – ${_fmt(end)}'
                              : '—',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    if (shift.address != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 14, color: AppColors.mutedForeground),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              shift.address!.displayLine,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (shift.scheduledRemark != null &&
                        shift.scheduledRemark!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.chat_bubble_outline,
                                size: 13, color: AppColors.accentForeground),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                shift.scheduledRemark!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.accentForeground,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _fmt(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    return '$h:$m';
  }
}

// ---------------------------------------------------------------------------
// Empty state
// ---------------------------------------------------------------------------

class _EmptyDashboard extends StatelessWidget {
  const _EmptyDashboard();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.event_available_rounded,
                size: 72, color: Color(0x33246AEB)),
            SizedBox(height: AppSpacing.md),
            Text(
              'Geen aankomende diensten',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSpacing.xs),
            Text(
              'Je hebt momenteel geen geplande diensten.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
