import 'package:flutter_test/flutter_test.dart';
import 'package:planbition_app/core/models/response_wrapper.dart';

void main() {
  group('ApiSuccess', () {
    test('data is accessible', () {
      const result = ApiSuccess<String>('hello');
      expect(result.data, equals('hello'));
    });

    test('isSuccess returns true', () {
      const result = ApiSuccess<int>(42);
      expect(result.isSuccess, isTrue);
    });

    test('isFailure returns false', () {
      const result = ApiSuccess<int>(42);
      expect(result.isFailure, isFalse);
    });
  });

  group('ApiFailure', () {
    const error = ApiError(message: 'Something went wrong', statusCode: 500);

    test('error is accessible', () {
      const result = ApiFailure<String>(error);
      expect(result.error, equals(error));
    });

    test('isSuccess returns false', () {
      const result = ApiFailure<int>(error);
      expect(result.isSuccess, isFalse);
    });

    test('isFailure returns true', () {
      const result = ApiFailure<int>(error);
      expect(result.isFailure, isTrue);
    });
  });

  group('ApiResultX.when', () {
    test('success branch is called with correct data', () {
      const ApiResult<String> result = ApiSuccess('payload');
      String? captured;
      result.when(
        success: (data) { captured = data; },
        failure: (_) {},
      );
      expect(captured, equals('payload'));
    });

    test('failure branch is called with correct error', () {
      const error = ApiError(message: 'bad request', statusCode: 400);
      const ApiResult<String> result = ApiFailure(error);
      ApiError? capturedError;
      result.when(
        success: (_) {},
        failure: (e) { capturedError = e; },
      );
      expect(capturedError, equals(error));
      expect(capturedError!.message, equals('bad request'));
    });

    test('success branch is not called for failure', () {
      const ApiResult<int> result = ApiFailure(ApiError(message: 'nope'));
      var successCalled = false;
      result.when(
        success: (_) { successCalled = true; },
        failure: (_) {},
      );
      expect(successCalled, isFalse);
    });

    test('failure branch is not called for success', () {
      const ApiResult<int> result = ApiSuccess(1);
      var failureCalled = false;
      result.when(
        success: (_) {},
        failure: (_) { failureCalled = true; },
      );
      expect(failureCalled, isFalse);
    });
  });

  group('ApiResultX.dataOrNull', () {
    test('returns data on success', () {
      const ApiResult<String> result = ApiSuccess('value');
      expect(result.dataOrNull, equals('value'));
    });

    test('returns null on failure', () {
      const ApiResult<String> result = ApiFailure(ApiError(message: 'err'));
      expect(result.dataOrNull, isNull);
    });
  });

  group('ApiResultX.errorOrNull', () {
    test('returns null on success', () {
      const ApiResult<String> result = ApiSuccess('value');
      expect(result.errorOrNull, isNull);
    });

    test('returns error on failure', () {
      const error = ApiError(message: 'err', statusCode: 404);
      const ApiResult<String> result = ApiFailure(error);
      expect(result.errorOrNull, equals(error));
    });
  });

  group('ApiError', () {
    test('message and statusCode are stored correctly', () {
      const error = ApiError(message: 'Not Found', statusCode: 404);
      expect(error.message, equals('Not Found'));
      expect(error.statusCode, equals(404));
    });

    test('code is stored correctly', () {
      const error = ApiError(message: 'err', code: 'HTTP_500', statusCode: 500);
      expect(error.code, equals('HTTP_500'));
    });

    test('code and statusCode default to null when omitted', () {
      const error = ApiError(message: 'Generic error');
      expect(error.code, isNull);
      expect(error.statusCode, isNull);
    });

    test('equality works for identical errors', () {
      const e1 = ApiError(message: 'err', statusCode: 400);
      const e2 = ApiError(message: 'err', statusCode: 400);
      expect(e1, equals(e2));
    });
  });
}
