// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarDto {

 List<Map<String, dynamic>> get schedules; List<Map<String, dynamic>> get absences; List<Map<String, dynamic>> get availabilities; List<Map<String, dynamic>> get requestedAbsences;
/// Create a copy of CalendarDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarDtoCopyWith<CalendarDto> get copyWith => _$CalendarDtoCopyWithImpl<CalendarDto>(this as CalendarDto, _$identity);

  /// Serializes this CalendarDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarDto&&const DeepCollectionEquality().equals(other.schedules, schedules)&&const DeepCollectionEquality().equals(other.absences, absences)&&const DeepCollectionEquality().equals(other.availabilities, availabilities)&&const DeepCollectionEquality().equals(other.requestedAbsences, requestedAbsences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schedules),const DeepCollectionEquality().hash(absences),const DeepCollectionEquality().hash(availabilities),const DeepCollectionEquality().hash(requestedAbsences));

@override
String toString() {
  return 'CalendarDto(schedules: $schedules, absences: $absences, availabilities: $availabilities, requestedAbsences: $requestedAbsences)';
}


}

/// @nodoc
abstract mixin class $CalendarDtoCopyWith<$Res>  {
  factory $CalendarDtoCopyWith(CalendarDto value, $Res Function(CalendarDto) _then) = _$CalendarDtoCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> schedules, List<Map<String, dynamic>> absences, List<Map<String, dynamic>> availabilities, List<Map<String, dynamic>> requestedAbsences
});




}
/// @nodoc
class _$CalendarDtoCopyWithImpl<$Res>
    implements $CalendarDtoCopyWith<$Res> {
  _$CalendarDtoCopyWithImpl(this._self, this._then);

  final CalendarDto _self;
  final $Res Function(CalendarDto) _then;

/// Create a copy of CalendarDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedules = null,Object? absences = null,Object? availabilities = null,Object? requestedAbsences = null,}) {
  return _then(_self.copyWith(
schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,absences: null == absences ? _self.absences : absences // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,availabilities: null == availabilities ? _self.availabilities : availabilities // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,requestedAbsences: null == requestedAbsences ? _self.requestedAbsences : requestedAbsences // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarDto].
extension CalendarDtoPatterns on CalendarDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarDto value)  $default,){
final _that = this;
switch (_that) {
case _CalendarDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> schedules,  List<Map<String, dynamic>> absences,  List<Map<String, dynamic>> availabilities,  List<Map<String, dynamic>> requestedAbsences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarDto() when $default != null:
return $default(_that.schedules,_that.absences,_that.availabilities,_that.requestedAbsences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> schedules,  List<Map<String, dynamic>> absences,  List<Map<String, dynamic>> availabilities,  List<Map<String, dynamic>> requestedAbsences)  $default,) {final _that = this;
switch (_that) {
case _CalendarDto():
return $default(_that.schedules,_that.absences,_that.availabilities,_that.requestedAbsences);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> schedules,  List<Map<String, dynamic>> absences,  List<Map<String, dynamic>> availabilities,  List<Map<String, dynamic>> requestedAbsences)?  $default,) {final _that = this;
switch (_that) {
case _CalendarDto() when $default != null:
return $default(_that.schedules,_that.absences,_that.availabilities,_that.requestedAbsences);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarDto implements CalendarDto {
  const _CalendarDto({final  List<Map<String, dynamic>> schedules = const [], final  List<Map<String, dynamic>> absences = const [], final  List<Map<String, dynamic>> availabilities = const [], final  List<Map<String, dynamic>> requestedAbsences = const []}): _schedules = schedules,_absences = absences,_availabilities = availabilities,_requestedAbsences = requestedAbsences;
  factory _CalendarDto.fromJson(Map<String, dynamic> json) => _$CalendarDtoFromJson(json);

 final  List<Map<String, dynamic>> _schedules;
@override@JsonKey() List<Map<String, dynamic>> get schedules {
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedules);
}

 final  List<Map<String, dynamic>> _absences;
@override@JsonKey() List<Map<String, dynamic>> get absences {
  if (_absences is EqualUnmodifiableListView) return _absences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_absences);
}

 final  List<Map<String, dynamic>> _availabilities;
@override@JsonKey() List<Map<String, dynamic>> get availabilities {
  if (_availabilities is EqualUnmodifiableListView) return _availabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availabilities);
}

 final  List<Map<String, dynamic>> _requestedAbsences;
@override@JsonKey() List<Map<String, dynamic>> get requestedAbsences {
  if (_requestedAbsences is EqualUnmodifiableListView) return _requestedAbsences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requestedAbsences);
}


/// Create a copy of CalendarDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarDtoCopyWith<_CalendarDto> get copyWith => __$CalendarDtoCopyWithImpl<_CalendarDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarDto&&const DeepCollectionEquality().equals(other._schedules, _schedules)&&const DeepCollectionEquality().equals(other._absences, _absences)&&const DeepCollectionEquality().equals(other._availabilities, _availabilities)&&const DeepCollectionEquality().equals(other._requestedAbsences, _requestedAbsences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schedules),const DeepCollectionEquality().hash(_absences),const DeepCollectionEquality().hash(_availabilities),const DeepCollectionEquality().hash(_requestedAbsences));

@override
String toString() {
  return 'CalendarDto(schedules: $schedules, absences: $absences, availabilities: $availabilities, requestedAbsences: $requestedAbsences)';
}


}

