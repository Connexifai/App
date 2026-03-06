import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/remarks_sheet.dart';

part 'shift_confirm_screen.g.dart';

// ---------------------------------------------------------------------------
// Model
// ---------------------------------------------------------------------------

class PendingShiftDto {
  const PendingShiftDto({
    required this.id,
    required this.name,
    required this.clientName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    this.remarks = const [],
  });

  final int id;
  final String name;
  final String? clientName;
  final Map<String, dynamic> date;
  final Map<String, dynamic> startTime;
  final Map<String, dynamic> endTime;
  final String? location;
  final List<String> remarks;

  factory PendingShiftDto.fromJson(Map<String, dynamic> json) {
    final remarksList = <String>[];
    final rawRemarks = json['remarks'];
    if (rawRemarks is List) {
      for (final r in rawRemarks) {
        if (r is Map && r['text'] != null) {
          remarksList.add(r['text'].toString());
        } else if (r is String) {
          remarksList.add(r);
        }
      }
    }
    return PendingShiftDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? json['shiftName']?.toString() ?? '',
      clientName: json['clientName']?.toString(),
      date: (json['scheduleDate'] as Map<String, dynamic>?) ?? {},
      startTime: (json['startTime'] as Map<String, dynamic>?) ?? {},
      endTime: (json['endTime'] as Map<String, dynamic>?) ?? {},
      location: json['location']?.toString() ??
          json['departmentName']?.toString(),
      remarks: remarksList,
    );
  }
}

// ---------------------------------------------------------------------------
// Provider
// ---------------------------------------------------------------------------

@riverpod
Future<List<PendingShiftDto>> pendingShifts(Ref ref) async {
  try {
    final dio = ref.watch(dioProvider);
    final response = await dio.get<List<dynamic>>('/Schedule/pending-confirmation');
    final data = response.data ?? [];
    return data
        .map((e) => PendingShiftDto.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (_) {
    return [];
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class ShiftConfirmScreen extends ConsumerStatefulWidget {
  const ShiftConfirmScreen({super.key});

  @override
  ConsumerState<ShiftConfirmScreen> createState() =>
      _ShiftConfirmScreenState();
}

class _ShiftConfirmScreenState extends ConsumerState<ShiftConfirmScreen> {
  final Set<int> _confirmedIds = {};
  final Set<int> _declinedIds = {};
  int? _expandedId;

  void _decline(int id) {
    setState(() {
      _declinedIds.add(id);
      _confirmedIds.remove(id);
      if (_expandedId == id) _expandedId = null;
    });
  }

  void _undoDecline(int id) {
    setState(() => _declinedIds.remove(id));
  }

  void _confirmAll(List<PendingShiftDto> shifts) {
    final pendingIds = shifts
        .where((s) => !_declinedIds.contains(s.id))
        .map((s) => s.id);
    setState(() => _confirmedIds.addAll(pendingIds));
  }

  @override
  Widget build(BuildContext context) {
    final shiftsAsync = ref.watch(pendingShiftsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _ConfirmHeader(
            pendingCount: shiftsAsync.maybeWhen(
              data: (shifts) => shifts
                  .where((s) =>
                      !_confirmedIds.contains(s.id) &&
                      !_declinedIds.contains(s.id))
                  .length,
              orElse: () => 0,
            ),
            onBack: () => context.go(AppRoutes.dashboard),
          ),
          Expanded(
            child: shiftsAsync.when(
              loading: () =>
                  const Center(child: LoadingWidget(message: 'Laden...')),
              error: (e, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 40, color: AppColors.destructive),
                    const SizedBox(height: 8),
                    Text(e.toString(),
                        style: const TextStyle(
                            color: AppColors.destructive)),
                    const SizedBox(height: 8),
                    FilledButton(
                      onPressed: () => ref.invalidate(pendingShiftsProvider),
                      child: const Text('Opnieuw'),
                    ),
                  ],
                ),
              ),
              data: (shifts) => _buildContent(shifts),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(List<PendingShiftDto> shifts) {
    final pendingCount = shifts
        .where((s) =>
            !_confirmedIds.contains(s.id) && !_declinedIds.contains(s.id))
        .length;
    final confirmedCount = _confirmedIds.length;
    final declinedCount = _declinedIds.length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
      children: [
        // Summary dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SummaryDot(
                color: AppColors.warning,
                label: '$pendingCount openstaand'),
            const SizedBox(width: 16),
            _SummaryDot(
                color: AppColors.success,
                label: '$confirmedCount bevestigd'),
            const SizedBox(width: 16),
            _SummaryDot(
                color: AppColors.destructive,
                label: '$declinedCount geweigerd'),
          ],
        ),

        const SizedBox(height: 16),

        if (shifts.isEmpty)
          _buildAllDone(confirmedCount, declinedCount)
        else ...[
          // Shift cards
          ...shifts.map((shift) => _ShiftCard(
                shift: shift,
                isExpanded: _expandedId == shift.id,
                isConfirmed: _confirmedIds.contains(shift.id),
                isDeclined: _declinedIds.contains(shift.id),
                onToggleExpand: () => setState(() =>
                    _expandedId = _expandedId == shift.id ? null : shift.id),
                onDecline: () => _decline(shift.id),
                onUndoDecline: () => _undoDecline(shift.id),
              )),

          const SizedBox(height: 8),

          // Confirm all button
          if (pendingCount > 0)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton.icon(
                onPressed: () => _confirmAll(shifts),
                icon: const Icon(Icons.check_rounded, size: 18),
                label: Text(
                  declinedCount > 0
                      ? 'Overige $pendingCount dienst${pendingCount > 1 ? 'en' : ''} bevestigen'
                      : 'Alle $pendingCount dienst${pendingCount > 1 ? 'en' : ''} bevestigen',
                ),
                style: FilledButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),

          // All done state
          if (pendingCount == 0 && shifts.isNotEmpty)
            _buildAllDone(confirmedCount, declinedCount),
        ],
      ],
    );
  }

  Widget _buildAllDone(int confirmedCount, int declinedCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.check_rounded,
                  size: 24, color: AppColors.success),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Alle diensten verwerkt',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text(
            '$confirmedCount bevestigd${declinedCount > 0 ? ', $declinedCount geweigerd' : ''}',
            style: const TextStyle(
                fontSize: 13, color: AppColors.mutedForeground),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Header
// ---------------------------------------------------------------------------

class _ConfirmHeader extends StatelessWidget {
  const _ConfirmHeader({required this.pendingCount, required this.onBack});
  final int pendingCount;
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
          const Expanded(
            child: Text('Diensten bevestigen',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary)),
          ),
          if (pendingCount > 0)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.2)),
              ),
              child: Text('$pendingCount openstaand',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.warning)),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shift card
