import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart' as app_widgets;
import '../../shared/widgets/loading_widget.dart';
import 'availability_models.dart';
import 'availability_provider.dart';

class AvailabilityScreen extends ConsumerStatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  ConsumerState<AvailabilityScreen> createState() =>
      _AvailabilityScreenState();
}

class _AvailabilityScreenState extends ConsumerState<AvailabilityScreen> {
  bool _showMonth = false;

  // Month/Week navigation
  late DateTime _currentMonth;
  late DateTime _currentWeekMonday;

  // Form state
  final _remarkController = TextEditingController();
  bool _isAvailable = true;
  DateTimeRange? _dateRange;
  bool _useRecurrence = false;
  int _recurrenceWeekInterval = 1;
  final Set<int> _selectedDays = {};
  AvailabilityBlockSettingDto? _selectedBlock;

  static const _dayLabels = ['Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za', 'Zo'];
  static const _monthNames = [
    'Januari', 'Februari', 'Maart', 'April', 'Mei', 'Juni',
    'Juli', 'Augustus', 'September', 'Oktober', 'November', 'December',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentMonth = DateTime(now.year, now.month);
    _currentWeekMonday = _weekMonday(now);
  }

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  DateTime _weekMonday(DateTime d) {
    return d.subtract(Duration(days: (d.weekday - 1)));
  }

  List<DateTime> get _weekDates {
    return List.generate(7, (i) => _currentWeekMonday.add(Duration(days: i)));
  }

  int get _weekNumber {
    final d = _currentWeekMonday;
    final startOfYear = DateTime(d.year, 1, 1);
    final diff = d.difference(startOfYear).inDays;
    return ((diff + startOfYear.weekday - 1) / 7).floor() + 1;
  }

  void _prevMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _prevWeek() {
    setState(() {
      _currentWeekMonday = _currentWeekMonday.subtract(const Duration(days: 7));
    });
  }

  void _nextWeek() {
    setState(() {
      _currentWeekMonday = _currentWeekMonday.add(const Duration(days: 7));
    });
  }

