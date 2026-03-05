import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planbition_app/features/absence/absence_models.dart';
import 'package:planbition_app/features/absence/absence_provider.dart';
import 'package:planbition_app/shared/theme/app_theme.dart';
import 'package:planbition_app/shared/widgets/loading_widget.dart';
import 'package:planbition_app/shared/widgets/error_widget.dart' as app_widgets;

class AbsenceScreen extends ConsumerStatefulWidget {
  const AbsenceScreen({super.key});

  @override
  ConsumerState<AbsenceScreen> createState() => _AbsenceScreenState();
}

class _AbsenceScreenState extends ConsumerState<AbsenceScreen> {
  final _formKey = GlobalKey<FormState>();
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

  Map<String, dynamic> _timeOfDayToMap(TimeOfDay time) => {
        'hour': time.hour,
        'minute': time.minute,
        'second': 0,
      };

  Map<String, dynamic> _dateToMap(DateTime date) => {
        'year': date.year,
        'month': date.month,
        'day': date.day,
      };

  TimeOfDay _mapToTimeOfDay(Map<String, dynamic> map) => TimeOfDay(
        hour: (map['hour'] as num?)?.toInt() ?? 0,
        minute: (map['minute'] as num?)?.toInt() ?? 0,
      );

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: _dateRange,
      builder: (context, child) => Theme(
        data: Theme.of(context),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _dateRange = picked);
  }

  Future<void> _pickTime({required bool isStart}) async {
    final initial = isStart
        ? (_startTime ?? TimeOfDay.now())
        : (_endTime ?? TimeOfDay.now());
    final picked =
        await showTimePicker(context: context, initialTime: initial);
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

  void _onSettingSelected(AbsencePresenceSettingDto? setting) {
    if (setting == null) return;
    setState(() {
      _selectedSetting = setting;
      _startTime = _mapToTimeOfDay(setting.startTime);
      _endTime = _mapToTimeOfDay(setting.endTime);
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedSetting == null) {
      _showSnackBar('Selecteer een verloftype.', isError: true);
      return;
    }
    if (_dateRange == null) {
      _showSnackBar('Selecteer een datumbereik.', isError: true);
      return;
    }
    if (_startTime == null || _endTime == null) {
      _showSnackBar('Selecteer start- en eindtijd.', isError: true);
      return;
    }
    final dto = AbsenceRequestDto(
      id: _selectedSetting!.id,
      startDate: _dateToMap(_dateRange!.start),
      endDate: _dateToMap(_dateRange!.end),
      startTime: _timeOfDayToMap(_startTime!),
      endTime: _timeOfDayToMap(_endTime!),
      remark: _remarkController.text.trim(),
    );
    await ref.read(absenceRequestNotifierProvider.notifier).submit(dto);
    if (!mounted) return;
    final state = ref.read(absenceRequestNotifierProvider);
    state.when(
      data: (_) {
        _showSnackBar('Verlofaanvraag ingediend.');
        _resetForm();
      },
      loading: () {},
      error: (e, _) => _showSnackBar(e.toString(), isError: true),
    );
  }

  void _resetForm() {
    setState(() {
      _selectedSetting = null;
      _dateRange = null;
      _startTime = null;
      _endTime = null;
      _remarkController.clear();
    });
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

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-${d.year}';

  String _formatTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(absenceSettingsProvider);
    final submitState = ref.watch(absenceRequestNotifierProvider);
    final isLoading = submitState.isLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verlofaanvraag'),
        centerTitle: false,
      ),
      body: settingsAsync.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => app_widgets.AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(absenceSettingsProvider),
        ),
        data: (settings) => _buildForm(context, settings, isLoading),
      ),
    );
  }

  Widget _buildForm(
    BuildContext context,
    List<AbsencePresenceSettingDto> settings,
    bool isLoading,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _SectionHeader(title: 'Verloftype'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: DropdownButtonFormField<AbsencePresenceSettingDto>(
                value: _selectedSetting,
                decoration: const InputDecoration(
                  labelText: 'Selecteer verloftype',
                  border: OutlineInputBorder(),
                ),
                items: settings
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s.name),
                      ),
                    )
                    .toList(),
                onChanged: _onSettingSelected,
                validator: (v) =>
                    v == null ? 'Selecteer een verloftype' : null,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionHeader(title: 'Periode'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              leading: Icon(Icons.date_range, color: colorScheme.primary),
              title: Text(
                _dateRange == null
                    ? 'Selecteer datumbereik'
                    : '${_formatDate(_dateRange!.start)} - ${_formatDate(_dateRange!.end)}',
                style: _dateRange == null
                    ? theme.textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.onSurfaceVariant)
                    : theme.textTheme.bodyMedium,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _pickDateRange,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionHeader(title: 'Tijden'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  leading:
                      Icon(Icons.access_time, color: colorScheme.primary),
                  title: const Text('Starttijd'),
                  trailing: Text(
                    _startTime != null ? _formatTime(_startTime!) : '--:--',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => _pickTime(isStart: true),
                ),
                const Divider(height: 1, indent: AppSpacing.md),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  leading: Icon(Icons.access_time_filled,
                      color: colorScheme.primary),
                  title: const Text('Eindtijd'),
                  trailing: Text(
                    _endTime != null ? _formatTime(_endTime!) : '--:--',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => _pickTime(isStart: false),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionHeader(title: 'Opmerking'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: TextFormField(
                controller: _remarkController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Opmerking',
                  hintText: 'Optionele toelichting...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (_selectedSetting?.remarkRequired == true &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Opmerking is verplicht voor dit verloftype';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          FilledButton.icon(
            onPressed: isLoading ? null : _submit,
            icon: isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.send),
            label: Text(isLoading ? 'Bezig...' : 'Aanvraag indienen'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
    );
  }
}
