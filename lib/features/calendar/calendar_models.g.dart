// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarDto _$CalendarDtoFromJson(Map<String, dynamic> json) => _CalendarDto(
  schedules:
      (json['schedules'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  absences:
      (json['absences'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  availabilities:
      (json['availabilities'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  requestedAbsences:
      (json['requestedAbsences'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$CalendarDtoToJson(_CalendarDto instance) =>
    <String, dynamic>{
      'schedules': instance.schedules,
      'absences': instance.absences,
      'availabilities': instance.availabilities,
      'requestedAbsences': instance.requestedAbsences,
    };
