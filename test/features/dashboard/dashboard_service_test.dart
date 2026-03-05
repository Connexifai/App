import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:planbition_app/core/models/response_wrapper.dart';
import 'package:planbition_app/features/dashboard/dashboard_service.dart';
import 'package:planbition_app/features/dashboard/dashboard_models.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late DashboardService service;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.planbition.nl'));
    adapter = DioAdapter(dio: dio);
    service = DashboardService(dio);
  });

  // -------------------------------------------------------------------------
  // getFirstShifts
  // -------------------------------------------------------------------------
  group('getFirstShifts', () {
    final shiftJson = {
      'id': 101,
      'name': 'Morning Shift',
      'scheduleDate': {'year': 2025, 'month': 6, 'day': 12},
      'startTime': {'hour': 8, 'minute': 0},
      'endTime': {'hour': 16, 'minute': 0},
      'clientName': 'Acme Corp',
      'departmentName': 'Warehouse',
    };

    test('success returns a list of ShiftDto', () async {
      adapter.onGet(
        '/Dashboard/firstshifts',
        (server) => server.reply(200, {
          'isSuccess': true,
          'data': [shiftJson],
        }),
      );

      final result = await service.getFirstShifts();

      expect(result.isSuccess, isTrue);
      final shifts = result.dataOrNull!;
      expect(shifts, hasLength(1));
      expect(shifts.first.id, equals(101));
      expect(shifts.first.name, equals('Morning Shift'));
    });

    test('success with empty list returns empty list', () async {
      adapter.onGet(
        '/Dashboard/firstshifts',
        (server) => server.reply(200, {
          'isSuccess': true,
          'data': [],
        }),
      );

      final result = await service.getFirstShifts();

      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull, isEmpty);
    });

    test('HTTP 500 returns ApiFailure', () async {
      adapter.onGet(
        '/Dashboard/firstshifts',
        (server) => server.reply(
          500,
          {'errorMessage': 'Internal server error'},
        ),
      );

      final result = await service.getFirstShifts();

      expect(result.isFailure, isTrue);
      expect(result.errorOrNull, isNotNull);
    });

    test('isSuccess false in wrapper returns ApiFailure', () async {
      adapter.onGet(
        '/Dashboard/firstshifts',
        (server) => server.reply(200, {
          'isSuccess': false,
          'errorMessage': 'Not authorized',
          'data': null,
        }),
      );

      final result = await service.getFirstShifts();

      expect(result.isFailure, isTrue);
    });
  });

  // -------------------------------------------------------------------------
  // punchIn
  // -------------------------------------------------------------------------
  group('punchIn', () {
    test('success returns ApiSuccess with null', () async {
      adapter.onPost(
        '/Dashboard/punchin',
        (server) => server.reply(200, null),
        data: Matchers.any,
      );

      final result = await service.punchIn(scheduleId: 42);

      expect(result.isSuccess, isTrue);
    });

    test('HTTP 400 returns ApiFailure', () async {
      adapter.onPost(
        '/Dashboard/punchin',
        (server) => server.reply(
          400,
          {'errorMessage': 'Already punched in'},
        ),
        data: Matchers.any,
      );

      final result = await service.punchIn(scheduleId: 42);

      expect(result.isFailure, isTrue);
    });
  });

  // -------------------------------------------------------------------------
  // punchOut
  // -------------------------------------------------------------------------
  group('punchOut', () {
    test('success returns ApiSuccess with null', () async {
      adapter.onPost(
        '/Dashboard/punchout',
        (server) => server.reply(200, null),
        data: Matchers.any,
      );

      final result = await service.punchOut(scheduleId: 42);

      expect(result.isSuccess, isTrue);
    });

    test('HTTP 403 returns ApiFailure', () async {
      adapter.onPost(
        '/Dashboard/punchout',
        (server) => server.reply(
          403,
          {'errorMessage': 'Forbidden'},
        ),
        data: Matchers.any,
      );

      final result = await service.punchOut(scheduleId: 42);

      expect(result.isFailure, isTrue);
    });
  });
}
