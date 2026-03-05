import 'package:flutter_test/flutter_test.dart';
import 'package:planbition_app/core/models/access_rights.dart';

void main() {
  group('AccessRights default constructor', () {
    test('all flags default to false', () {
      const rights = AccessRights();
      expect(rights.featureRequestAbsenceEnabled, isFalse);
      expect(rights.featureConfirmationEnabled, isFalse);
      expect(rights.featureConfirmationDeclineEnabled, isFalse);
      expect(rights.featureConfirmationDeclineRemarkRequired, isFalse);
      expect(rights.featureRequestAvailabilityEnabled, isFalse);
      expect(rights.featureRequestAvailablityBlockEnabled, isFalse);
      expect(rights.featureMarketplaceEnabled, isFalse);
      expect(rights.featureTimesheetsEnabled, isFalse);
      expect(rights.featureQrCodeEnabled, isFalse);
      expect(rights.featureGeofencingEnabled, isFalse);
    });
  });

  group('AccessRights.fromJson', () {
    test('parses all true fields correctly', () {
      final rights = AccessRights.fromJson({
        'featureRequestAbsenceEnabled': true,
        'featureConfirmationEnabled': true,
        'featureConfirmationDeclineEnabled': true,
        'featureConfirmationDeclineRemarkRequired': true,
        'featureRequestAvailabilityEnabled': true,
        'featureRequestAvailablityBlockEnabled': true,
        'featureMarketplaceEnabled': true,
        'featureTimesheetsEnabled': true,
        'featureQrCodeEnabled': true,
        'featureGeofencingEnabled': true,
      });
      expect(rights.featureRequestAbsenceEnabled, isTrue);
      expect(rights.featureConfirmationEnabled, isTrue);
      expect(rights.featureConfirmationDeclineEnabled, isTrue);
      expect(rights.featureConfirmationDeclineRemarkRequired, isTrue);
      expect(rights.featureRequestAvailabilityEnabled, isTrue);
      expect(rights.featureRequestAvailablityBlockEnabled, isTrue);
      expect(rights.featureMarketplaceEnabled, isTrue);
      expect(rights.featureTimesheetsEnabled, isTrue);
      expect(rights.featureQrCodeEnabled, isTrue);
      expect(rights.featureGeofencingEnabled, isTrue);
    });

    test('parses partial fields — rest defaults to false', () {
      final rights = AccessRights.fromJson({
        'featureRequestAbsenceEnabled': true,
        'featureTimesheetsEnabled': false,
      });
      expect(rights.featureRequestAbsenceEnabled, isTrue);
      expect(rights.featureTimesheetsEnabled, isFalse);
      expect(rights.featureConfirmationEnabled, isFalse);
    });

    test('missing fields default to false', () {
      final rights = AccessRights.fromJson({});
      expect(rights.featureRequestAbsenceEnabled, isFalse);
      expect(rights.featureConfirmationEnabled, isFalse);
      expect(rights.featureGeofencingEnabled, isFalse);
    });
  });

  group('hasConfirmationFeature', () {
    test('is false when both confirmation flags are false', () {
      const rights = AccessRights();
      expect(rights.hasConfirmationFeature, isFalse);
    });

    test('is true when featureConfirmationEnabled is true', () {
      const rights = AccessRights(featureConfirmationEnabled: true);
      expect(rights.hasConfirmationFeature, isTrue);
    });

    test('is true when featureConfirmationDeclineEnabled is true', () {
      const rights = AccessRights(featureConfirmationDeclineEnabled: true);
      expect(rights.hasConfirmationFeature, isTrue);
    });

    test('is true when both confirmation flags are true', () {
      const rights = AccessRights(
        featureConfirmationEnabled: true,
        featureConfirmationDeclineEnabled: true,
      );
      expect(rights.hasConfirmationFeature, isTrue);
    });
  });

  group('hasAvailabilityFeature', () {
    test('is false when both availability flags are false', () {
      const rights = AccessRights();
      expect(rights.hasAvailabilityFeature, isFalse);
    });

    test('is true when featureRequestAvailabilityEnabled is true', () {
      const rights = AccessRights(featureRequestAvailabilityEnabled: true);
      expect(rights.hasAvailabilityFeature, isTrue);
    });

    test('is true when featureRequestAvailablityBlockEnabled is true', () {
      const rights = AccessRights(featureRequestAvailablityBlockEnabled: true);
      expect(rights.hasAvailabilityFeature, isTrue);
    });

    test('is true when both availability flags are true', () {
      const rights = AccessRights(
        featureRequestAvailabilityEnabled: true,
        featureRequestAvailablityBlockEnabled: true,
      );
      expect(rights.hasAvailabilityFeature, isTrue);
    });
  });
}
