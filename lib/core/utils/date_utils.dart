import 'package:intl/intl.dart';

/// Utility functions for date and time formatting used throughout the app.
abstract final class PlanbitionDateUtils {
  /// Formats a [DateTime] as an ISO 8601 string with local timezone offset.
  ///
  /// Example output: `2025-06-12T08:30:00.00+02:00`
  static String toIso8601WithOffset(DateTime dt) {
    final local = dt.toLocal();
    final offset = local.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final formatted = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SS").format(local);
    return '$formatted$sign$hours:$minutes';
  }

  /// Returns today's timestamp for use in API request headers.
  static String nowTimestamp() => toIso8601WithOffset(DateTime.now());

  /// Formats a date as `dd MMM` (e.g. `12 jun`).
  static String formatDayMonth(DateTime dt, {String locale = 'nl'}) {
    return DateFormat('dd MMM', locale).format(dt);
  }

  /// Formats a date as `EEEE dd MMMM` (e.g. `donderdag 12 juni`).
  static String formatFullDate(DateTime dt, {String locale = 'nl'}) {
    return DateFormat('EEEE dd MMMM', locale).format(dt);
  }

  /// Formats a time as `HH:mm` (e.g. `08:30`).
  static String formatTime(DateTime dt) {
    return DateFormat('HH:mm').format(dt);
  }

  /// Formats a duration as `Xh Ym` (e.g. `7h 30m`).
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    if (hours == 0) return '${minutes}m';
    if (minutes == 0) return '${hours}h';
    return '${hours}h ${minutes}m';
  }

  /// Parses an API date object `{ year, month, day }` to [DateTime].
  static DateTime? parseDateObject(Map<String, dynamic>? json) {
    if (json == null) return null;
    final year = json['year'] as int?;
    final month = json['month'] as int?;
    final day = json['day'] as int?;
    if (year == null || month == null || day == null) return null;
    return DateTime(year, month, day);
  }

  /// Parses an API time object `{ hour, minute }` to a [Duration].
  static Duration? parseTimeObject(Map<String, dynamic>? json) {
    if (json == null) return null;
    final hour = json['hour'] as int? ?? 0;
    final minute = json['minute'] as int? ?? 0;
    return Duration(hours: hour, minutes: minute);
  }

  /// Combines a [DateTime] date with a [Duration] time offset into a [DateTime].
  static DateTime combineDateAndTime(DateTime date, Duration time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.inHours,
      time.inMinutes % 60,
    );
  }

  /// Returns the start of the week (Monday) for the given [date].
  static DateTime startOfWeek(DateTime date) {
    final weekday = date.weekday; // 1 = Monday
    return DateTime(date.year, date.month, date.day - (weekday - 1));
  }

  /// Returns the end of the week (Sunday) for the given [date].
  static DateTime endOfWeek(DateTime date) {
    return startOfWeek(date).add(const Duration(days: 6));
  }

  /// Returns the start of the month for the given [date].
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month);
  }

  /// Returns the end of the month for the given [date].
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  /// Returns a list of dates in the range [from, to] (inclusive).
  static List<DateTime> dateRange(DateTime from, DateTime to) {
    final dates = <DateTime>[];
    var current = DateTime(from.year, from.month, from.day);
    final end = DateTime(to.year, to.month, to.day);
    while (!current.isAfter(end)) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }
}
