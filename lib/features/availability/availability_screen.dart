import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planbition_app/features/availability/availability_models.dart';
import 'package:planbition_app/features/availability/availability_provider.dart';
import 'package:planbition_app/shared/theme/app_theme.dart';
import 'package:planbition_app/shared/widgets/loading_widget.dart';
import 'package:planbition_app/shared/widgets/error_widget.dart' as app_widgets;

enum _AvailabilityType { available, notAvailable }

class AvailabilityScreen extends ConsumerStatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  ConsumerState<AvailabilityScreen> createState() =>
      _AvailabilityScreenState();
}

class _AvailabilityScreenState extends ConsumerState<AvailabilityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _remarkController = TextEditingController();

  _AvailabilityType _availabilityType = _AvailabilityType.available;
  DateTimeRange? _dateRange;
  bool _useRecurrence = false;
  int _recurrenceWeekInterval = 1;
  final Set<int> _selectedDays = {};

  AvailabilityBasicSettingDto? _selectedAvailability;
  AvailabilityBlockSettingDto? _selectedBlock;

  static const _dayLabels = ['Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za', 'Zo'];

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _dateToMap(DateTime date) => {
        'year': date.year,
        'month': date.month,
        'day': date.day,
      };

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

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_dateRange == null) {
      _showSnackBar('Selecteer een datumbereik.', isError: true);
      return;
    }

    final dto = AvailabilityRequestDto(
      availabilityId: _selectedAvailability?.id,
      availabilityBlockId: _selectedBlock?.id,
      requestFrom: _dateToMap(_dateRange!.start),
      requestUntil: _dateToMap(_dateRange!.end),
      recurrenceDays: _useRecurrence ? (_selectedDays.toList()..sort()) : null,
      recurrenceWeekInterval: _useRecurrence ? _recurrenceWeekInterval : null,
      remark: _remarkController.text.trim().isEmpty
          ? null
          : _remarkController.text.trim(),
    );

    await ref
        .read(availabilitySubmitNotifierProvider.notifier)
        .submit(dto);

    if (!mounted) return;
    final state = ref.read(availabilitySubmitNotifierProvider);
    state.when(
      data: (_) {
        _showSnackBar('Beschikbaarheid opgeslagen.');
        _resetForm();
      },
      loading: () {},
      error: (e, _) => _showSnackBar(e.toString(), isError: true),
    );
  }

  void _resetForm() {
    setState(() {
      _dateRange = null;
      _useRecurrence = false;
      _selectedDays.clear();
      _recurrenceWeekInterval = 1;
      _selectedAvailability = null;
      _selectedBlock = null;
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

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(availabilitySettingsProvider);
    final submitState = ref.watch(availabilitySubmitNotifierProvider);
    final isLoading = submitState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beschikbaarheid'),
        centerTitle: false,
      ),
      body: settingsAsync.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => app_widgets.AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(availabilitySettingsProvider),
        ),
        data: (settings) {
          if (!settings.canAdjustAvailability) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'U kunt uw beschikbaarheid momenteel niet aanpassen.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return _buildForm(context, settings, isLoading);
        },
      ),
    );
  }
  Widget _buildForm(
    BuildContext context,
    AvailabilitySettingsDto settings,
    bool isLoading,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _SectionHeader(title: 'Type'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: SegmentedButton<_AvailabilityType>(
                segments: const [
                  ButtonSegment(
                    value: _AvailabilityType.available,
                    label: Text('Beschikbaar'),
                    icon: Icon(Icons.check_circle_outline),
                  ),
                  ButtonSegment(
                    value: _AvailabilityType.notAvailable,
                    label: Text('Niet beschikbaar'),
                    icon: Icon(Icons.cancel_outlined),
                  ),
                ],
                selected: {_availabilityType},
                onSelectionChanged: (s) =>
                    setState(() => _availabilityType = s.first),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (settings.availabilityBlocks.isNotEmpty) ...[
            const _SectionHeader(title: 'Dienstvorm'),
            const SizedBox(height: AppSpacing.sm),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: DropdownButtonFormField<AvailabilityBlockSettingDto>(
                  value: _selectedBlock,
                  decoration: const InputDecoration(
                    labelText: 'Dienstvorm (optioneel)',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text('Geen')),
                    ...settings.availabilityBlocks.map(
                      (b) => DropdownMenuItem(
                          value: b, child: Text(b.name)),
                    ),
                  ],
                  onChanged: (v) => setState(() => _selectedBlock = v),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
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
          const _SectionHeader(title: 'Herhaling'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md),
                  title: const Text('Wekelijks herhalen'),
                  value: _useRecurrence,
                  onChanged: (v) => setState(() => _useRecurrence = v),
                ),
                if (_useRecurrence) ...[
                  const Divider(height: 1, indent: AppSpacing.md),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dagen', style: theme.textTheme.labelLarge),
                        const SizedBox(height: AppSpacing.sm),
                        Wrap(
                          spacing: AppSpacing.xs,
                          children: List.generate(7, (i) {
                            final dayIndex = i + 1;
                            final selected = _selectedDays.contains(dayIndex);
                            return FilterChip(
                              label: Text(_dayLabels[i]),
                              selected: selected,
                              onSelected: (v) => setState(() {
                                if (v) {
                                  _selectedDays.add(dayIndex);
                                } else {
                                  _selectedDays.remove(dayIndex);
                                }
                              }),
                            );
                          }),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text('Interval (weken)',
                            style: theme.textTheme.labelLarge),
                        const SizedBox(height: AppSpacing.sm),
                        Row(
                          children: [
                            IconButton.outlined(
                              onPressed: _recurrenceWeekInterval > 1
                                  ? () => setState(
                                      () => _recurrenceWeekInterval--)
                                  : null,
                              icon: const Icon(Icons.remove),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.md),
                              child: Text(
                                '$_recurrenceWeekInterval',
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            IconButton.outlined(
                              onPressed: () => setState(
                                  () => _recurrenceWeekInterval++),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Opmerking (optioneel)',
                  hintText: 'Extra toelichting...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
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
                : const Icon(Icons.save),
            label: Text(isLoading ? 'Bezig...' : 'Opslaan'),
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
