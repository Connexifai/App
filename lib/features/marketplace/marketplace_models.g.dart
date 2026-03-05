// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketplaceShiftDto _$MarketplaceShiftDtoFromJson(Map<String, dynamic> json) =>
    _MarketplaceShiftDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      clientName: json['clientName'] as String?,
      departmentName: json['departmentName'] as String?,
      scheduleDate: json['scheduleDate'] as Map<String, dynamic>,
      startTime: json['startTime'] as Map<String, dynamic>,
      endTime: json['endTime'] as Map<String, dynamic>,
      address: json['address'] as Map<String, dynamic>?,
      distance: (json['distance'] as num?)?.toDouble(),
      isScheduled: json['isScheduled'] as bool,
    );

Map<String, dynamic> _$MarketplaceShiftDtoToJson(
  _MarketplaceShiftDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'clientName': instance.clientName,
  'departmentName': instance.departmentName,
  'scheduleDate': instance.scheduleDate,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'address': instance.address,
  'distance': instance.distance,
  'isScheduled': instance.isScheduled,
};

_MarketplaceOverviewDto _$MarketplaceOverviewDtoFromJson(
  Map<String, dynamic> json,
) => _MarketplaceOverviewDto(
  shifts: (json['shifts'] as List<dynamic>)
      .map((e) => MarketplaceShiftDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MarketplaceOverviewDtoToJson(
  _MarketplaceOverviewDto instance,
) => <String, dynamic>{'shifts': instance.shifts};
