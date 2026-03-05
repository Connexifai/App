import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

/// A shift as returned by GET /Dashboard/firstshifts.
@freezed
abstract class ShiftDto with _$ShiftDto {
  const factory ShiftDto({
    required int id,
    required String name,
    required Map<String, dynamic> scheduleDate,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    String? clientName,
    String? departmentName,
    AddressDto? address,
    String? scheduledRemark,
    bool? isConfirmed,
    int? confirmationStatusId,
  }) = _ShiftDto;

  factory ShiftDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftDtoFromJson(json);
}

/// Address data attached to a shift (used for geofencing).
@freezed
abstract class AddressDto with _$AddressDto {
  const factory AddressDto({
    required String street,
    required String number,
    String? numberAddition,
    String? postalCode,
    String? city,
    String? county,
    String? country,

    /// Pre-resolved latitude (when available).
    double? latitude,

    /// Pre-resolved longitude (when available).
    double? longitude,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}

extension AddressDtoX on AddressDto {
  /// Returns a single-line display string.
  String get displayLine =>
      [street, number, if (numberAddition != null) numberAddition, city]
          .where((p) => p != null && p.isNotEmpty)
          .join(' ');
}

/// Punch request DTO for POST /Dashboard/punchin and /punchout.
@freezed
abstract class PunchRequestDto with _$PunchRequestDto {
  const factory PunchRequestDto({
    required int scheduleId,
  }) = _PunchRequestDto;

  factory PunchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PunchRequestDtoFromJson(json);
}
