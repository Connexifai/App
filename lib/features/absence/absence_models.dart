import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_models.freezed.dart';
part 'absence_models.g.dart';

@freezed
abstract class AbsencePresenceSettingDto with _$AbsencePresenceSettingDto {
  const factory AbsencePresenceSettingDto({
    int? id,
    required String name,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    Map<String, dynamic>? requestFrom,
    Map<String, dynamic>? requestTill,
    required bool remarkRequired,
  }) = _AbsencePresenceSettingDto;

  factory AbsencePresenceSettingDto.fromJson(Map<String, dynamic> json) =>
      _$AbsencePresenceSettingDtoFromJson(json);
}

@freezed
abstract class AbsenceRequestDto with _$AbsenceRequestDto {
  const factory AbsenceRequestDto({
    int? id,
    required Map<String, dynamic> startDate,
    required Map<String, dynamic> endDate,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    required String remark,
  }) = _AbsenceRequestDto;

  factory AbsenceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AbsenceRequestDtoFromJson(json);
}

@freezed
abstract class AbsenceResponseDto with _$AbsenceResponseDto {
  const factory AbsenceResponseDto({
    int? id,
    required Map<String, dynamic> startDate,
    required Map<String, dynamic> endDate,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    required String name,
    int? color,
    String? employeeRemark,
    String? plannerRemark,
    int? statusId,
  }) = _AbsenceResponseDto;

  factory AbsenceResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AbsenceResponseDtoFromJson(json);
}
