import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace_models.freezed.dart';
part 'marketplace_models.g.dart';

@freezed
abstract class MarketplaceShiftDto with _$MarketplaceShiftDto {
  const factory MarketplaceShiftDto({
    required int id,
    required String name,
    String? clientName,
    String? departmentName,
    required Map<String, dynamic> scheduleDate,
    required Map<String, dynamic> startTime,
    required Map<String, dynamic> endTime,
    Map<String, dynamic>? address,
    double? distance,
    required bool isScheduled,
  }) = _MarketplaceShiftDto;

  factory MarketplaceShiftDto.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceShiftDtoFromJson(json);
}

@freezed
abstract class MarketplaceOverviewDto with _$MarketplaceOverviewDto {
  const factory MarketplaceOverviewDto({
    required List<MarketplaceShiftDto> shifts,
  }) = _MarketplaceOverviewDto;

  factory MarketplaceOverviewDto.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceOverviewDtoFromJson(json);
}
