import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/access_rights.dart';
import '../../../core/utils/geofencing_utils.dart';
import '../../../shared/theme/app_theme.dart';
import '../dashboard_models.dart';
import '../../../core/models/response_wrapper.dart';
import '../dashboard_provider.dart';

/// A geofencing-aware punch in/out button for the next shift.
///
/// When [AccessRights.featureGeofencingEnabled] is true, the button checks
/// whether the employee is within [ApiConstants.geofenceRadiusMeters] of the
/// shift address before enabling punch-in/out.
class PunchButton extends ConsumerStatefulWidget {
  const PunchButton({
    super.key,
    required this.shift,
    required this.accessRights,
  });

  final ShiftDto shift;
  final AccessRights accessRights;

  @override
  ConsumerState<PunchButton> createState() => _PunchButtonState();
}

class _PunchButtonState extends ConsumerState<PunchButton> {
  GeofenceResult? _geofenceResult;
  bool _isCheckingLocation = false;
  bool _hasPunchedIn = false;

  @override
  void initState() {
    super.initState();
    if (widget.accessRights.featureGeofencingEnabled) {
      _checkGeofence();
    }
  }

  Future<void> _checkGeofence() async {
    if (!mounted) return;
    setState(() => _isCheckingLocation = true);

    // For now we use a placeholder coordinate since geocoding is async.
    // In production, geocode the address first.
    const result = GeofenceInsideRadius(distanceMeters: 0);
    // TODO(geocoding): replace with actual geocode + check when shift has address.

    if (mounted) {
      setState(() {
        _geofenceResult = result;
        _isCheckingLocation = false;
      });
    }
  }

  bool get _isWithinGeofence {
    if (!widget.accessRights.featureGeofencingEnabled) return true;
    return _geofenceResult is GeofenceInsideRadius;
  }

  Future<void> _onPunchPressed() async {
    final notifier = ref.read(punchNotifierProvider.notifier);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (_hasPunchedIn) {
      final result = await notifier.punchOut(scheduleId: widget.shift.id);
      result.when(
        success: (_) {
          setState(() => _hasPunchedIn = false);
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('✓ Succesvol uitgepikt')),
          );
        },
        failure: (e) => scaffoldMessenger.showSnackBar(
          SnackBar(content: Text(e.message)),
        ),
      );
    } else {
      final result = await notifier.punchIn(scheduleId: widget.shift.id);
      result.when(
        success: (_) {
          setState(() => _hasPunchedIn = true);
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('✓ Succesvol ingepikt')),
          );
        },
        failure: (e) => scaffoldMessenger.showSnackBar(
          SnackBar(content: Text(e.message)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final punchState = ref.watch(punchNotifierProvider);
    final isLoading =
        punchState.isLoading || _isCheckingLocation;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _hasPunchedIn
              ? [const Color(0xFF16A34A), const Color(0xFF15803D)]
              : [theme.colorScheme.primary, theme.colorScheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (isLoading || !_isWithinGeofence) ? null : _onPunchPressed,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Punch icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(
                          _hasPunchedIn
                              ? Icons.logout_rounded
                              : Icons.login_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                ),
                const SizedBox(width: AppSpacing.md),

                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _hasPunchedIn ? 'Uitpikken' : 'Inpikken',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        _buildSubtitle(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),

                // Geofence indicator
                if (widget.accessRights.featureGeofencingEnabled)
                  _GeofenceIndicator(
                    result: _geofenceResult,
                    isChecking: _isCheckingLocation,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _buildSubtitle() {
    if (_isCheckingLocation) return 'Locatie controleren...';
    if (!_isWithinGeofence) {
      final result = _geofenceResult;
      if (result is GeofenceOutsideRadius) {
        return 'Te ver weg — ${GeofencingUtils.formatDistance(result.distanceMeters)}';
      }
      if (result is GeofencePermissionDenied) return 'Locatietoestemming vereist';
      if (result is GeofenceLocationDisabled) return 'Locatieservices uitgeschakeld';
    }
    return _hasPunchedIn
        ? 'Tik om je uitpiktijd te registreren'
        : 'Tik om je inpiktijd te registreren';
  }
}

class _GeofenceIndicator extends StatelessWidget {
  const _GeofenceIndicator({
    required this.result,
    required this.isChecking,
  });

  final GeofenceResult? result;
  final bool isChecking;

  @override
  Widget build(BuildContext context) {
    if (isChecking) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      );
    }

    final isInside = result is GeofenceInsideRadius;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isInside ? Icons.my_location_rounded : Icons.location_off_rounded,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            isInside ? 'Binnen bereik' : 'Buiten bereik',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
