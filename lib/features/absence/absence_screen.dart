import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/loading_widget.dart';
import 'absence_models.dart';
import 'absence_provider.dart';

class AbsenceScreen extends ConsumerStatefulWidget {
  const AbsenceScreen({super.key});

  @override
  ConsumerState<AbsenceScreen> createState() => _AbsenceScreenState();
}

class _AbsenceScreenState extends ConsumerState<AbsenceScreen> {
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _AbsenceHeader(
            showForm: _showForm,
            onBack: _showForm
                ? () => setState(() => _showForm = false)
                : () => context.go(AppRoutes.dashboard),
          ),
          Expanded(
            child: _showForm
                ? _AbsenceFormView(
                    onSubmitSuccess: () => setState(() => _showForm = false),
                  )
                : _AbsenceListView(
                    onNewRequest: () => setState(() => _showForm = true),
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

class _AbsenceHeader extends StatelessWidget {
  const _AbsenceHeader({required this.showForm, required this.onBack});
  final bool showForm;
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
            showForm ? 'Verlof aanvragen' : 'Verlof & Afwezigheid',
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

// ---------------------------------------------------------------------------
// List View
// ---------------------------------------------------------------------------

class _AbsenceListView extends ConsumerWidget {
  const _AbsenceListView({required this.onNewRequest});
  final VoidCallback onNewRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(absenceHistoryProvider);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      children: [
        // New request button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton.icon(
            onPressed: onNewRequest,
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Nieuw verlof aanvragen'),
            style: FilledButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Past requests section
        const Text(
          'MIJN AANVRAGEN',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedForeground,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8),

        historyAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Center(child: LoadingWidget(message: 'Aanvragen laden...')),
          ),
          error: (_, __) => _buildEmptyState(),
          data: (items) => items.isEmpty
              ? _buildEmptyState()
              : _buildRequestList(items),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined,
              size: 40, color: AppColors.mutedForeground),
          SizedBox(height: 8),
          Text(
            'Geen verlofaanvragen',
            style: TextStyle(fontSize: 14, color: AppColors.mutedForeground),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestList(List<AbsenceResponseDto> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0)
              const Divider(height: 1, color: AppColors.border),
            _AbsenceRequestTile(item: items[i]),
          ],
        ],
      ),
    );
  }
}

class _AbsenceRequestTile extends StatelessWidget {
  const _AbsenceRequestTile({required this.item});
  final AbsenceResponseDto item;

  @override
  Widget build(BuildContext context) {
    final status = _statusLabel(item.statusId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.description_outlined,
                  size: 18, color: AppColors.accentForeground),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        size: 11, color: AppColors.mutedForeground),
                    const SizedBox(width: 3),
                    Text(
                      '${_fmtDate(item.startDate)} — ${_fmtDate(item.endDate)}',
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.mutedForeground),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _StatusBadge(label: status.$1, color: status.$2, bgColor: status.$3),
        ],
      ),
    );
  }

  (String, Color, Color) _statusLabel(int? statusId) {
    switch (statusId) {
      case 2:
        return ('Goedgekeurd', AppColors.success,
            AppColors.success.withValues(alpha: 0.1));
      case 3:
        return ('Afgewezen', AppColors.destructive,
            AppColors.destructive.withValues(alpha: 0.1));
      default:
        return ('Ingediend', AppColors.mutedForeground, AppColors.muted);
    }
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
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge(
      {required this.label, required this.color, required this.bgColor});
  final String label;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w600, color: color)),
    );
  }
}

// ---------------------------------------------------------------------------
// Form View
// ---------------------------------------------------------------------------

class _AbsenceFormView extends ConsumerStatefulWidget {
  const _AbsenceFormView({required this.onSubmitSuccess});
  final VoidCallback onSubmitSuccess;

  @override
  ConsumerState<_AbsenceFormView> createState() => _AbsenceFormViewState();
}

class _AbsenceFormViewState extends ConsumerState<_AbsenceFormView> {
  final _remarkController = TextEditingController();

  AbsencePresenceSettingDto? _selectedSetting;
  DateTimeRange? _dateRange;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _timeToMap(TimeOfDay t) =>
      {'hour': t.hour, 'minute': t.minute, 'second': 0};

  Map<String, dynamic> _dateToMap(DateTime d) =>
      {'year': d.year, 'month': d.month, 'day': d.day};

  TimeOfDay _mapToTime(Map<String, dynamic> m) => TimeOfDay(
        hour: (m['hour'] as num?)?.toInt() ?? 0,
        minute: (m['minute'] as num?)?.toInt() ?? 0,
      );

