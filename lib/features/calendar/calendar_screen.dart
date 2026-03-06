import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loading_widget.dart';
import 'calendar_models.dart';
import 'calendar_provider.dart';

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late DateTime _focusedMonth;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
    _selectedDay = DateTime(now.year, now.month, now.day);
  }

  DateTime get _monthStart => DateTime(_focusedMonth.year, _focusedMonth.month);
  DateTime get _monthEnd =>
      DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0);

  void _prevMonth() => setState(() {
        _focusedMonth =
            DateTime(_focusedMonth.year, _focusedMonth.month - 1);
        _selectedDay = DateTime(
          _focusedMonth.year,
          _focusedMonth.month,
          1,
        );
      });

  void _nextMonth() => setState(() {
        _focusedMonth =
            DateTime(_focusedMonth.year, _focusedMonth.month + 1);
        _selectedDay = DateTime(
          _focusedMonth.year,
          _focusedMonth.month,
          1,
        );
      });

  void _selectDay(DateTime day) =>
      setState(() => _selectedDay = DateTime(day.year, day.month, day.day));

  /// Returns the Monday-anchored week that contains [_selectedDay].
  List<DateTime> get _weekDays {
    final monday = _selectedDay.subtract(
      Duration(days: _selectedDay.weekday - 1),
    );
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  List<CalendarEvent> _eventsForDay(CalendarDto dto, DateTime day) {
    final events = <CalendarEvent>[];
    for (final raw in dto.schedules) {
      final e = scheduleToEvent(raw);
      if (_sameDay(e.date, day)) events.add(e);
    }
    for (final raw in dto.absences) {
      final e = absenceToEvent(raw);
      if (_sameDay(e.date, day)) events.add(e);
    }
    for (final raw in dto.availabilities) {
      final e = availabilityToEvent(raw);
      if (_sameDay(e.date, day)) events.add(e);
    }
    for (final raw in dto.requestedAbsences) {
      final e = requestedAbsenceToEvent(raw);
      if (_sameDay(e.date, day)) events.add(e);
    }
    return events;
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final calAsync = ref.watch(
      calendarProvider((from: _monthStart, to: _monthEnd)),
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _AppBar(
            focusedMonth: _focusedMonth,
            onPrev: _prevMonth,
            onNext: _nextMonth,
          ),
          SliverToBoxAdapter(
            child: _WeekStrip(
              weekDays: _weekDays,
              selectedDay: _selectedDay,
              onSelect: _selectDay,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
          calAsync.when(
            loading: () => const SliverFillRemaining(
              child: LoadingWidget(message: 'Kalender laden\u2026'),
            ),
            error: (err, _) => SliverFillRemaining(
              child: AppErrorWidget(
                message: err.toString().replaceFirst('Exception: ', ''),
                onRetry: () => ref.invalidate(
                  calendarProvider((from: _monthStart, to: _monthEnd)),
                ),
              ),
            ),
            data: (dto) {
              final events = _eventsForDay(dto, _selectedDay);
              if (events.isEmpty) {
                return const SliverFillRemaining(
                  child: _EmptyDayState(),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                sliver: SliverList.separated(
                  itemCount: events.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) =>
                      _EventCard(event: events[index]),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.focusedMonth,
    required this.onPrev,
    required this.onNext,
  });

  final DateTime focusedMonth;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = DateFormat('MMMM yyyy', 'nl_NL').format(focusedMonth);

    return SliverAppBar(
      pinned: true,
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      title: const Text('Rooster'),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xs,
            0,
            AppSpacing.xs,
            AppSpacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                onPressed: onPrev,
                tooltip: 'Vorige maand',
              ),
              Text(
                _capitalise(label),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded),
                onPressed: onNext,
                tooltip: 'Volgende maand',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _capitalise(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

// ---------------------------------------------------------------------------
// Week strip
// ---------------------------------------------------------------------------

class _WeekStrip extends StatelessWidget {
  const _WeekStrip({
    required this.weekDays,
    required this.selectedDay,
    required this.onSelect,
  });

  final List<DateTime> weekDays;
  final DateTime selectedDay;
  final ValueChanged<DateTime> onSelect;

  bool _isSelected(DateTime d) =>
      d.year == selectedDay.year &&
      d.month == selectedDay.month &&
      d.day == selectedDay.day;

  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekDays.map((day) {
          final selected = _isSelected(day);
          final today = _isToday(day);
          final dayLabel = DateFormat('E', 'nl_NL').format(day);
          final dayNum = day.day.toString();

          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(day),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? theme.colorScheme.primary
                      : today
                          ? theme.colorScheme.primaryContainer
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dayLabel.substring(0, 2).toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: selected
                            ? theme.colorScheme.onPrimary
                            : today
                                ? theme.colorScheme.onPrimaryContainer
                                : theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dayNum,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: selected
                            ? theme.colorScheme.onPrimary
                            : today
                                ? theme.colorScheme.onPrimaryContainer
                                : theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Event card
// ---------------------------------------------------------------------------

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event});

  final CalendarEvent event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, color) = _iconAndColor(theme);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (event.statusLabel != null)
                        _StatusChip(label: event.statusLabel!, color: color),
                    ],
                  ),
                  if (event.clientName != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      event.clientName!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (event.startTime != null || event.endTime != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          size: 14,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(event.startTime, event.endTime),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (event.departmentName != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Icon(
                          Icons.business_rounded,
                          size: 14,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            event.departmentName!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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

  (IconData, Color) _iconAndColor(ThemeData theme) => switch (event.type) {
        CalendarEventType.shift => (
            Icons.work_outline_rounded,
            theme.colorScheme.primary,
          ),
        CalendarEventType.absence => (
            Icons.beach_access_rounded,
            AppColors.shiftAbsence,
          ),
        CalendarEventType.availability => (
            Icons.event_available_rounded,
            AppColors.success,
          ),
        CalendarEventType.requestedAbsence => (
            Icons.pending_actions_rounded,
            AppColors.warning,
          ),
      };

  String _formatTime(String? start, String? end) {
    if (start != null && end != null) return '$start \u2013 $end';
    if (start != null) return 'Vanaf $start';
    if (end != null) return 'Tot $end';
    return '';
  }
}

// ---------------------------------------------------------------------------
// Status chip
// ---------------------------------------------------------------------------

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Empty state
// ---------------------------------------------------------------------------

class _EmptyDayState extends StatelessWidget {
  const _EmptyDayState();

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
              Icons.event_busy_rounded,
              size: 64,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Geen activiteiten',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Er zijn geen ingeplande activiteiten\nvoor deze dag.',
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
