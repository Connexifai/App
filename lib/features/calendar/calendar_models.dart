import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_models.freezed.dart';
part 'calendar_models.g.dart';

/// Top-level calendar response from GET /Calendar/day.
@freezed
abstract class CalendarDto with _$CalendarDto {
  const factory CalendarDto({
    @Default([]) List<Map<String, dynamic>> schedules,
    @Default([]) List<Map<String, dynamic>> absences,
    @Default([]) List<Map<String, dynamic>> availabilities,
    @Default([]) List<Map<String, dynamic>> requestedAbsences,
  }) = _CalendarDto;

  factory CalendarDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarDtoFromJson(json);
}

/// A single calendar event used by the UI layer, normalised from the raw DTO.
enum CalendarEventType { shift, absence, availability, requestedAbsence }

/// Unified view model for displaying any calendar entry in the list.
@freezed
abstract class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    required int id,
    required CalendarEventType type,
    required String title,
    required DateTime date,
    String? startTime,
    String? endTime,
    String? clientName,
    String? departmentName,
    String? statusLabel,
    Map<String, dynamic>? raw,
  }) = _CalendarEvent;
}

/// Parses a raw schedule map from [CalendarDto.schedules] into a [CalendarEvent].
CalendarEvent scheduleToEvent(Map<String, dynamic> raw) {
  final date = _parseDate(raw['scheduleDate']) ?? DateTime.now();
  return CalendarEvent(
    id: (raw['id'] as num?)?.toInt() ?? 0,
    type: CalendarEventType.shift,
    title: (raw['name'] as String?) ?? 'Dienst',
    date: date,
    startTime: _timeString(raw['startTime']),
    endTime: _timeString(raw['endTime']),
    clientName: raw['clientName'] as String?,
    departmentName: raw['departmentName'] as String?,
    statusLabel: _confirmationLabel(raw['confirmationStatusId'] as int?),
    raw: raw,
  );
}

/// Parses a raw absence map from [CalendarDto.absences] into a [CalendarEvent].
CalendarEvent absenceToEvent(Map<String, dynamic> raw) {
  final date = _parseDate(raw['startDate']) ?? DateTime.now();
  return CalendarEvent(
    id: (raw['id'] as num?)?.toInt() ?? 0,
    type: CalendarEventType.absence,
    title: (raw['absenceTypeName'] as String?) ?? 'Verlof',
    date: date,
    statusLabel: raw['statusName'] as String?,
    raw: raw,
  );
}

/// Parses a raw availability map from [CalendarDto.availabilities] into a [CalendarEvent].
CalendarEvent availabilityToEvent(Map<String, dynamic> raw) {
  final date = _parseDate(raw['date']) ?? DateTime.now();
  return CalendarEvent(
    id: (raw['id'] as num?)?.toInt() ?? 0,
    type: CalendarEventType.availability,
    title: (raw['availabilityTypeName'] as String?) ?? 'Beschikbaarheid',
    date: date,
    startTime: _timeString(raw['startTime']),
    endTime: _timeString(raw['endTime']),
    raw: raw,
  );
}

/// Parses a raw requested-absence map into a [CalendarEvent].
CalendarEvent requestedAbsenceToEvent(Map<String, dynamic> raw) {
  final date = _parseDate(raw['startDate']) ?? DateTime.now();
  return CalendarEvent(
    id: (raw['id'] as num?)?.toInt() ?? 0,
    type: CalendarEventType.requestedAbsence,
    title: (raw['absenceTypeName'] as String?) ?? 'Verlofaanvraag',
    date: date,
    statusLabel: raw['statusName'] as String?,
    raw: raw,
  );
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

DateTime? _parseDate(dynamic value) {
  if (value == null) return null;
  if (value is String) {
    try {
      return DateTime.parse(value);
    } catch (_) {
      return null;
    }
  }
  if (value is Map<String, dynamic>) {
    final y = value['year'] as int?;
    final m = value['month'] as int?;
    final d = value['day'] as int?;
    if (y != null && m != null && d != null) return DateTime(y, m, d);
  }
  return null;
}

String? _timeString(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is Map<String, dynamic>) {
    final h = (value['hour'] as int?) ?? 0;
    final min = (value['minute'] as int?) ?? 0;
    return '${h.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}';
  }
  return null;
}

String? _confirmationLabel(int? statusId) => switch (statusId) {
      1 => 'Ingepland',
      2 => 'Bevestigd',
      3 => 'Afgewezen',
      _ => null,
    };
