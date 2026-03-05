import 'package:freezed_annotation/freezed_annotation.dart';

part 'timesheet_models.freezed.dart';
part 'timesheet_models.g.dart';

@freezed
abstract class TimesheetPeriodDto with _$TimesheetPeriodDto {
  const factory TimesheetPeriodDto({
    required Map<String, dynamic> from,
    required Map<String, dynamic> till,
    required bool isSubmitted,
    required List<TimesheetShiftDto> shifts,
    required List<TimesheetAbsenceDto> absences,
  }) = _TimesheetPeriodDto;

  factory TimesheetPeriodDto.fromJson(Map<String, dynamic> json) =>
      _$TimesheetPeriodDtoFromJson(json);
}

@freezed
abstract class TimesheetShiftDto with _$TimesheetShiftDto {
  const factory TimesheetShiftDto({
    required int id,
    required Map<String, dynamic> scheduleDate,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    required String name,
    String? clientName,
    Map<String, dynamic>? actualStartTime,
    Map<String, dynamic>? actualEndTime,
    required bool isSubmitted,
  }) = _TimesheetShiftDto;

  factory TimesheetShiftDto.fromJson(Map<String, dynamic> json) =>
      _$TimesheetShiftDtoFromJson(json);
}

@freezed
abstract class TimesheetAbsenceDto with _$TimesheetAbsenceDto {
  const factory TimesheetAbsenceDto({
    required int id,
    required Map<String, dynamic> scheduleDate,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    required String name,
  }) = _TimesheetAbsenceDto;

  factory TimesheetAbsenceDto.fromJson(Map<String, dynamic> json) =>
      _$TimesheetAbsenceDtoFromJson(json);
}

@freezed
abstract class TimesheetSubmitRequestDto with _$TimesheetSubmitRequestDto {
  const factory TimesheetSubmitRequestDto({
    int? scheduleId,
    int? absenceId,
    required Map<String, dynamic> actualStartTime,
    required Map<String, dynamic> actualEndTime,
    String? remark,
  }) = _TimesheetSubmitRequestDto;

  factory TimesheetSubmitRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TimesheetSubmitRequestDtoFromJson(json);
}
