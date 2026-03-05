import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_models.freezed.dart';
part 'message_models.g.dart';

/// Message type identifiers returned by the API.
abstract final class MessageType {
  /// Informational message.
  static const int info = 1;

  /// PlanPush message — requires an Accept/Decline action.
  static const int planPush = 2;
}

/// A single message from GET /MessageCenter/messages.
@freezed
abstract class MessageDto with _$MessageDto {
  const factory MessageDto({
    /// Unique message identifier.
    required int id,

    /// 1 = Info, 2 = PlanPush.
    required int type,

    /// Short title displayed in the list.
    required String title,

    /// Optional long description shown in the detail sheet.
    String? description,

    /// ISO-8601 creation timestamp.
    required String createdAt,

    /// Whether the employee has already opened this message.
    @Default(false) bool isRead,

    /// The related schedule id for PlanPush messages; null for Info messages.
    int? scheduleId,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);
}

/// Wrapper for the list of messages returned by the API.
///
/// Some backends return the array directly; others wrap it in an object.
/// This DTO supports both via [fromJson].
@freezed
abstract class MessagesResponseDto with _$MessagesResponseDto {
  const factory MessagesResponseDto({
    @Default([]) List<MessageDto> messages,
  }) = _MessagesResponseDto;

  factory MessagesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseDtoFromJson(json);
}

/// The action a user can take on a PlanPush message.
enum PlanPushAction {
  /// Accept the proposed schedule change.
  accept(1),

  /// Decline the proposed schedule change.
  decline(2);

  const PlanPushAction(this.value);
  final int value;
}
