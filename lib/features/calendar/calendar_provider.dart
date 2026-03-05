import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/api_client.dart';
import '../../core/models/response_wrapper.dart';
import '../login/auth_provider.dart';
import 'calendar_models.dart';
import 'calendar_service.dart';

part 'calendar_provider.g.dart';

// ---------------------------------------------------------------------------
// Service provider
// ---------------------------------------------------------------------------

@riverpod
CalendarService calendarService(Ref ref) {
  return CalendarService(ref.watch(dioProvider));
}

// ---------------------------------------------------------------------------
// Data provider
// ---------------------------------------------------------------------------

/// Fetches calendar data for the given date range.
///
/// The [param] record must contain a [from] and [to] [DateTime].
/// The provider re-fetches whenever the auth state changes.
///
/// Usage:
/// ```dart
/// ref.watch(calendarProvider((from: monthStart, to: monthEnd)));
/// ```
@riverpod
Future<CalendarDto> calendar(
  Ref ref,
  ({DateTime from, DateTime to}) param,
) async {
  // Invalidate when authentication changes.
  ref.watch(authNotifierProvider);

  final service = ref.watch(calendarServiceProvider);
  final result = await service.getCalendar(
    from: param.from,
    till: param.to,
  );

  return result.when(
    success: (data) => data,
    failure: (error) => throw Exception(error.message),
  );
}
