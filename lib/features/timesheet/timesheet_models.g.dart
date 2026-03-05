// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimesheetPeriodDto _$TimesheetPeriodDtoFromJson(Map<String, dynamic> json) =>
    _TimesheetPeriodDto(
      from: json['from'] as Map<String, dynamic>,
      till: json['till'] as Map<String, dynamic>,
      isSubmitted: json['isSubmitted'] as bool,
      shifts: (json['shifts'] as List<dynamic>)
          .map((e) => TimesheetShiftDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      absences: (json['absences'] as List<dynamic>)
          .map((e) => TimesheetAbsenceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimesheetPeriodDtoToJson(_TimesheetPeriodDto instance) =>
    <String, dynamic>{
      'from': instance.from,
      'till': instance.till,
      'isSubmitted': instance.isSubmitted,
      'shifts': instance.shifts,
      'absences': instance.absences,
    };

_TimesheetShiftDto _$TimesheetShiftDtoFromJson(Map<String, dynamic> json) =>
    _TimesheetShiftDto(
      id: (json['id'] as num).toInt(),
      scheduleDate: json['scheduleDate'] as Map<String, dynamic>,
      startTime: json['startTime'] as Map<String, dynamic>,
      endTime: json['endTime'] as Map<String, dynamic>,
      name: json['name'] as String,
      clientName: json['clientName'] as String?,
      actualStartTime: json['actualStartTime'] as Map<String, dynamic>?,
      actualEndTime: json['actualEndTime'] as Map<String, dynamic>?,
      isSubmitted: json['isSubmitted'] as bool,
    );

Map<String, dynamic> _$TimesheetShiftDtoToJson(_TimesheetShiftDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduleDate': instance.scheduleDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'name': instance.name,
      'clientName': instance.clientName,
      'actualStartTime': instance.actualStartTime,
      'actualEndTime': instance.actualEndTime,
      'isSubmitted': instance.isSubmitted,
    };

_TimesheetAbsenceDto _$TimesheetAbsenceDtoFromJson(Map<String, dynamic> json) =>
    _TimesheetAbsenceDto(
      id: (json['id'] as num).toInt(),
      scheduleDate: json['scheduleDate'] as Map<String, dynamic>,
      startTime: json['startTime'] as Map<String, dynamic>,
      endTime: json['endTime'] as Map<String, dynamic>,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TimesheetAbsenceDtoToJson(
  _TimesheetAbsenceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'scheduleDate': instance.scheduleDate,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'name': instance.name,
};

_TimesheetSubmitRequestDto _$TimesheetSubmitRequestDtoFromJson(
  Map<String, dynamic> json,
) => _TimesheetSubmitRequestDto(
  scheduleId: (json['scheduleId'] as num?)?.toInt(),
  absenceId: (json['absenceId'] as num?)?.toInt(),
  actualStartTime: json['actualStartTime'] as Map<String, dynamic>,
  actualEndTime: json['actualEndTime'] as Map<String, dynamic>,
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$TimesheetSubmitRequestDtoToJson(
  _TimesheetSubmitRequestDto instance,
) => <String, dynamic>{
  'scheduleId': instance.scheduleId,
  'absenceId': instance.absenceId,
  'actualStartTime': instance.actualStartTime,
  'actualEndTime': instance.actualEndTime,
  'remark': instance.remark,
};
