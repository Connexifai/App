// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftDto _$ShiftDtoFromJson(Map<String, dynamic> json) => _ShiftDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  scheduleDate: json['scheduleDate'] as Map<String, dynamic>,
  startTime: json['startTime'] as Map<String, dynamic>,
  endTime: json['endTime'] as Map<String, dynamic>,
  clientName: json['clientName'] as String?,
  departmentName: json['departmentName'] as String?,
  address: json['address'] == null
      ? null
      : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
  scheduledRemark: json['scheduledRemark'] as String?,
  isConfirmed: json['isConfirmed'] as bool?,
  confirmationStatusId: (json['confirmationStatusId'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShiftDtoToJson(_ShiftDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'scheduleDate': instance.scheduleDate,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'clientName': instance.clientName,
  'departmentName': instance.departmentName,
  'address': instance.address,
  'scheduledRemark': instance.scheduledRemark,
  'isConfirmed': instance.isConfirmed,
  'confirmationStatusId': instance.confirmationStatusId,
};

_AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => _AddressDto(
  street: json['street'] as String,
  number: json['number'] as String,
  numberAddition: json['numberAddition'] as String?,
  postalCode: json['postalCode'] as String?,
  city: json['city'] as String?,
  county: json['county'] as String?,
  country: json['country'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AddressDtoToJson(_AddressDto instance) =>
    <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'numberAddition': instance.numberAddition,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'county': instance.county,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_PunchRequestDto _$PunchRequestDtoFromJson(Map<String, dynamic> json) =>
    _PunchRequestDto(scheduleId: (json['scheduleId'] as num).toInt());

Map<String, dynamic> _$PunchRequestDtoToJson(_PunchRequestDto instance) =>
    <String, dynamic>{'scheduleId': instance.scheduleId};
