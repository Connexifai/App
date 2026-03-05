import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability_models.freezed.dart';
part 'availability_models.g.dart';

@freezed
abstract class AvailabilitySettingsDto with _$AvailabilitySettingsDto {
  const factory AvailabilitySettingsDto({
    required bool canAdjustAvailability,
    required List<AvailabilityBasicSettingDto> availabilities,
    required List<AvailabilityBlockSettingDto> availabilityBlocks,
  }) = _AvailabilitySettingsDto;

  factory AvailabilitySettingsDto.fromJson(Map<String, dynamic> json) =>
      _$AvailabilitySettingsDtoFromJson(json);
}

@freezed
abstract class AvailabilityBasicSettingDto with _$AvailabilityBasicSettingDto {
  const factory AvailabilityBasicSettingDto({
    int? id,
    required Map<String, dynamic> requestFrom,
    required Map<String, dynamic> requestUntil,
  }) = _AvailabilityBasicSettingDto;

  factory AvailabilityBasicSettingDto.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityBasicSettingDtoFromJson(json);
}

@freezed
abstract class AvailabilityBlockSettingDto with _$AvailabilityBlockSettingDto {
  const factory AvailabilityBlockSettingDto({
    int? id,
    int? availabilityId,
    required String name,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    required Map<String, dynamic> requestFrom,
    required Map<String, dynamic> requestUntil,
  }) = _AvailabilityBlockSettingDto;

  factory AvailabilityBlockSettingDto.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityBlockSettingDtoFromJson(json);
}

@freezed
abstract class AvailabilityRequestDto with _$AvailabilityRequestDto {
  const factory AvailabilityRequestDto({
    int? availabilityId,
    int? availabilityBlockId,
    Map<String, dynamic>? startTime,
    Map<String, dynamic>? endTime,
    Map<String, dynamic>? requestFrom,
    Map<String, dynamic>? requestUntil,
    List<Map<String, dynamic>>? calendarDays,
    List<int>? recurrenceDays,
    int? recurrenceWeekInterval,
    String? remark,
  }) = _AvailabilityRequestDto;

  factory AvailabilityRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityRequestDtoFromJson(json);
}
