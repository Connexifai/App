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
  bool _isMonthView = true;
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
        _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
        _selectedDay = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
      });

  void _nextMonth() => setState(() {
        _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
        _selectedDay = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
      });

  void _selectDay(DateTime day) =>
      setState(() => _selectedDay = DateTime(day.year, day.month, day.day));

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

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

  @override
  Widget build(BuildContext context) {
    final calAsync = ref.watch(
      calendarProvider((from: _monthStart, to: _monthEnd)),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _CalendarHeader(
            focusedMonth: _focusedMonth,
            isMonthView: _isMonthView,
            onPrev: _prevMonth,
            onNext: _nextMonth,
            onToggleView: () =>
                setState(() => _isMonthView = !_isMonthView),
          ),
          Expanded(
            child: calAsync.when(
              loading: () =>
                  const Center(child: LoadingWidget(message: 'Kalender laden...')),
              error: (err, _) => AppErrorWidget(
                message: err.toString().replaceFirst('Exception: ', ''),
                onRetry: () => ref.invalidate(
                    calendarProvider((from: _monthStart, to: _monthEnd))),
              ),
              data: (dto) {
                if (_isMonthView) {
                  return _MonthView(
                    focusedMonth: _focusedMonth,
                    selectedDay: _selectedDay,
                    eventsForDay: (day) => _eventsForDay(dto, day),
                    onSelectDay: _selectDay,
                    sameDay: _sameDay,
                  );
                } else {
                  return _WeekView(
                    selectedDay: _selectedDay,
                    eventsForDay: (day) => _eventsForDay(dto, day),
                    onSelectDay: _selectDay,
                    sameDay: _sameDay,
                  );
                }
              },
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

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({
    required this.focusedMonth,
    required this.isMonthView,
    required this.onPrev,
    required this.onNext,
    required this.onToggleView,
  });

  final DateTime focusedMonth;
  final bool isMonthView;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onToggleView;

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.paddingOf(context).top;
    final label = _capitalize(
        DateFormat('MMMM yyyy', 'nl_NL').format(focusedMonth));

    return Container(
      padding: EdgeInsets.only(top: safeTop + 4, bottom: 12, left: 8, right: 8),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded,
                    color: AppColors.textPrimary),
                onPressed: onPrev,
              ),
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded,
                    color: AppColors.textPrimary),
                onPressed: onNext,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _ToggleBtn(
                    label: 'Maand',
                    selected: isMonthView,
                    onTap: () {
                      if (!isMonthView) onToggleView();
                    },
                  ),
                  _ToggleBtn(
                    label: 'Week',
                    selected: !isMonthView,
                    onTap: () {
                      if (isMonthView) onToggleView();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

class _ToggleBtn extends StatelessWidget {
  const _ToggleBtn(
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
          padding: const EdgeInsets.symmetric(vertical: 7),
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

// ---------------------------------------------------------------------------
// Month view
// ---------------------------------------------------------------------------

class _MonthView extends StatelessWidget {
  const _MonthView({
    required this.focusedMonth,
    required this.selectedDay,
    required this.eventsForDay,
    required this.onSelectDay,
    required this.sameDay,
  });

  final DateTime focusedMonth;
  final DateTime selectedDay;
  final List<CalendarEvent> Function(DateTime) eventsForDay;
  final ValueChanged<DateTime> onSelectDay;
  final bool Function(DateTime, DateTime) sameDay;

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final lastDay = DateTime(focusedMonth.year, focusedMonth.month + 1, 0);
    final startOffset = firstDay.weekday - 1; // Mon=0
    final totalCells = startOffset + lastDay.day;
    final rows = (totalCells / 7).ceil();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final selectedEvents = eventsForDay(selectedDay);

    return Column(
      children: [
        // Day-of-week headers
        Container(
          color: AppColors.card,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: const ['Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za', 'Zo']
                .map((d) => Expanded(
                      child: Text(d,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mutedForeground)),
                    ))
                .toList(),
          ),
        ),
        const Divider(height: 1, color: AppColors.border),

        // Grid
        Container(
          color: AppColors.card,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            children: List.generate(rows, (row) {
              return Row(
                children: List.generate(7, (col) {
                  final cellIndex = row * 7 + col;
                  final dayNum = cellIndex - startOffset + 1;
                  if (dayNum < 1 || dayNum > lastDay.day) {
                    return const Expanded(child: SizedBox(height: 48));
                  }
                  final cellDay = DateTime(
                      focusedMonth.year, focusedMonth.month, dayNum);
                  final events = eventsForDay(cellDay);
                  final isSelected = sameDay(cellDay, selectedDay);
                  final isToday = sameDay(cellDay, today);

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onSelectDay(cellDay),
                      child: Container(
                        height: 48,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : isToday
                                  ? AppColors.accent
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$dayNum',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : isToday
                                        ? AppColors.primary
                                        : AppColors.textPrimary,
                              ),
                            ),
                            if (events.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: events
                                    .take(3)
                                    .map((e) => Container(
                                          width: 5,
                                          height: 5,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white
                                                    .withValues(alpha: 0.8)
                                                : _dotColor(e),
                                            shape: BoxShape.circle,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ),

        const Divider(height: 1, color: AppColors.border),

        // Selected day events
        Expanded(
          child: selectedEvents.isEmpty
              ? const _EmptyDay()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: selectedEvents.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) =>
                      _EventCard(event: selectedEvents[i]),
                ),
        ),
      ],
    );
  }

  Color _dotColor(CalendarEvent e) => switch (e.type) {
        CalendarEventType.shift => AppColors.shiftAfternoon,
        CalendarEventType.absence => AppColors.shiftLeave,
        CalendarEventType.availability => AppColors.success,
        CalendarEventType.requestedAbsence => AppColors.warning,
      };
}

// ---------------------------------------------------------------------------
// Week view
// ---------------------------------------------------------------------------

class _WeekView extends StatelessWidget {
  const _WeekView({
    required this.selectedDay,
    required this.eventsForDay,
    required this.onSelectDay,
    required this.sameDay,
  });

  final DateTime selectedDay;
  final List<CalendarEvent> Function(DateTime) eventsForDay;
  final ValueChanged<DateTime> onSelectDay;
  final bool Function(DateTime, DateTime) sameDay;

  List<DateTime> get _weekDays {
    final monday =
        selectedDay.subtract(Duration(days: selectedDay.weekday - 1));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: _weekDays.map((day) {
        final events = eventsForDay(day);
        final isSelected = sameDay(day, selectedDay);
        final isToday = sameDay(day, today);
        final dayLabel =
            DateFormat('E', 'nl_NL').format(day).substring(0, 2).toUpperCase();

        return GestureDetector(
          onTap: () => onSelectDay(day),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.accent : AppColors.card,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                  child: Column(
                    children: [
                      Text(dayLabel,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mutedForeground)),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: isToday ? AppColors.primary : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isToday
                                  ? Colors.white
                                  : isSelected
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: events.isEmpty
                      ? const Text('Geen activiteiten',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.mutedForeground))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: events
                              .take(3)
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: _eventColor(e),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(e.title,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors
                                                          .textPrimary),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              if (e.startTime != null &&
                                                  e.endTime != null)
                                                Text(
                                                    '${e.startTime} – ${e.endTime}',
                                                    style: const TextStyle(
                                                        fontSize: 11,
                                                        color: AppColors
                                                            .textSecondary)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _eventColor(CalendarEvent e) => switch (e.type) {
        CalendarEventType.shift => AppColors.shiftAfternoon,
        CalendarEventType.absence => AppColors.shiftLeave,
        CalendarEventType.availability => AppColors.success,
        CalendarEventType.requestedAbsence => AppColors.warning,
      };
}

// ---------------------------------------------------------------------------
// Event card (for selected day detail in month view)
// ---------------------------------------------------------------------------

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event});
  final CalendarEvent event;

  @override
  Widget build(BuildContext context) {
    final color = _color();
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(event.title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary)),
                    ),
                    if (event.statusLabel != null)
                      _StatusChip(label: event.statusLabel!, color: color),
                  ],
                ),
                if (event.clientName != null) ...[
                  const SizedBox(height: 2),
                  Text(event.clientName!,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textSecondary)),
                ],
                if (event.startTime != null || event.endTime != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined,
                          size: 12, color: AppColors.mutedForeground),
                      const SizedBox(width: 4),
                      Text(_fmtTime(event.startTime, event.endTime),
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _color() => switch (event.type) {
        CalendarEventType.shift => AppColors.shiftAfternoon,
        CalendarEventType.absence => AppColors.shiftLeave,
        CalendarEventType.availability => AppColors.success,
        CalendarEventType.requestedAbsence => AppColors.warning,
      };

  String _fmtTime(String? start, String? end) {
    if (start != null && end != null) return '$start – $end';
    if (start != null) return 'Vanaf $start';
    if (end != null) return 'Tot $end';
    return '';
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w600, color: color)),
    );
  }
}

class _EmptyDay extends StatelessWidget {
  const _EmptyDay();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.event_busy_rounded, size: 48, color: Color(0x22626C7A)),
          SizedBox(height: 12),
          Text('Geen activiteiten',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary)),
          SizedBox(height: 4),
          Text('Er zijn geen activiteiten voor deze dag.',
              style: TextStyle(fontSize: 13, color: AppColors.mutedForeground)),
        ],
      ),
    );
  }
}
