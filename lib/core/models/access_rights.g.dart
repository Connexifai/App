// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_rights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccessRights _$AccessRightsFromJson(
  Map<String, dynamic> json,
) => _AccessRights(
  featureRequestAbsenceEnabled:
      json['featureRequestAbsenceEnabled'] as bool? ?? false,
  featureConfirmationEnabled:
      json['featureConfirmationEnabled'] as bool? ?? false,
  featureConfirmationDeclineEnabled:
      json['featureConfirmationDeclineEnabled'] as bool? ?? false,
  featureConfirmationDeclineRemarkRequired:
      json['featureConfirmationDeclineRemarkRequired'] as bool? ?? false,
  featureRequestAvailabilityEnabled:
      json['featureRequestAvailabilityEnabled'] as bool? ?? false,
  featureRequestAvailablityBlockEnabled:
      json['featureRequestAvailablityBlockEnabled'] as bool? ?? false,
  featureMarketplaceEnabled:
      json['featureMarketplaceEnabled'] as bool? ?? false,
  featureTimesheetsEnabled: json['featureTimesheetsEnabled'] as bool? ?? false,
  featureQrCodeEnabled: json['featureQrCodeEnabled'] as bool? ?? false,
  featureGeofencingEnabled: json['featureGeofencingEnabled'] as bool? ?? false,
);

Map<String, dynamic> _$AccessRightsToJson(_AccessRights instance) =>
    <String, dynamic>{
      'featureRequestAbsenceEnabled': instance.featureRequestAbsenceEnabled,
      'featureConfirmationEnabled': instance.featureConfirmationEnabled,
      'featureConfirmationDeclineEnabled':
          instance.featureConfirmationDeclineEnabled,
      'featureConfirmationDeclineRemarkRequired':
          instance.featureConfirmationDeclineRemarkRequired,
      'featureRequestAvailabilityEnabled':
          instance.featureRequestAvailabilityEnabled,
      'featureRequestAvailablityBlockEnabled':
          instance.featureRequestAvailablityBlockEnabled,
      'featureMarketplaceEnabled': instance.featureMarketplaceEnabled,
      'featureTimesheetsEnabled': instance.featureTimesheetsEnabled,
      'featureQrCodeEnabled': instance.featureQrCodeEnabled,
      'featureGeofencingEnabled': instance.featureGeofencingEnabled,
    };
