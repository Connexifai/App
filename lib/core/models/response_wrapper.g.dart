// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseWrapper<T> _$ResponseWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ResponseWrapper<T>(
  isSuccess: json['isSuccess'] as bool,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  errorMessage: json['errorMessage'] as String?,
  errorCode: json['errorCode'] as String?,
);

Map<String, dynamic> _$ResponseWrapperToJson<T>(
  _ResponseWrapper<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'isSuccess': instance.isSuccess,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'errorMessage': instance.errorMessage,
  'errorCode': instance.errorCode,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