  void _onTypeSelected(AbsencePresenceSettingDto setting) {
    setState(() {
      _selectedSetting = setting;
      _startTime = _mapToTime(setting.startTime);
      _endTime = _mapToTime(setting.endTime);
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

  Future<void> _pickTime({required bool isStart}) async {
    final init =
        isStart ? (_startTime ?? TimeOfDay.now()) : (_endTime ?? TimeOfDay.now());
    final picked = await showTimePicker(context: context, initialTime: init);
    if (picked != null) {
      setState(() => isStart ? _startTime = picked : _endTime = picked);
    }
  }

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-${d.year}';

  String _fmtTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _submit() async {
    if (_selectedSetting == null) {
      _snack('Selecteer een verloftype.', error: true);
      return;
    }
    if (_dateRange == null) {
      _snack('Selecteer een datumbereik.', error: true);
      return;
    }
    if (_startTime == null || _endTime == null) {
      _snack('Selecteer start- en eindtijd.', error: true);
      return;
    }
    final dto = AbsenceRequestDto(
      id: _selectedSetting!.id,
      startDate: _dateToMap(_dateRange!.start),
      endDate: _dateToMap(_dateRange!.end),
      startTime: _timeToMap(_startTime!),
      endTime: _timeToMap(_endTime!),
      remark: _remarkController.text.trim(),
    );
    await ref.read(absenceRequestNotifierProvider.notifier).submit(dto);
    if (!mounted) return;
    final state = ref.read(absenceRequestNotifierProvider);
    state.when(
      data: (_) {
        ref.invalidate(absenceHistoryProvider);
        _snack('Verlofaanvraag ingediend.');
        widget.onSubmitSuccess();
      },
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
    final settingsAsync = ref.watch(absenceSettingsProvider);
    final submitState = ref.watch(absenceRequestNotifierProvider);
    final isLoading = submitState.isLoading;

    return settingsAsync.when(
      loading: () =>
          const Center(child: LoadingWidget(message: 'Laden...')),
      error: (e, _) => Center(
        child: Text(e.toString(),
            style: const TextStyle(color: AppColors.destructive)),
      ),
      data: (settings) => _buildForm(settings, isLoading),
    );
  }

  Widget _buildForm(List<AbsencePresenceSettingDto> settings, bool isLoading) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      children: [
        // Type selector
        _FormCard(
          label: 'TYPE VERLOF',
          child: settings.isEmpty
              ? const Text('Geen verloftypes beschikbaar',
                  style: TextStyle(color: AppColors.mutedForeground))
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final s in settings)
                      _TypeTile(
                        setting: s,
                        selected: _selectedSetting?.id == s.id,
                        onTap: () => _onTypeSelected(s),
                      ),
                  ],
                ),
        ),

        const SizedBox(height: 12),

        // Period
        _FormCard(
          label: 'PERIODE',
          child: Column(
            children: [
              // Date range row
              Row(
                children: [
                  Expanded(
                    child: _DateTimeField(
                      label: 'Van',
                      value: _dateRange != null
                          ? _fmtDate(_dateRange!.start)
                          : null,
                      icon: Icons.calendar_today_outlined,
                      hint: 'Selecteer',
                      onTap: _pickDateRange,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _DateTimeField(
                      label: 'Tot',
                      value: _dateRange != null
                          ? _fmtDate(_dateRange!.end)
                          : null,
                      icon: Icons.calendar_today_outlined,
                      hint: 'Selecteer',
                      onTap: _pickDateRange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Time row
              Row(
                children: [
                  Expanded(
                    child: _DateTimeField(
                      label: 'Starttijd',
                      value: _startTime != null ? _fmtTime(_startTime!) : null,
                      icon: Icons.access_time_outlined,
                      hint: '--:--',
                      onTap: () => _pickTime(isStart: true),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _DateTimeField(
                      label: 'Eindtijd',
                      value: _endTime != null ? _fmtTime(_endTime!) : null,
                      icon: Icons.access_time_outlined,
                      hint: '--:--',
                      onTap: () => _pickTime(isStart: false),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Remark
        _FormCard(
          label: 'OPMERKING${_selectedSetting?.remarkRequired == true ? ' *' : ''}',
          child: TextField(
            controller: _remarkController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Optionele toelichting...',
              hintStyle: TextStyle(color: AppColors.mutedForeground),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: const TextStyle(
                fontSize: 14, color: AppColors.textPrimary),
          ),
        ),

        const SizedBox(height: 20),

        // Submit button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton.icon(
            onPressed: isLoading ? null : _submit,
            icon: isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.send_rounded, size: 16),
            label: Text(isLoading ? 'Bezig...' : 'Aanvraag indienen'),
            style: FilledButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable form widgets
// ---------------------------------------------------------------------------

class _FormCard extends StatelessWidget {
  const _FormCard({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedForeground,
                  letterSpacing: 0.8)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _TypeTile extends StatelessWidget {
  const _TypeTile(
      {required this.setting, required this.selected, required this.onTap});
  final AbsencePresenceSettingDto setting;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: (MediaQuery.sizeOf(context).width - 32 - 14 * 2 - 8) / 2,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.05)
              : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(setting.name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? AppColors.primary : AppColors.textPrimary,
                )),
            const SizedBox(height: 2),
            Text(
              '${_fmtTime(setting.startTime)} - ${_fmtTime(setting.endTime)}',
              style: const TextStyle(
                  fontSize: 11, color: AppColors.mutedForeground),
            ),
          ],
        ),
      ),
    );
  }

  String _fmtTime(Map<String, dynamic> t) {
    final h = (t['hour'] as num?)?.toInt() ?? 0;
    final m = (t['minute'] as num?)?.toInt() ?? 0;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }
}

class _DateTimeField extends StatelessWidget {
  const _DateTimeField({
    required this.label,
    required this.value,
    required this.icon,
    required this.hint,
    required this.onTap,
  });
  final String label;
  final String? value;
  final IconData icon;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 10, color: AppColors.mutedForeground)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.muted.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Icon(icon, size: 14, color: AppColors.mutedForeground),
                const SizedBox(width: 6),
                Text(
                  value ?? hint,
                  style: TextStyle(
                    fontSize: 13,
                    color: value != null
                        ? AppColors.textPrimary
                        : AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
