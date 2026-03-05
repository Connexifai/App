// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => _MessageDto(
  id: (json['id'] as num).toInt(),
  type: (json['type'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  createdAt: json['createdAt'] as String,
  isRead: json['isRead'] as bool? ?? false,
  scheduleId: (json['scheduleId'] as num?)?.toInt(),
);

Map<String, dynamic> _$MessageDtoToJson(_MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'scheduleId': instance.scheduleId,
    };

_MessagesResponseDto _$MessagesResponseDtoFromJson(Map<String, dynamic> json) =>
    _MessagesResponseDto(
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MessagesResponseDtoToJson(
  _MessagesResponseDto instance,
) => <String, dynamic>{'messages': instance.messages};