/// @nodoc
abstract mixin class _$CalendarDtoCopyWith<$Res> implements $CalendarDtoCopyWith<$Res> {
  factory _$CalendarDtoCopyWith(_CalendarDto value, $Res Function(_CalendarDto) _then) = __$CalendarDtoCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> schedules, List<Map<String, dynamic>> absences, List<Map<String, dynamic>> availabilities, List<Map<String, dynamic>> requestedAbsences
});




}
/// @nodoc
class __$CalendarDtoCopyWithImpl<$Res>
    implements _$CalendarDtoCopyWith<$Res> {
  __$CalendarDtoCopyWithImpl(this._self, this._then);

  final _CalendarDto _self;
  final $Res Function(_CalendarDto) _then;

/// Create a copy of CalendarDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedules = null,Object? absences = null,Object? availabilities = null,Object? requestedAbsences = null,}) {
  return _then(_CalendarDto(
schedules: null == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,absences: null == absences ? _self._absences : absences // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,availabilities: null == availabilities ? _self._availabilities : availabilities // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,requestedAbsences: null == requestedAbsences ? _self._requestedAbsences : requestedAbsences // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc
mixin _$CalendarEvent {

 int get id; CalendarEventType get type; String get title; DateTime get date; String? get startTime; String? get endTime; String? get clientName; String? get departmentName; String? get statusLabel; Map<String, dynamic>? get raw;
/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarEventCopyWith<CalendarEvent> get copyWith => _$CalendarEventCopyWithImpl<CalendarEvent>(this as CalendarEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&const DeepCollectionEquality().equals(other.raw, raw));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,title,date,startTime,endTime,clientName,departmentName,statusLabel,const DeepCollectionEquality().hash(raw));

@override
String toString() {
  return 'CalendarEvent(id: $id, type: $type, title: $title, date: $date, startTime: $startTime, endTime: $endTime, clientName: $clientName, departmentName: $departmentName, statusLabel: $statusLabel, raw: $raw)';
}


}

/// @nodoc
abstract mixin class $CalendarEventCopyWith<$Res>  {
  factory $CalendarEventCopyWith(CalendarEvent value, $Res Function(CalendarEvent) _then) = _$CalendarEventCopyWithImpl;
@useResult
$Res call({
 int id, CalendarEventType type, String title, DateTime date, String? startTime, String? endTime, String? clientName, String? departmentName, String? statusLabel, Map<String, dynamic>? raw
});




}
/// @nodoc
class _$CalendarEventCopyWithImpl<$Res>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._self, this._then);

  final CalendarEvent _self;
  final $Res Function(CalendarEvent) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? date = null,Object? startTime = freezed,Object? endTime = freezed,Object? clientName = freezed,Object? departmentName = freezed,Object? statusLabel = freezed,Object? raw = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CalendarEventType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,raw: freezed == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarEvent].
