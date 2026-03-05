// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageDto {

/// Unique message identifier.
 int get id;/// 1 = Info, 2 = PlanPush.
 int get type;/// Short title displayed in the list.
 String get title;/// Optional long description shown in the detail sheet.
 String? get description;/// ISO-8601 creation timestamp.
 String get createdAt;/// Whether the employee has already opened this message.
 bool get isRead;/// The related schedule id for PlanPush messages; null for Info messages.
 int? get scheduleId;
/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<MessageDto> get copyWith => _$MessageDtoCopyWithImpl<MessageDto>(this as MessageDto, _$identity);

  /// Serializes this MessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,createdAt,isRead,scheduleId);

@override
String toString() {
  return 'MessageDto(id: $id, type: $type, title: $title, description: $description, createdAt: $createdAt, isRead: $isRead, scheduleId: $scheduleId)';
}


}

/// @nodoc
abstract mixin class $MessageDtoCopyWith<$Res>  {
  factory $MessageDtoCopyWith(MessageDto value, $Res Function(MessageDto) _then) = _$MessageDtoCopyWithImpl;
@useResult
$Res call({
 int id, int type, String title, String? description, String createdAt, bool isRead, int? scheduleId
});




}
/// @nodoc
class _$MessageDtoCopyWithImpl<$Res>
    implements $MessageDtoCopyWith<$Res> {
  _$MessageDtoCopyWithImpl(this._self, this._then);

  final MessageDto _self;
  final $Res Function(MessageDto) _then;

/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = freezed,Object? createdAt = null,Object? isRead = null,Object? scheduleId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageDto].
extension MessageDtoPatterns on MessageDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageDto value)  $default,){
final _that = this;
switch (_that) {
case _MessageDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int type,  String title,  String? description,  String createdAt,  bool isRead,  int? scheduleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.createdAt,_that.isRead,_that.scheduleId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int type,  String title,  String? description,  String createdAt,  bool isRead,  int? scheduleId)  $default,) {final _that = this;
switch (_that) {
case _MessageDto():
return $default(_that.id,_that.type,_that.title,_that.description,_that.createdAt,_that.isRead,_that.scheduleId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int type,  String title,  String? description,  String createdAt,  bool isRead,  int? scheduleId)?  $default,) {final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.createdAt,_that.isRead,_that.scheduleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageDto implements MessageDto {
  const _MessageDto({required this.id, required this.type, required this.title, this.description, required this.createdAt, this.isRead = false, this.scheduleId});
  factory _MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);

/// Unique message identifier.
@override final  int id;
/// 1 = Info, 2 = PlanPush.
@override final  int type;
/// Short title displayed in the list.
@override final  String title;
/// Optional long description shown in the detail sheet.
@override final  String? description;
/// ISO-8601 creation timestamp.
@override final  String createdAt;
/// Whether the employee has already opened this message.
@override@JsonKey() final  bool isRead;
/// The related schedule id for PlanPush messages; null for Info messages.
@override final  int? scheduleId;

/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageDtoCopyWith<_MessageDto> get copyWith => __$MessageDtoCopyWithImpl<_MessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,createdAt,isRead,scheduleId);

@override
String toString() {
  return 'MessageDto(id: $id, type: $type, title: $title, description: $description, createdAt: $createdAt, isRead: $isRead, scheduleId: $scheduleId)';
}


}

/// @nodoc
abstract mixin class _$MessageDtoCopyWith<$Res> implements $MessageDtoCopyWith<$Res> {
  factory _$MessageDtoCopyWith(_MessageDto value, $Res Function(_MessageDto) _then) = __$MessageDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int type, String title, String? description, String createdAt, bool isRead, int? scheduleId
});




}
/// @nodoc
class __$MessageDtoCopyWithImpl<$Res>
    implements _$MessageDtoCopyWith<$Res> {
  __$MessageDtoCopyWithImpl(this._self, this._then);

  final _MessageDto _self;
  final $Res Function(_MessageDto) _then;

/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = freezed,Object? createdAt = null,Object? isRead = null,Object? scheduleId = freezed,}) {
  return _then(_MessageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MessagesResponseDto {

 List<MessageDto> get messages;
/// Create a copy of MessagesResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesResponseDtoCopyWith<MessagesResponseDto> get copyWith => _$MessagesResponseDtoCopyWithImpl<MessagesResponseDto>(this as MessagesResponseDto, _$identity);

  /// Serializes this MessagesResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesResponseDto&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'MessagesResponseDto(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $MessagesResponseDtoCopyWith<$Res>  {
  factory $MessagesResponseDtoCopyWith(MessagesResponseDto value, $Res Function(MessagesResponseDto) _then) = _$MessagesResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<MessageDto> messages
});




}
/// @nodoc
class _$MessagesResponseDtoCopyWithImpl<$Res>
    implements $MessagesResponseDtoCopyWith<$Res> {
  _$MessagesResponseDtoCopyWithImpl(this._self, this._then);

  final MessagesResponseDto _self;
  final $Res Function(MessagesResponseDto) _then;

/// Create a copy of MessagesResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagesResponseDto].
extension MessagesResponseDtoPatterns on MessagesResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MessagesResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MessageDto> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesResponseDto() when $default != null:
return $default(_that.messages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MessageDto> messages)  $default,) {final _that = this;
switch (_that) {
case _MessagesResponseDto():
return $default(_that.messages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MessageDto> messages)?  $default,) {final _that = this;
switch (_that) {
case _MessagesResponseDto() when $default != null:
return $default(_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagesResponseDto implements MessagesResponseDto {
  const _MessagesResponseDto({final  List<MessageDto> messages = const []}): _messages = messages;
  factory _MessagesResponseDto.fromJson(Map<String, dynamic> json) => _$MessagesResponseDtoFromJson(json);

 final  List<MessageDto> _messages;
@override@JsonKey() List<MessageDto> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of MessagesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesResponseDtoCopyWith<_MessagesResponseDto> get copyWith => __$MessagesResponseDtoCopyWithImpl<_MessagesResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagesResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesResponseDto&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'MessagesResponseDto(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$MessagesResponseDtoCopyWith<$Res> implements $MessagesResponseDtoCopyWith<$Res> {
  factory _$MessagesResponseDtoCopyWith(_MessagesResponseDto value, $Res Function(_MessagesResponseDto) _then) = __$MessagesResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MessageDto> messages
});




}
/// @nodoc
class __$MessagesResponseDtoCopyWithImpl<$Res>
    implements _$MessagesResponseDtoCopyWith<$Res> {
  __$MessagesResponseDtoCopyWithImpl(this._self, this._then);

  final _MessagesResponseDto _self;
  final $Res Function(_MessagesResponseDto) _then;

/// Create a copy of MessagesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_MessagesResponseDto(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageDto>,
  ));
}


}

// dart format on
