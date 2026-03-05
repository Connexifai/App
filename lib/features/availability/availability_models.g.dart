// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailabilitySettingsDto _$AvailabilitySettingsDtoFromJson(
  Map<String, dynamic> json,
) => _AvailabilitySettingsDto(
  canAdjustAvailability: json['canAdjustAvailability'] as bool,
  availabilities: (json['availabilities'] as List<dynamic>)
      .map(
        (e) => AvailabilityBasicSettingDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  availabilityBlocks: (json['availabilityBlocks'] as List<dynamic>)
      .map(
        (e) => AvailabilityBlockSettingDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$AvailabilitySettingsDtoToJson(
  _AvailabilitySettingsDto instance,
) => <String, dynamic>{
  'canAdjustAvailability': instance.canAdjustAvailability,
  'availabilities': instance.availabilities,
  'availabilityBlocks': instance.availabilityBlocks,
};

_AvailabilityBasicSettingDto _$AvailabilityBasicSettingDtoFromJson(
  Map<String, dynamic> json,
) => _AvailabilityBasicSettingDto(
  id: (json['id'] as num?)?.toInt(),
  requestFrom: json['requestFrom'] as Map<String, dynamic>,
  requestUntil: json['requestUntil'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AvailabilityBasicSettingDtoToJson(
  _AvailabilityBasicSettingDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'requestFrom': instance.requestFrom,
  'requestUntil': instance.requestUntil,
};

_AvailabilityBlockSettingDto _$AvailabilityBlockSettingDtoFromJson(
  Map<String, dynamic> json,
) => _AvailabilityBlockSettingDto(
  id: (json['id'] as num?)?.toInt(),
  availabilityId: (json['availabilityId'] as num?)?.toInt(),
  name: json['name'] as String,
  startTime: json['startTime'] as Map<String, dynamic>,
  endTime: json['endTime'] as Map<String, dynamic>,
  requestFrom: json['requestFrom'] as Map<String, dynamic>,
  requestUntil: json['requestUntil'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AvailabilityBlockSettingDtoToJson(
  _AvailabilityBlockSettingDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'availabilityId': instance.availabilityId,
  'name': instance.name,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'requestFrom': instance.requestFrom,
  'requestUntil': instance.requestUntil,
};

_AvailabilityRequestDto _$AvailabilityRequestDtoFromJson(
  Map<String, dynamic> json,
) => _AvailabilityRequestDto(
  availabilityId: (json['availabilityId'] as num?)?.toInt(),
  availabilityBlockId: (json['availabilityBlockId'] as num?)?.toInt(),
  startTime: json['startTime'] as Map<String, dynamic>?,
  endTime: json['endTime'] as Map<String, dynamic>?,
  requestFrom: json['requestFrom'] as Map<String, dynamic>?,
  requestUntil: json['requestUntil'] as Map<String, dynamic>?,
  calendarDays: (json['calendarDays'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  recurrenceDays: (json['recurrenceDays'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  recurrenceWeekInterval: (json['recurrenceWeekInterval'] as num?)?.toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$AvailabilityRequestDtoToJson(
  _AvailabilityRequestDto instance,
) => <String, dynamic>{
  'availabilityId': instance.availabilityId,
  'availabilityBlockId': instance.availabilityBlockId,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'requestFrom': instance.requestFrom,
  'requestUntil': instance.requestUntil,
  'calendarDays': instance.calendarDays,
  'recurrenceDays': instance.recurrenceDays,
  'recurrenceWeekInterval': instance.recurrenceWeekInterval,
  'remark': instance.remark,
};
