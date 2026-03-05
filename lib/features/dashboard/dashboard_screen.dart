import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/access_rights.dart';
import '../../core/utils/date_utils.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loading_widget.dart';
import '../login/auth_provider.dart';
import 'dashboard_models.dart';
import 'dashboard_provider.dart';
import 'widgets/next_shift_card.dart';
import 'widgets/punch_button.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final shiftsAsync = ref.watch(firstShiftsProvider);
    final rights = ref.watch(accessRightsProvider);
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, theme, today),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                shiftsAsync.when(
                  loading: () => const LoadingWidget(message: 'Diensten laden...'),
                  error: (err, _) => AppErrorWidget(
                    message: err.toString().replaceFirst('Exception: ', ''),
                    onRetry: () => ref.invalidate(firstShiftsProvider),
                  ),
                  data: (shifts) => _buildContent(
                    context,
                    ref,
                    shifts,
                    rights,
                    theme,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(
    BuildContext context,
    ThemeData theme,
    DateTime today,
  ) {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      backgroundColor: theme.colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: AppSpacing.md,
          bottom: AppSpacing.md,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Goedemorgen 👋',
              style: theme.textTheme.titleLarge,
            ),
            Text(
              PlanbitionDateUtils.formatFullDate(today),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    List<ShiftDto> shifts,
    AccessRights rights,
    ThemeData theme,
  ) {
    if (shifts.isEmpty) {
      return _EmptyShiftsState();
    }

    final nextShift = shifts.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Punch in/out button (when geofencing or QR is enabled)
        if (rights.featureGeofencingEnabled || rights.featureQrCodeEnabled)
          PunchButton(shift: nextShift, accessRights: rights),

        if (rights.featureGeofencingEnabled || rights.featureQrCodeEnabled)
          const SizedBox(height: AppSpacing.lg),

        // Section title
        Text('Aankomende diensten', style: theme.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),

        // Shift cards
        ...shifts.map(
          (shift) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: NextShiftCard(
              shift: shift,
              isNext: shift == nextShift,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyShiftsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
        child: Column(
          children: [
            Icon(
              Icons.event_available_rounded,
              size: 72,
              color: theme.colorScheme.primary.withValues(alpha: 0.3),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Geen aankomende diensten',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Je hebt momenteel geen geplande diensten.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