extension CalendarEventPatterns on CalendarEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarEvent value)  $default,){
final _that = this;
switch (_that) {
case _CalendarEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarEvent value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CalendarEventType type,  String title,  DateTime date,  String? startTime,  String? endTime,  String? clientName,  String? departmentName,  String? statusLabel,  Map<String, dynamic>? raw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarEvent() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.date,_that.startTime,_that.endTime,_that.clientName,_that.departmentName,_that.statusLabel,_that.raw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CalendarEventType type,  String title,  DateTime date,  String? startTime,  String? endTime,  String? clientName,  String? departmentName,  String? statusLabel,  Map<String, dynamic>? raw)  $default,) {final _that = this;
switch (_that) {
case _CalendarEvent():
return $default(_that.id,_that.type,_that.title,_that.date,_that.startTime,_that.endTime,_that.clientName,_that.departmentName,_that.statusLabel,_that.raw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CalendarEventType type,  String title,  DateTime date,  String? startTime,  String? endTime,  String? clientName,  String? departmentName,  String? statusLabel,  Map<String, dynamic>? raw)?  $default,) {final _that = this;
switch (_that) {
case _CalendarEvent() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.date,_that.startTime,_that.endTime,_that.clientName,_that.departmentName,_that.statusLabel,_that.raw);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarEvent implements CalendarEvent {
  const _CalendarEvent({required this.id, required this.type, required this.title, required this.date, this.startTime, this.endTime, this.clientName, this.departmentName, this.statusLabel, final  Map<String, dynamic>? raw}): _raw = raw;
  

@override final  int id;
@override final  CalendarEventType type;
@override final  String title;
@override final  DateTime date;
@override final  String? startTime;
@override final  String? endTime;
@override final  String? clientName;
@override final  String? departmentName;
@override final  String? statusLabel;
 final  Map<String, dynamic>? _raw;
@override Map<String, dynamic>? get raw {
  final value = _raw;
  if (value == null) return null;
  if (_raw is EqualUnmodifiableMapView) return _raw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarEventCopyWith<_CalendarEvent> get copyWith => __$CalendarEventCopyWithImpl<_CalendarEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&const DeepCollectionEquality().equals(other._raw, _raw));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,title,date,startTime,endTime,clientName,departmentName,statusLabel,const DeepCollectionEquality().hash(_raw));

@override
String toString() {
  return 'CalendarEvent(id: $id, type: $type, title: $title, date: $date, startTime: $startTime, endTime: $endTime, clientName: $clientName, departmentName: $departmentName, statusLabel: $statusLabel, raw: $raw)';
}


}

/// @nodoc
abstract mixin class _$CalendarEventCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$CalendarEventCopyWith(_CalendarEvent value, $Res Function(_CalendarEvent) _then) = __$CalendarEventCopyWithImpl;
@override @useResult
$Res call({
 int id, CalendarEventType type, String title, DateTime date, String? startTime, String? endTime, String? clientName, String? departmentName, String? statusLabel, Map<String, dynamic>? raw
});




}
/// @nodoc
class __$CalendarEventCopyWithImpl<$Res>
    implements _$CalendarEventCopyWith<$Res> {
  __$CalendarEventCopyWithImpl(this._self, this._then);

  final _CalendarEvent _self;
  final $Res Function(_CalendarEvent) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? date = null,Object? startTime = freezed,Object? endTime = freezed,Object? clientName = freezed,Object? departmentName = freezed,Object? statusLabel = freezed,Object? raw = freezed,}) {
  return _then(_CalendarEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CalendarEventType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,raw: freezed == raw ? _self._raw : raw // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
