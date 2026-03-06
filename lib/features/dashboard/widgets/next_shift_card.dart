import 'package:flutter/material.dart';

import '../../../core/utils/date_utils.dart';
import '../../../shared/theme/app_theme.dart';
import '../dashboard_models.dart';

/// Displays a single upcoming shift in a card layout.
class NextShiftCard extends StatelessWidget {
  const NextShiftCard({
    super.key,
    required this.shift,
    this.isNext = false,
  });

  final ShiftDto shift;

  /// Whether this is the very next (upcoming) shift.
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final date = PlanbitionDateUtils.parseDateObject(shift.scheduleDate);
    final start = PlanbitionDateUtils.parseTimeObject(shift.startTime);
    final end = PlanbitionDateUtils.parseTimeObject(shift.endTime);

    final duration = (start != null && end != null)
        ? PlanbitionDateUtils.formatDuration(end - start)
        : null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Date column
            _DateBadge(date: date, isToday: isNext),
            const SizedBox(width: AppSpacing.md),

            // Shift info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (shift.clientName != null) ...[
                    Text(
                      shift.clientName!,
                      style: theme.textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    shift.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 14,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      if (start != null && end != null)
                        Text(
                          '${_formatTime(start)} – ${_formatTime(end)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if (duration != null) ...[
                        const SizedBox(width: AppSpacing.sm),
                        _DurationChip(duration),
                      ],
                    ],
                  ),
                  if (shift.address != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 14,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.5),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            shift.address!.displayLine,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface
                                  .withValues(alpha: 0.5),
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

            // Confirmation badge
            if (shift.isConfirmed == true)
              const _StatusBadge(
                icon: Icons.check_circle_rounded,
                color: AppColors.success,
              )
            else if (shift.confirmationStatusId != null)
              const _StatusBadge(
                icon: Icons.pending_rounded,
                color: AppColors.warning,
              ),
          ],
        ),
      ),
    );
  }

  String _formatTime(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _DateBadge extends StatelessWidget {
  const _DateBadge({required this.date, required this.isToday});

  final DateTime? date;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = isToday
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.surfaceContainerHighest;
    final fgColor = isToday
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSurface;

    return Container(
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (date != null) ...[
            Text(
              date!.day.toString(),
              style: theme.textTheme.titleLarge?.copyWith(
                color: fgColor,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            Text(
              _monthAbbr(date!.month),
              style: theme.textTheme.labelSmall?.copyWith(
                color: fgColor.withValues(alpha: 0.7),
                fontSize: 11,
              ),
            ),
          ] else
            Icon(Icons.calendar_today_rounded, size: 20, color: fgColor),
        ],
      ),
    );
  }

  String _monthAbbr(int month) {
    const abbrs = [
      'jan', 'feb', 'mrt', 'apr', 'mei', 'jun',
      'jul', 'aug', 'sep', 'okt', 'nov', 'dec',
    ];
    return abbrs[month - 1];
  }
}

class _DurationChip extends StatelessWidget {
  const _DurationChip(this.duration);
  final String duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        duration,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.sm),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
