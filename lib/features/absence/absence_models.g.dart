// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AbsencePresenceSettingDto _$AbsencePresenceSettingDtoFromJson(
  Map<String, dynamic> json,
) => _AbsencePresenceSettingDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  startTime: json['startTime'] as Map<String, dynamic>,
  endTime: json['endTime'] as Map<String, dynamic>,
  requestFrom: json['requestFrom'] as Map<String, dynamic>?,
  requestTill: json['requestTill'] as Map<String, dynamic>?,
  remarkRequired: json['remarkRequired'] as bool,
);

Map<String, dynamic> _$AbsencePresenceSettingDtoToJson(
  _AbsencePresenceSettingDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'requestFrom': instance.requestFrom,
  'requestTill': instance.requestTill,
  'remarkRequired': instance.remarkRequired,
};

_AbsenceRequestDto _$AbsenceRequestDtoFromJson(Map<String, dynamic> json) =>
    _AbsenceRequestDto(
      id: (json['id'] as num?)?.toInt(),
      startDate: json['startDate'] as Map<String, dynamic>,
      endDate: json['endDate'] as Map<String, dynamic>,
      startTime: json['startTime'] as Map<String, dynamic>,
      endTime: json['endTime'] as Map<String, dynamic>,
      remark: json['remark'] as String,
    );

Map<String, dynamic> _$AbsenceRequestDtoToJson(_AbsenceRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'remark': instance.remark,
    };

_AbsenceResponseDto _$AbsenceResponseDtoFromJson(Map<String, dynamic> json) =>
    _AbsenceResponseDto(
      id: (json['id'] as num?)?.toInt(),
      startDate: json['startDate'] as Map<String, dynamic>,
      endDate: json['endDate'] as Map<String, dynamic>,
      startTime: json['startTime'] as Map<String, dynamic>,
      endTime: json['endTime'] as Map<String, dynamic>,
      name: json['name'] as String,
      color: (json['color'] as num?)?.toInt(),
      employeeRemark: json['employeeRemark'] as String?,
      plannerRemark: json['plannerRemark'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AbsenceResponseDtoToJson(_AbsenceResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'name': instance.name,
      'color': instance.color,
      'employeeRemark': instance.employeeRemark,
      'plannerRemark': instance.plannerRemark,
      'statusId': instance.statusId,
    };
