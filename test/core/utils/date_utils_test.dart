import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:planbition_app/core/utils/date_utils.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting("nl", null);
  });

  group("toIso8601WithOffset", () {
    test("output matches yyyy-MM-ddTHH:mm:ss.SS+HH:MM pattern", () {
      final dt = DateTime(2025, 6, 12, 8, 30, 0);
      final result = PlanbitionDateUtils.toIso8601WithOffset(dt);
      expect(result, isNotEmpty);
      expect(result.contains("T"), isTrue);
      final pattern = RegExp(
        r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d+[+-]\d{2}:\d{2}$",
      );
      expect(result, matches(pattern));
    });

    test("date parts are correct", () {
      final dt = DateTime(2025, 6, 12, 8, 30, 0);
      final result = PlanbitionDateUtils.toIso8601WithOffset(dt);
      expect(result.startsWith("2025-06-12T"), isTrue);
    });
  });

  group("formatDayMonth", () {
    test("returns Dutch abbreviated month for June", () {
      expect(PlanbitionDateUtils.formatDayMonth(DateTime(2025, 6, 12)), equals("12 jun"));
    });

    test("returns Dutch abbreviated month for January", () {
      expect(PlanbitionDateUtils.formatDayMonth(DateTime(2025, 1, 1)), equals("01 jan"));
    });

    test("returns Dutch abbreviated month for December", () {
      expect(PlanbitionDateUtils.formatDayMonth(DateTime(2025, 12, 31)), equals("31 dec"));
    });
  });

  group("formatDuration", () {
    test("zero duration returns 0m", () {
      expect(PlanbitionDateUtils.formatDuration(Duration.zero), equals("0m"));
    });

    test("only hours returns Xh", () {
      expect(PlanbitionDateUtils.formatDuration(const Duration(hours: 3)), equals("3h"));
    });

    test("hours and minutes returns Xh Ym", () {
      expect(PlanbitionDateUtils.formatDuration(const Duration(hours: 7, minutes: 30)), equals("7h 30m"));
    });

    test("only minutes returns Xm", () {
      expect(PlanbitionDateUtils.formatDuration(const Duration(minutes: 45)), equals("45m"));
    });

    test("exactly 1 minute returns 1m", () {
      expect(PlanbitionDateUtils.formatDuration(const Duration(minutes: 1)), equals("1m"));
    });
  });

  group("parseDateObject", () {
    test("valid map returns correct DateTime", () {
      final result = PlanbitionDateUtils.parseDateObject({"year": 2025, "month": 6, "day": 12});
      expect(result, equals(DateTime(2025, 6, 12)));
    });

    test("null map returns null", () {
      expect(PlanbitionDateUtils.parseDateObject(null), isNull);
    });

    test("missing year returns null", () {
      expect(PlanbitionDateUtils.parseDateObject({"month": 6, "day": 12}), isNull);
    });

    test("missing month returns null", () {
      expect(PlanbitionDateUtils.parseDateObject({"year": 2025, "day": 12}), isNull);
    });

    test("missing day returns null", () {
      expect(PlanbitionDateUtils.parseDateObject({"year": 2025, "month": 6}), isNull);
    });

    test("empty map returns null", () {
      expect(PlanbitionDateUtils.parseDateObject({}), isNull);
    });
  });

  group("parseTimeObject", () {
    test("valid map returns correct Duration", () {
      final result = PlanbitionDateUtils.parseTimeObject({"hour": 8, "minute": 30});
      expect(result, equals(const Duration(hours: 8, minutes: 30)));
    });

    test("null map returns null", () {
      expect(PlanbitionDateUtils.parseTimeObject(null), isNull);
    });

    test("missing hour defaults to 0", () {
      final result = PlanbitionDateUtils.parseTimeObject({"minute": 45});
      expect(result, equals(const Duration(minutes: 45)));
    });

    test("missing minute defaults to 0", () {
      final result = PlanbitionDateUtils.parseTimeObject({"hour": 10});
      expect(result, equals(const Duration(hours: 10)));
    });

    test("empty map returns zero duration", () {
      final result = PlanbitionDateUtils.parseTimeObject({});
      expect(result, equals(Duration.zero));
    });
  });

  group("combineDateAndTime", () {
    test("combines date and time correctly", () {
      final result = PlanbitionDateUtils.combineDateAndTime(DateTime(2025, 6, 12), const Duration(hours: 8, minutes: 30));
      expect(result, equals(DateTime(2025, 6, 12, 8, 30)));
    });

    test("midnight duration produces start of day", () {
      final result = PlanbitionDateUtils.combineDateAndTime(DateTime(2025, 1, 1), Duration.zero);
      expect(result, equals(DateTime(2025, 1, 1, 0, 0)));
    });

    test("end-of-day duration at 23:59", () {
      final result = PlanbitionDateUtils.combineDateAndTime(DateTime(2025, 12, 31), const Duration(hours: 23, minutes: 59));
      expect(result, equals(DateTime(2025, 12, 31, 23, 59)));
    });
  });

  group("startOfWeek", () {
    test("Wednesday returns the Monday of that week", () {
      final result = PlanbitionDateUtils.startOfWeek(DateTime(2025, 6, 11));
      expect(result, equals(DateTime(2025, 6, 9)));
      expect(result.weekday, equals(DateTime.monday));
    });

    test("Monday returns itself", () {
      final monday = DateTime(2025, 6, 9);
      expect(PlanbitionDateUtils.startOfWeek(monday), equals(monday));
    });

    test("Sunday returns the Monday of that week", () {
      final result = PlanbitionDateUtils.startOfWeek(DateTime(2025, 6, 15));
      expect(result, equals(DateTime(2025, 6, 9)));
    });
  });

  group("endOfWeek", () {
    test("Wednesday returns the Sunday of that week", () {
      final result = PlanbitionDateUtils.endOfWeek(DateTime(2025, 6, 11));
      expect(result, equals(DateTime(2025, 6, 15)));
      expect(result.weekday, equals(DateTime.sunday));
    });

    test("Monday returns the Sunday 6 days later", () {
      final result = PlanbitionDateUtils.endOfWeek(DateTime(2025, 6, 9));
      expect(result, equals(DateTime(2025, 6, 15)));
    });

    test("Sunday returns itself", () {
      final sunday = DateTime(2025, 6, 15);
      expect(PlanbitionDateUtils.endOfWeek(sunday), equals(sunday));
    });
  });

  group("dateRange", () {
    test("range of 3 days has length 3", () {
      final result = PlanbitionDateUtils.dateRange(DateTime(2025, 6, 9), DateTime(2025, 6, 11));
      expect(result.length, equals(3));
      expect(result.first, equals(DateTime(2025, 6, 9)));
      expect(result.last, equals(DateTime(2025, 6, 11)));
    });

    test("same start and end returns single date", () {
      final date = DateTime(2025, 6, 12);
      final result = PlanbitionDateUtils.dateRange(date, date);
      expect(result.length, equals(1));
      expect(result.first, equals(date));
    });

    test("full week returns 7 dates", () {
      final result = PlanbitionDateUtils.dateRange(DateTime(2025, 6, 9), DateTime(2025, 6, 15));
      expect(result.length, equals(7));
    });

    test("range spans month boundary correctly", () {
      final result = PlanbitionDateUtils.dateRange(DateTime(2025, 5, 30), DateTime(2025, 6, 2));
      expect(result.length, equals(4));
      expect(result.first, equals(DateTime(2025, 5, 30)));
      expect(result.last, equals(DateTime(2025, 6, 2)));
    });

    test("dates are in ascending order", () {
      final result = PlanbitionDateUtils.dateRange(DateTime(2025, 1, 1), DateTime(2025, 1, 5));
      for (var i = 0; i < result.length - 1; i++) {
        expect(result[i].isBefore(result[i + 1]), isTrue);
      }
    });
  });
}
