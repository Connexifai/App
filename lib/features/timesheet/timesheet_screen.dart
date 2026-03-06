import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart' as app_widgets;
import '../../shared/widgets/loading_widget.dart';
import 'timesheet_models.dart';
import 'timesheet_provider.dart';

class TimesheetScreen extends ConsumerStatefulWidget {
  const TimesheetScreen({super.key});

  @override
  ConsumerState<TimesheetScreen> createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends ConsumerState<TimesheetScreen> {
  int _periodIndex = 0;
  List<TimesheetPeriodDto> _periods = [];

  final Map<int, Map<String, dynamic>> _actualStartTimes = {};
  final Map<int, Map<String, dynamic>> _actualEndTimes = {};

  TimesheetPeriodDto? get _currentPeriod =>
      _periods.isEmpty ? null : _periods[_periodIndex];

  Map<String, dynamic> _timeOfDayToMap(TimeOfDay t) =>
      {'hour': t.hour, 'minute': t.minute, 'second': 0};

  String _fmtTime(Map<String, dynamic>? t) {
    if (t == null) return '--:--';
    final h = (t['hour'] as num?)?.toInt() ?? 0;
    final m = (t['minute'] as num?)?.toInt() ?? 0;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  String _fmtDate(Map<String, dynamic> d) {
    final day = (d['day'] as num?)?.toInt() ?? 0;
    final month = (d['month'] as num?)?.toInt() ?? 0;
    final year = (d['year'] as num?)?.toInt() ?? 0;
    return '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
  }

  String _dayAbbr(Map<String, dynamic> d) {
    final day = (d['day'] as num?)?.toInt() ?? 1;
    final month = ((d['month'] as num?)?.toInt() ?? 1) - 1;
    final year = (d['year'] as num?)?.toInt() ?? 2024;
    final dt = DateTime(year, month + 1, day);
    const labels = ['Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za', 'Zo'];
    return labels[dt.weekday - 1];
  }

  int _calcHours(Map<String, dynamic>? start, Map<String, dynamic>? end) {
    if (start == null || end == null) return 0;
    final sh = (start['hour'] as num?)?.toInt() ?? 0;
    final sm = (start['minute'] as num?)?.toInt() ?? 0;
    final eh = (end['hour'] as num?)?.toInt() ?? 0;
    final em = (end['minute'] as num?)?.toInt() ?? 0;
    final diff = (eh * 60 + em) - (sh * 60 + sm);
    return diff > 0 ? (diff / 60).round() : 0;
  }

  Future<void> _openEditSheet(TimesheetShiftDto shift) async {
    final initialStart = shift.actualStartTime ?? shift.startTime;
    final initialEnd = shift.actualEndTime ?? shift.endTime;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => _EditShiftSheet(
        shift: shift,
        initialStart: TimeOfDay(
          hour: (initialStart['hour'] as num?)?.toInt() ?? 0,
          minute: (initialStart['minute'] as num?)?.toInt() ?? 0,
        ),
        initialEnd: TimeOfDay(
          hour: (initialEnd['hour'] as num?)?.toInt() ?? 0,
          minute: (initialEnd['minute'] as num?)?.toInt() ?? 0,
        ),
        onSave: (start, end) {
          setState(() {
            _actualStartTimes[shift.id] = _timeOfDayToMap(start);
            _actualEndTimes[shift.id] = _timeOfDayToMap(end);
          });
        },
      ),
    );
  }

  Future<void> _submitAll() async {
    final period = _currentPeriod;
    if (period == null) return;
    final entries = <TimesheetSubmitRequestDto>[];
    for (final shift in period.shifts) {
      if (shift.isSubmitted) continue;
      entries.add(TimesheetSubmitRequestDto(
        scheduleId: shift.id,
        actualStartTime:
            _actualStartTimes[shift.id] ?? shift.actualStartTime ?? shift.startTime,
        actualEndTime:
            _actualEndTimes[shift.id] ?? shift.actualEndTime ?? shift.endTime,
        remark: null,
      ));
    }
    if (entries.isEmpty) {
      _snack('Geen uren om in te dienen.');
      return;
    }
    await ref.read(timesheetSubmitNotifierProvider.notifier).submit(entries);
    if (!mounted) return;
    ref.read(timesheetSubmitNotifierProvider).when(
      data: (_) => _snack('Uren ingediend.'),
      loading: () {},
      error: (e, _) => _snack(e.toString(), error: true),
    );
  }

  void _snack(String msg, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: error ? AppColors.destructive : AppColors.primary,
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final periodsAsync = ref.watch(timesheetPeriodsProvider);
    final isSubmitting = ref.watch(timesheetSubmitNotifierProvider).isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _TimesheetHeader(),
          Expanded(
            child: periodsAsync.when(
              loading: () => const Center(
                  child: LoadingWidget(message: 'Uren laden...')),
              error: (e, _) => app_widgets.AppErrorWidget(
                message: e.toString(),
                onRetry: () => ref.invalidate(timesheetPeriodsProvider),
              ),
              data: (periods) {
                if (periods.isEmpty) {
                  return const Center(
                    child: Text('Geen periodes gevonden.',
                        style: TextStyle(color: AppColors.mutedForeground)),
                  );
                }
                if (_periods.length != periods.length) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      _periods = periods;
                      if (_periodIndex >= periods.length) {
                        _periodIndex = periods.length - 1;
                      }
                    });
                  });
                }
                final idx = _periodIndex.clamp(0, periods.length - 1);
                final period = periods[idx];
                return _buildContent(period, periods.length, isSubmitting);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
      TimesheetPeriodDto period, int totalPeriods, bool isSubmitting) {
    // Calculate total hours for unsubmitted shifts
    int totalHours = 0;
    int draftCount = 0;
    for (final s in period.shifts) {
      final start = _actualStartTimes[s.id] ?? s.actualStartTime ?? s.startTime;
      final end = _actualEndTimes[s.id] ?? s.actualEndTime ?? s.endTime;
      totalHours += _calcHours(start, end);
      if (!s.isSubmitted) draftCount++;
    }

    return Column(
      children: [
        // Period selector
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          color: AppColors.card,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded,
                    color: AppColors.textPrimary),
                onPressed: _periodIndex > 0
                    ? () => setState(() => _periodIndex--)
                    : null,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${_fmtDate(period.from)} — ${_fmtDate(period.till)}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary),
                      textAlign: TextAlign.center,
                    ),
                    if (period.isSubmitted) ...[
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Ingediend',
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.success,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded,
                    color: AppColors.textPrimary),
                onPressed: _periodIndex < totalPeriods - 1
                    ? () => setState(() => _periodIndex++)
                    : null,
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.border),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
            children: [
              // Summary card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.15)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Totaal deze periode',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.mutedForeground)),
                          Text('${totalHours}u',
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (draftCount > 0) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.muted,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$draftCount concept${draftCount > 1 ? 'en' : ''}',
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.mutedForeground,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        if (!period.isSubmitted)
                          SizedBox(
                            height: 32,
                            child: FilledButton.icon(
                              onPressed: isSubmitting ? null : _submitAll,
                              icon: isSubmitting
                                  ? const SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white))
                                  : const Icon(Icons.send_rounded, size: 14),
                              label: Text(
                                isSubmitting ? 'Bezig...' : 'Indienen',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Shift entries
              if (period.shifts.isEmpty && period.absences.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                      child: Text('Geen diensten in deze periode.',
                          style: TextStyle(color: AppColors.mutedForeground))),
                ),
              ...period.shifts.map((shift) {
                final actualStart =
                    _actualStartTimes[shift.id] ?? shift.actualStartTime;
                final actualEnd =
                    _actualEndTimes[shift.id] ?? shift.actualEndTime;
                final hours = _calcHours(
                  actualStart ?? shift.startTime,
                  actualEnd ?? shift.endTime,
                );
                return _ShiftEntry(
                  dayAbbr: _dayAbbr(shift.scheduleDate),
                  dayNum: (shift.scheduleDate['day'] as num?)?.toInt() ?? 0,
                  name: shift.name,
                  clientName: shift.clientName,
                  startTime: _fmtTime(actualStart ?? shift.startTime),
                  endTime: _fmtTime(actualEnd ?? shift.endTime),
                  hours: hours,
                  isSubmitted: shift.isSubmitted,
                  isDraft: !shift.isSubmitted,
                  onEdit: (!period.isSubmitted && !shift.isSubmitted)
                      ? () => _openEditSheet(shift)
                      : null,
                );
              }),
              if (period.absences.isNotEmpty) ...[
                const SizedBox(height: 8),
                ...period.absences.map((a) => _AbsenceEntry(
                      dayAbbr: _dayAbbr(a.scheduleDate),
                      dayNum:
                          (a.scheduleDate['day'] as num?)?.toInt() ?? 0,
                      name: a.name,
                      startTime: _fmtTime(a.startTime),
                      endTime: _fmtTime(a.endTime),
                    )),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Header
// ---------------------------------------------------------------------------

class _TimesheetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.paddingOf(context).top;
    return Container(
      padding: EdgeInsets.only(top: safeTop, left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: const Text('Urenregistratie',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary)),
    );
  }
}

// ---------------------------------------------------------------------------
// Entry widgets
// ---------------------------------------------------------------------------

class _ShiftEntry extends StatelessWidget {
  const _ShiftEntry({
    required this.dayAbbr,
    required this.dayNum,
    required this.name,
    required this.clientName,
    required this.startTime,
    required this.endTime,
    required this.hours,
    required this.isSubmitted,
    required this.isDraft,
    required this.onEdit,
  });

  final String dayAbbr;
  final int dayNum;
  final String name;
  final String? clientName;
  final String startTime;
  final String endTime;
  final int hours;
  final bool isSubmitted;
  final bool isDraft;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final (statusLabel, statusColor, statusBg) = isSubmitted
        ? ('Goedgekeurd', AppColors.success, AppColors.success.withValues(alpha: 0.1))
        : isDraft
            ? ('Concept', AppColors.mutedForeground, AppColors.muted)
            : ('Ingediend', AppColors.primary, AppColors.primary.withValues(alpha: 0.1));

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Day column
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: AppColors.border)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dayAbbr,
                    style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.mutedForeground,
                        fontWeight: FontWeight.w500)),
                Text('$dayNum',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          clientName != null ? '$name | $clientName' : name,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: statusBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(statusLabel,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: statusColor)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined,
                          size: 12, color: AppColors.mutedForeground),
                      const SizedBox(width: 4),
                      Text('$startTime - $endTime',
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textSecondary)),
                      const SizedBox(width: 8),
                      Text('${hours}u',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (onEdit != null)
            GestureDetector(
              onTap: onEdit,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: AppColors.border)),
                ),
                child: const Center(
                  child: Icon(Icons.edit_outlined,
                      size: 16, color: AppColors.mutedForeground),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AbsenceEntry extends StatelessWidget {
  const _AbsenceEntry({
    required this.dayAbbr,
    required this.dayNum,
    required this.name,
    required this.startTime,
    required this.endTime,
  });

  final String dayAbbr;
  final int dayNum;
  final String name;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.shiftLeave.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: AppColors.shiftLeave.withValues(alpha: 0.2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 5,
            color: AppColors.shiftLeave,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: AppColors.border)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dayAbbr,
                    style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.mutedForeground,
                        fontWeight: FontWeight.w500)),
                Text('$dayNum',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text('$startTime - $endTime',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Edit sheet
// ---------------------------------------------------------------------------

class _EditShiftSheet extends ConsumerStatefulWidget {
  const _EditShiftSheet({
    required this.shift,
    required this.initialStart,
    required this.initialEnd,
    required this.onSave,
  });

  final TimesheetShiftDto shift;
  final TimeOfDay initialStart;
  final TimeOfDay initialEnd;
  final void Function(TimeOfDay start, TimeOfDay end) onSave;

  @override
  ConsumerState<_EditShiftSheet> createState() => _EditShiftSheetState();
}

class _EditShiftSheetState extends ConsumerState<_EditShiftSheet> {
  late TimeOfDay _start;
  late TimeOfDay _end;

  @override
  void initState() {
    super.initState();
    _start = widget.initialStart;
    _end = widget.initialEnd;
  }

  String _fmt(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _pick({required bool isStart}) async {
    final picked =
        await showTimePicker(context: context, initialTime: isStart ? _start : _end);
    if (picked != null) setState(() => isStart ? _start = picked : _end = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.shift.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary)),
              ),
              IconButton(
                  icon: const Icon(Icons.close_rounded,
                      color: AppColors.mutedForeground),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          ),
          const Divider(color: AppColors.border),
          const SizedBox(height: 8),
          const Text('Werkelijke tijden',
              style: TextStyle(
                  fontSize: 12, color: AppColors.mutedForeground)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pick(isStart: true),
                  icon: const Icon(Icons.access_time_outlined, size: 16),
                  label: Text('Start: ${_fmt(_start)}'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pick(isStart: false),
                  icon: const Icon(Icons.access_time_outlined, size: 16),
                  label: Text('Eind: ${_fmt(_end)}'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onSave(_start, _end);
                Navigator.of(context).pop();
              },
              child: const Text('Opslaan'),
            ),
          ),
        ],
      ),
    );
  }
}
