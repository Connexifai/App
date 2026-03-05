import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planbition_app/features/timesheet/timesheet_models.dart';
import 'package:planbition_app/features/timesheet/timesheet_provider.dart';
import 'package:planbition_app/shared/theme/app_theme.dart';
import 'package:planbition_app/shared/widgets/loading_widget.dart';
import 'package:planbition_app/shared/widgets/error_widget.dart' as app_widgets;

class TimesheetScreen extends ConsumerStatefulWidget {
  const TimesheetScreen({super.key});

  @override
  ConsumerState<TimesheetScreen> createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends ConsumerState<TimesheetScreen> {
  int _periodIndex = 0;
  List<TimesheetPeriodDto> _periods = [];

  // Map shiftId -> actual start/end time edits
  final Map<int, Map<String, dynamic>> _actualStartTimes = {};
  final Map<int, Map<String, dynamic>> _actualEndTimes = {};
  final Map<int, TextEditingController> _remarkControllers = {};

  @override
  void dispose() {
    for (final c in _remarkControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  TimesheetPeriodDto? get _currentPeriod =>
      _periods.isEmpty ? null : _periods[_periodIndex];

  Map<String, dynamic> _timeOfDayToMap(TimeOfDay t) => {
        'hour': t.hour,
        'minute': t.minute,
        'second': 0,
      };

  String _formatTime(Map<String, dynamic>? t) {
    if (t == null) return '--:--';
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

  Future<void> _openEditSheet(TimesheetShiftDto shift) async {
    final initialStart = shift.actualStartTime ?? shift.startTime;
    final initialEnd = shift.actualEndTime ?? shift.endTime;

    TimeOfDay startTime = TimeOfDay(
      hour: (initialStart['hour'] as num?)?.toInt() ?? 0,
      minute: (initialStart['minute'] as num?)?.toInt() ?? 0,
    );
    TimeOfDay endTime = TimeOfDay(
      hour: (initialEnd['hour'] as num?)?.toInt() ?? 0,
      minute: (initialEnd['minute'] as num?)?.toInt() ?? 0,
    );

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.lg),
        ),
      ),
      builder: (ctx) => _EditShiftSheet(
        shift: shift,
        initialStartTime: startTime,
        initialEndTime: endTime,
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
      final actualStart =
          _actualStartTimes[shift.id] ?? shift.actualStartTime ?? shift.startTime;
      final actualEnd =
          _actualEndTimes[shift.id] ?? shift.actualEndTime ?? shift.endTime;
      final remark = _remarkControllers[shift.id]?.text.trim();
      entries.add(TimesheetSubmitRequestDto(
        scheduleId: shift.id,
        actualStartTime: actualStart,
        actualEndTime: actualEnd,
        remark: remark?.isEmpty == true ? null : remark,
      ));
    }

    if (entries.isEmpty) {
      _showSnackBar('Geen uren om in te dienen.');
      return;
    }

    await ref.read(timesheetSubmitNotifierProvider.notifier).submit(entries);

    if (!mounted) return;
    final state = ref.read(timesheetSubmitNotifierProvider);
    state.when(
      data: (_) => _showSnackBar('Uren ingediend.'),
      loading: () {},
      error: (e, _) => _showSnackBar(e.toString(), isError: true),
    );
  }

  void _showSnackBar(String message, {bool isError = false}) {
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
    final periodsAsync = ref.watch(timesheetPeriodsProvider);
    final submitState = ref.watch(timesheetSubmitNotifierProvider);
    final isSubmitting = submitState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Urenregistratie'),
        centerTitle: false,
      ),
      body: periodsAsync.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => app_widgets.AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(timesheetPeriodsProvider),
        ),
        data: (periods) {
          if (periods.isEmpty) {
            return const Center(
              child: Text('Geen periodes gevonden.'),
            );
          }
          // Sync periods
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
          final safeIndex = _periodIndex.clamp(0, periods.length - 1);
          final period = periods[safeIndex];
          return _buildPeriodView(context, period, isSubmitting);
        },
      ),
    );
  }
  Widget _buildPeriodView(
    BuildContext context,
    TimesheetPeriodDto period,
    bool isSubmitting,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          color: colorScheme.surfaceContainerHighest,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _periodIndex > 0
                    ? () => setState(() => _periodIndex--)
                    : null,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${_formatDate(period.from)} - ${_formatDate(period.till)}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (period.isSubmitted)
                      Chip(
                        label: const Text('Ingediend'),
                        backgroundColor: colorScheme.primaryContainer,
                        labelStyle: TextStyle(
                          color: colorScheme.onPrimaryContainer,
                          fontSize: 11,
                        ),
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                      ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _periodIndex < _periods.length - 1
                    ? () => setState(() => _periodIndex++)
                    : null,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              if (period.shifts.isEmpty && period.absences.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: Center(child: Text('Geen diensten in deze periode.')),
                ),
              ...period.shifts.map((shift) => _buildShiftRow(
                    context,
                    shift,
                    period.isSubmitted,
                  )),
              if (period.absences.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text('Verlof',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: AppSpacing.sm),
                ...period.absences.map((a) => _buildAbsenceRow(context, a)),
              ],
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
        if (!period.isSubmitted)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: FilledButton.icon(
              onPressed: isSubmitting ? null : _submitAll,
              icon: isSubmitting
                  ? const SizedBox(
                      width: 18, height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.send),
              label: Text(isSubmitting ? 'Bezig...' : 'Uren indienen'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildShiftRow(
    BuildContext context,
    TimesheetShiftDto shift,
    bool periodSubmitted,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final actualStart = _actualStartTimes[shift.id] ?? shift.actualStartTime;
    final actualEnd = _actualEndTimes[shift.id] ?? shift.actualEndTime;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
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
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                if (shift.isSubmitted)
                  Icon(Icons.check_circle, color: colorScheme.primary, size: 20),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              _formatDate(shift.scheduleDate),
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gepland',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant)),
                      Text(
                        '${_formatTime(shift.startTime)} - ${_formatTime(shift.endTime)}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Werkelijk',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant)),
                      Text(
                        actualStart != null
                            ? '${_formatTime(actualStart)} - ${_formatTime(actualEnd)}'
                            : 'Niet ingevoerd',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: actualStart == null
                              ? colorScheme.onSurfaceVariant
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!periodSubmitted && !shift.isSubmitted)
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => _openEditSheet(shift),
                    tooltip: 'Bewerken',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbsenceRow(BuildContext context, TimesheetAbsenceDto absence) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      color: colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(Icons.event_busy_outlined,
                color: colorScheme.onSecondaryContainer),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    absence.name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${_formatDate(absence.scheduleDate)} '
                    '${_formatTime(absence.startTime)} - ${_formatTime(absence.endTime)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditShiftSheet extends ConsumerStatefulWidget {
  const _EditShiftSheet({
    required this.shift,
    required this.initialStartTime,
    required this.initialEndTime,
    required this.onSave,
  });

  final TimesheetShiftDto shift;
  final TimeOfDay initialStartTime;
  final TimeOfDay initialEndTime;
  final void Function(TimeOfDay start, TimeOfDay end) onSave;

  @override
  ConsumerState<_EditShiftSheet> createState() => _EditShiftSheetState();
}

class _EditShiftSheetState extends ConsumerState<_EditShiftSheet> {
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;

  @override
  void initState() {
    super.initState();
    _startTime = widget.initialStartTime;
    _endTime = widget.initialEndTime;
  }

  String _fmt(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _pickTime({required bool isStart}) async {
    final initial = isStart ? _startTime : _endTime;
    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        MediaQuery.of(context).viewInsets.bottom + AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.shift.name,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: AppSpacing.sm),
          Text('Werkelijke tijden', style: theme.textTheme.labelLarge),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pickTime(isStart: true),
                  icon: const Icon(Icons.access_time),
                  label: Text('Start: ${_fmt(_startTime)}'),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pickTime(isStart: false),
                  icon: const Icon(Icons.access_time_filled),
                  label: Text('Eind: ${_fmt(_endTime)}'),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onSave(_startTime, _endTime);
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