  void _goToToday() {
    final now = DateTime.now();
    setState(() {
      _currentMonth = DateTime(now.year, now.month);
      _currentWeekMonday = _weekMonday(now);
    });
  }

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: _dateRange,
    );
    if (picked != null) setState(() => _dateRange = picked);
  }

  Future<void> _submit(AvailabilitySettingsDto settings) async {
    if (_dateRange == null) {
      _snack('Selecteer een datumbereik.', error: true);
      return;
    }

    Map<String, dynamic> dateToMap(DateTime d) =>
        {'year': d.year, 'month': d.month, 'day': d.day};

    final dto = AvailabilityRequestDto(
      availabilityId: _isAvailable
          ? (settings.availabilities.isNotEmpty
              ? settings.availabilities.first.id
              : null)
          : null,
      availabilityBlockId: _selectedBlock?.id,
      requestFrom: dateToMap(_dateRange!.start),
      requestUntil: dateToMap(_dateRange!.end),
      recurrenceDays: _useRecurrence ? (_selectedDays.toList()..sort()) : null,
      recurrenceWeekInterval: _useRecurrence ? _recurrenceWeekInterval : null,
      remark: _remarkController.text.trim().isEmpty
          ? null
          : _remarkController.text.trim(),
    );

    await ref.read(availabilitySubmitNotifierProvider.notifier).submit(dto);
    if (!mounted) return;

    ref.read(availabilitySubmitNotifierProvider).when(
      data: (_) {
        _snack('Beschikbaarheid opgeslagen.');
        _resetForm();
        Navigator.of(context).pop();
      },
      loading: () {},
      error: (e, _) => _snack(e.toString(), error: true),
    );
  }

  void _resetForm() {
    setState(() {
      _dateRange = null;
      _useRecurrence = false;
      _selectedDays.clear();
      _recurrenceWeekInterval = 1;
      _selectedBlock = null;
      _isAvailable = true;
      _remarkController.clear();
    });
  }

  void _snack(String msg, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: error ? AppColors.destructive : AppColors.primary,
      behavior: SnackBarBehavior.floating,
    ));
  }

  String _formatDate(DateTime d) =>
      '${d.day} ${_monthNames[d.month - 1].substring(0, 3).toLowerCase()}';

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(availabilitySettingsProvider);
    final isSubmitting = ref.watch(availabilitySubmitNotifierProvider).isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Header
          _buildHeader(context),

          Expanded(
            child: settingsAsync.when(
              loading: () => const Center(
                  child: LoadingWidget(message: 'Laden...')),
              error: (e, _) => app_widgets.AppErrorWidget(
                message: e.toString(),
                onRetry: () => ref.invalidate(availabilitySettingsProvider),
              ),
              data: (settings) {
                if (!settings.canAdjustAvailability) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'U kunt uw beschikbaarheid momenteel niet aanpassen.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.mutedForeground),
                      ),
                    ),
                  );
                }
                return _buildContent(context, settings, isSubmitting);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final safeTop = MediaQuery.paddingOf(context).top;
    return Container(
      padding:
          EdgeInsets.only(top: safeTop, left: 16, right: 8, bottom: 12),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text('Beschikbaarheid',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary)),
          ),
          TextButton(
            onPressed: _goToToday,
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Vandaag',
                style: TextStyle(fontSize: 12, color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context,
      AvailabilitySettingsDto settings, bool isSubmitting) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      children: [
        // Maand/Week toggle
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.muted,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _ToggleBtn(
                label: 'Maand',
                selected: _showMonth,
                onTap: () => setState(() => _showMonth = true),
              ),
              _ToggleBtn(
                label: 'Week',
                selected: !_showMonth,
                onTap: () => setState(() => _showMonth = false),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Navigation row
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              icon: const Icon(Icons.chevron_left_rounded,
                  color: AppColors.textPrimary, size: 22),
              onPressed: _showMonth ? _prevMonth : _prevWeek,
            ),
            Expanded(
              child: Text(
                _showMonth
                    ? '${_monthNames[_currentMonth.month - 1]} ${_currentMonth.year}'
                    : 'Week $_weekNumber  ·  ${_formatDate(_weekDates.first)} - ${_formatDate(_weekDates.last)}',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              icon: const Icon(Icons.chevron_right_rounded,
                  color: AppColors.textPrimary, size: 22),
              onPressed: _showMonth ? _nextMonth : _nextWeek,
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Calendar view
        if (_showMonth) _buildMonthView() else _buildWeekView(),

        const SizedBox(height: 12),

        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LegendDot(
                color: AppColors.success, label: 'Beschikbaar'),
            const SizedBox(width: 16),
            _LegendDot(
                color: AppColors.destructive, label: 'Niet beschikbaar'),
            const SizedBox(width: 16),
            _LegendDot(
                color: AppColors.mutedForeground.withValues(alpha: 0.3),
                label: 'Niet ingesteld'),
          ],
        ),

        const SizedBox(height: 16),

        // Add button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton.icon(
            onPressed: () => _showFormSheet(context, settings),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Beschikbaarheid invoeren'),
            style: FilledButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMonthView() {
    final year = _currentMonth.year;
    final month = _currentMonth.month;
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final firstWeekday = DateTime(year, month, 1).weekday; // Mon=1, Sun=7
    final today = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Day headers
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: _dayLabels
                  .map((d) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(d,
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mutedForeground),
                              textAlign: TextAlign.center),
                        ),
                      ))
                  .toList(),
            ),
          ),
          // Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemCount: firstWeekday - 1 + daysInMonth,
            itemBuilder: (ctx, idx) {
              if (idx < firstWeekday - 1) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F9FB),
                    border: Border(
                      right: BorderSide(color: AppColors.border),
                      bottom: BorderSide(color: AppColors.border),
                    ),
                  ),
                );
              }
              final day = idx - (firstWeekday - 1) + 1;
              final date = DateTime(year, month, day);
              final isToday = date.year == today.year &&
                  date.month == today.month &&
                  date.day == today.day;

              return Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  border: const Border(
                    right: BorderSide(color: AppColors.border),
                    bottom: BorderSide(color: AppColors.border),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isToday ? AppColors.primary : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$day',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isToday
                                ? AppColors.primaryForeground
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekView() {
    final today = DateTime.now();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (int i = 0; i < 7; i++) ...[
            if (i > 0)
              const Divider(height: 1, color: AppColors.border),
            _WeekDayRow(
              date: _weekDates[i],
              dayLabel: _dayLabels[i],
              isToday: _weekDates[i].year == today.year &&
                  _weekDates[i].month == today.month &&
                  _weekDates[i].day == today.day,
            ),
          ],
        ],
      ),
    );
  }

  void _showFormSheet(
      BuildContext context, AvailabilitySettingsDto settings) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => _AvailabilityFormSheet(
        settings: settings,
        remarkController: _remarkController,
        isAvailable: _isAvailable,
        dateRange: _dateRange,
        useRecurrence: _useRecurrence,
        recurrenceWeekInterval: _recurrenceWeekInterval,
        selectedDays: _selectedDays,
        selectedBlock: _selectedBlock,
        isSubmitting: ref.read(availabilitySubmitNotifierProvider).isLoading,
        onIsAvailableChanged: (v) => setState(() => _isAvailable = v),
        onPickDateRange: _pickDateRange,
        onRecurrenceChanged: (v) => setState(() => _useRecurrence = v),
        onWeekIntervalChanged: (v) =>
            setState(() => _recurrenceWeekInterval = v),
        onDayToggled: (d) => setState(() {
          if (_selectedDays.contains(d)) {
            _selectedDays.remove(d);
          } else {
            _selectedDays.add(d);
          }
        }),
        onBlockChanged: (b) => setState(() => _selectedBlock = b),
        onSubmit: () => _submit(settings),
        formatDate: (d) =>
            '${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}',
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Week day row
// ---------------------------------------------------------------------------

class _WeekDayRow extends StatelessWidget {
  const _WeekDayRow({
    required this.date,
    required this.dayLabel,
    required this.isToday,
  });
  final DateTime date;
  final String dayLabel;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isToday ? AppColors.primary : AppColors.muted,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dayLabel,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: isToday
                            ? AppColors.primaryForeground
                            : AppColors.mutedForeground)),
                Text('${date.day}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isToday
                            ? AppColors.primaryForeground
                            : AppColors.textPrimary)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.mutedForeground.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text('Niet ingesteld',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedForeground)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.muted.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: const Text('Niet ingesteld',
                style: TextStyle(
                    fontSize: 10,
                    color: AppColors.mutedForeground,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Form sheet
// ---------------------------------------------------------------------------

class _AvailabilityFormSheet extends StatelessWidget {
  const _AvailabilityFormSheet({
    required this.settings,
    required this.remarkController,
    required this.isAvailable,
    required this.dateRange,
    required this.useRecurrence,
    required this.recurrenceWeekInterval,
    required this.selectedDays,
    required this.selectedBlock,
    required this.isSubmitting,
    required this.onIsAvailableChanged,
    required this.onPickDateRange,
    required this.onRecurrenceChanged,
    required this.onWeekIntervalChanged,
    required this.onDayToggled,
    required this.onBlockChanged,
    required this.onSubmit,
    required this.formatDate,
  });

  final AvailabilitySettingsDto settings;
  final TextEditingController remarkController;
  final bool isAvailable;
  final DateTimeRange? dateRange;
  final bool useRecurrence;
  final int recurrenceWeekInterval;
  final Set<int> selectedDays;
  final AvailabilityBlockSettingDto? selectedBlock;
  final bool isSubmitting;
  final ValueChanged<bool> onIsAvailableChanged;
  final VoidCallback onPickDateRange;
  final ValueChanged<bool> onRecurrenceChanged;
  final ValueChanged<int> onWeekIntervalChanged;
  final ValueChanged<int> onDayToggled;
  final ValueChanged<AvailabilityBlockSettingDto?> onBlockChanged;
  final VoidCallback onSubmit;
  final String Function(DateTime) formatDate;

  static const _dayLabels = ['Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za', 'Zo'];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (ctx, scrollCtrl) => ListView(
        controller: scrollCtrl,
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Beschikbaarheid invoeren',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 16),

          // Type toggle
          _FormSectionLabel(label: 'TYPE'),
          const SizedBox(height: 8),
          Row(
            children: [
              _TypeBtn(
                label: 'Beschikbaar',
                selected: isAvailable,
                color: AppColors.success,
                onTap: () => onIsAvailableChanged(true),
              ),
              const SizedBox(width: 8),
              _TypeBtn(
                label: 'Niet beschikbaar',
                selected: !isAvailable,
                color: AppColors.destructive,
                onTap: () => onIsAvailableChanged(false),
              ),
            ],
          ),

          if (settings.availabilityBlocks.isNotEmpty) ...[
            const SizedBox(height: 16),
            _FormSectionLabel(label: 'DIENSTVORM'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.muted.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.border),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<AvailabilityBlockSettingDto?>(
                  value: selectedBlock,
                  isExpanded: true,
                  hint: const Text('Optioneel',
                      style: TextStyle(
                          fontSize: 13, color: AppColors.mutedForeground)),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text('Geen')),
                    ...settings.availabilityBlocks.map(
                      (b) => DropdownMenuItem(
                          value: b,
                          child: Text(b.name,
                              style: const TextStyle(fontSize: 13))),
                    ),
                  ],
                  onChanged: onBlockChanged,
                ),
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Period
          _FormSectionLabel(label: 'PERIODE'),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onPickDateRange,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.muted.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.date_range_outlined,
                      size: 16, color: AppColors.mutedForeground),
                  const SizedBox(width: 8),
                  Text(
                    dateRange == null
                        ? 'Selecteer datumbereik'
                        : '${formatDate(dateRange!.start)} — ${formatDate(dateRange!.end)}',
                    style: TextStyle(
                      fontSize: 13,
                      color: dateRange == null
                          ? AppColors.mutedForeground
                          : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Recurrence toggle
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Wekelijks herhalen',
                        style: TextStyle(
                            fontSize: 14, color: AppColors.textPrimary)),
                  ],
                ),
              ),
              Switch(
                value: useRecurrence,
                onChanged: onRecurrenceChanged,
                activeThumbColor: AppColors.primary,
              ),
            ],
          ),

          if (useRecurrence) ...[
            const SizedBox(height: 12),
            const _FormSectionLabel(label: 'DAGEN'),
            const SizedBox(height: 8),
            Row(
              children: List.generate(7, (i) {
                final selected = selectedDays.contains(i + 1);
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onDayToggled(i + 1),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.muted,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(_dayLabels[i],
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: selected
                                  ? AppColors.primaryForeground
                                  : AppColors.mutedForeground),
                          textAlign: TextAlign.center),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Herhaal elke',
                    style: TextStyle(
                        fontSize: 13, color: AppColors.textPrimary)),
                const SizedBox(width: 12),
                IconButton.outlined(
                  onPressed: recurrenceWeekInterval > 1
                      ? () => onWeekIntervalChanged(recurrenceWeekInterval - 1)
                      : null,
                  icon: const Icon(Icons.remove, size: 16),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(32, 32),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('$recurrenceWeekInterval',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary)),
                ),
                IconButton.outlined(
                  onPressed: () =>
                      onWeekIntervalChanged(recurrenceWeekInterval + 1),
                  icon: const Icon(Icons.add, size: 16),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(32, 32),
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                    recurrenceWeekInterval == 1 ? 'week' : 'weken',
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textPrimary)),
              ],
            ),
          ],

          const SizedBox(height: 16),

          // Remark
          const _FormSectionLabel(label: 'OPMERKING'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.muted.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.border),
            ),
            child: TextField(
              controller: remarkController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Optionele opmerking...',
                hintStyle:
                    TextStyle(color: AppColors.mutedForeground, fontSize: 13),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                  fontSize: 13, color: AppColors.textPrimary),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: isSubmitting ? null : onSubmit,
              icon: isSubmitting
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.check_rounded, size: 18),
              label:
                  Text(isSubmitting ? 'Bezig...' : 'Opslaan'),
              style: FilledButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable small widgets
// ---------------------------------------------------------------------------

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
          child: Text(label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected
                      ? AppColors.textPrimary
                      : AppColors.mutedForeground),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class _TypeBtn extends StatelessWidget {
  const _TypeBtn({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? color.withValues(alpha: 0.1) : AppColors.muted,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected ? color : AppColors.border,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Text(label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? color : AppColors.mutedForeground),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppColors.mutedForeground)),
      ],
    );
  }
}

class _FormSectionLabel extends StatelessWidget {
  const _FormSectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
            letterSpacing: 0.8));
  }
}
