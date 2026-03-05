// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) =>
    _SessionModel(
      tenantIdentity: json['tenantIdentity'] as String,
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiresAt: DateTime.parse(
        json['accessTokenExpiresAt'] as String,
      ),
      refreshTokenExpiresAt: DateTime.parse(
        json['refreshTokenExpiresAt'] as String,
      ),
      userIdentity: json['userIdentity'] as String? ?? '',
    );

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'tenantIdentity': instance.tenantIdentity,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt.toIso8601String(),
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt.toIso8601String(),
      'userIdentity': instance.userIdentity,
    };