// ---------------------------------------------------------------------------

class _ShiftCard extends StatelessWidget {
  const _ShiftCard({
    required this.shift,
    required this.isExpanded,
    required this.isConfirmed,
    required this.isDeclined,
    required this.onToggleExpand,
    required this.onDecline,
    required this.onUndoDecline,
  });

  final PendingShiftDto shift;
  final bool isExpanded;
  final bool isConfirmed;
  final bool isDeclined;
  final VoidCallback onToggleExpand;
  final VoidCallback onDecline;
  final VoidCallback onUndoDecline;

  bool get isPending => !isConfirmed && !isDeclined;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isConfirmed
              ? AppColors.success.withValues(alpha: 0.3)
              : isDeclined
                  ? AppColors.destructive.withValues(alpha: 0.3)
                  : AppColors.primary.withValues(alpha: 0.15),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Opacity(
        opacity: isDeclined ? 0.6 : 1.0,
        child: Column(
          children: [
            // Main row (tap to expand)
            GestureDetector(
              onTap: onToggleExpand,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Date column
                    Container(
                      width: 56,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: isConfirmed
                            ? AppColors.success.withValues(alpha: 0.08)
                            : isDeclined
                                ? AppColors.destructive.withValues(alpha: 0.08)
                                : AppColors.primary.withValues(alpha: 0.05),
                        border: const Border(
                            right: BorderSide(color: AppColors.border)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _dayNum(shift.date),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary),
                          ),
                          Text(
                            _monthAbbr(shift.date),
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mutedForeground),
                          ),
                        ],
                      ),
                    ),
                    // Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    shift.clientName != null
                                        ? '${shift.name} | ${shift.clientName}'
                                        : shift.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary),
                                  ),
                                ),
                                if (shift.remarks.isNotEmpty)
                                  const Icon(Icons.message_outlined,
                                      size: 14, color: AppColors.primary),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                const Icon(Icons.access_time_outlined,
                                    size: 12,
                                    color: AppColors.mutedForeground),
                                const SizedBox(width: 4),
                                Text(
                                  '${_fmtTime(shift.startTime)} - ${_fmtTime(shift.endTime)}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Status/chevron
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: isConfirmed
                            ? const Icon(Icons.check_circle_rounded,
                                size: 20, color: AppColors.success)
                            : isDeclined
                                ? const Icon(Icons.cancel_rounded,
                                    size: 20, color: AppColors.destructive)
                                : Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_rounded,
                                    size: 20,
                                    color: AppColors.mutedForeground),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded details
            if (isExpanded) ...[
              const Divider(height: 1, color: AppColors.border),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (shift.location != null)
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 14, color: AppColors.mutedForeground),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(shift.location!,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary)),
                          ),
                        ],
                      ),

                    if (shift.remarks.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      RemarksSheet(
                        remarks: shift.remarks,
                        trigger: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color:
                                    AppColors.primary.withValues(alpha: 0.15)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.message_outlined,
                                  size: 14, color: AppColors.primary),
                              const SizedBox(width: 6),
                              Text(
                                '${shift.remarks.length} opmerking${shift.remarks.length > 1 ? 'en' : ''}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 10),
                    const Divider(color: AppColors.border),
                    const SizedBox(height: 8),

                    if (isPending)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: onDecline,
                          icon: const Icon(Icons.close_rounded, size: 16),
                          label: const Text('Deze dienst weigeren'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.destructive,
                            side: BorderSide(
                                color: AppColors.destructive
                                    .withValues(alpha: 0.3)),
                            padding:
                                const EdgeInsets.symmetric(vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),

                    if (isDeclined)
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: onUndoDecline,
                          child: const Text('Weigering ongedaan maken',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.mutedForeground)),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _dayNum(Map<String, dynamic> d) {
    return ((d['day'] as num?)?.toInt() ?? 0).toString();
  }

  String _monthAbbr(Map<String, dynamic> d) {
    final m = (d['month'] as num?)?.toInt() ?? 0;
    const months = [
      'jan', 'feb', 'mrt', 'apr', 'mei', 'jun',
      'jul', 'aug', 'sep', 'okt', 'nov', 'dec',
    ];
    return m >= 1 && m <= 12 ? months[m - 1] : '';
  }

  String _fmtTime(Map<String, dynamic> t) {
    final h = (t['hour'] as num?)?.toInt() ?? 0;
    final m = (t['minute'] as num?)?.toInt() ?? 0;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }
}

// ---------------------------------------------------------------------------
// Summary dot
// ---------------------------------------------------------------------------

class _SummaryDot extends StatelessWidget {
  const _SummaryDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppColors.mutedForeground)),
      ],
    );
  }
}
