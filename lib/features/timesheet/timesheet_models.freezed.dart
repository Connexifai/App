// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timesheet_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimesheetPeriodDto {

 Map<String, dynamic> get from; Map<String, dynamic> get till; bool get isSubmitted; List<TimesheetShiftDto> get shifts; List<TimesheetAbsenceDto> get absences;
/// Create a copy of TimesheetPeriodDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesheetPeriodDtoCopyWith<TimesheetPeriodDto> get copyWith => _$TimesheetPeriodDtoCopyWithImpl<TimesheetPeriodDto>(this as TimesheetPeriodDto, _$identity);

  /// Serializes this TimesheetPeriodDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesheetPeriodDto&&const DeepCollectionEquality().equals(other.from, from)&&const DeepCollectionEquality().equals(other.till, till)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted)&&const DeepCollectionEquality().equals(other.shifts, shifts)&&const DeepCollectionEquality().equals(other.absences, absences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(from),const DeepCollectionEquality().hash(till),isSubmitted,const DeepCollectionEquality().hash(shifts),const DeepCollectionEquality().hash(absences));

@override
String toString() {
  return 'TimesheetPeriodDto(from: $from, till: $till, isSubmitted: $isSubmitted, shifts: $shifts, absences: $absences)';
}


}

/// @nodoc
abstract mixin class $TimesheetPeriodDtoCopyWith<$Res>  {
  factory $TimesheetPeriodDtoCopyWith(TimesheetPeriodDto value, $Res Function(TimesheetPeriodDto) _then) = _$TimesheetPeriodDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> from, Map<String, dynamic> till, bool isSubmitted, List<TimesheetShiftDto> shifts, List<TimesheetAbsenceDto> absences
});




}
/// @nodoc
class _$TimesheetPeriodDtoCopyWithImpl<$Res>
    implements $TimesheetPeriodDtoCopyWith<$Res> {
  _$TimesheetPeriodDtoCopyWithImpl(this._self, this._then);

  final TimesheetPeriodDto _self;
  final $Res Function(TimesheetPeriodDto) _then;

/// Create a copy of TimesheetPeriodDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? till = null,Object? isSubmitted = null,Object? shifts = null,Object? absences = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,till: null == till ? _self.till : till // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<TimesheetShiftDto>,absences: null == absences ? _self.absences : absences // ignore: cast_nullable_to_non_nullable
as List<TimesheetAbsenceDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimesheetPeriodDto].
extension TimesheetPeriodDtoPatterns on TimesheetPeriodDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimesheetPeriodDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimesheetPeriodDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimesheetPeriodDto value)  $default,){
final _that = this;
switch (_that) {
case _TimesheetPeriodDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimesheetPeriodDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimesheetPeriodDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> from,  Map<String, dynamic> till,  bool isSubmitted,  List<TimesheetShiftDto> shifts,  List<TimesheetAbsenceDto> absences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimesheetPeriodDto() when $default != null:
return $default(_that.from,_that.till,_that.isSubmitted,_that.shifts,_that.absences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> from,  Map<String, dynamic> till,  bool isSubmitted,  List<TimesheetShiftDto> shifts,  List<TimesheetAbsenceDto> absences)  $default,) {final _that = this;
switch (_that) {
case _TimesheetPeriodDto():
return $default(_that.from,_that.till,_that.isSubmitted,_that.shifts,_that.absences);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> from,  Map<String, dynamic> till,  bool isSubmitted,  List<TimesheetShiftDto> shifts,  List<TimesheetAbsenceDto> absences)?  $default,) {final _that = this;
switch (_that) {
case _TimesheetPeriodDto() when $default != null:
return $default(_that.from,_that.till,_that.isSubmitted,_that.shifts,_that.absences);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimesheetPeriodDto implements TimesheetPeriodDto {
  const _TimesheetPeriodDto({required final  Map<String, dynamic> from, required final  Map<String, dynamic> till, required this.isSubmitted, required final  List<TimesheetShiftDto> shifts, required final  List<TimesheetAbsenceDto> absences}): _from = from,_till = till,_shifts = shifts,_absences = absences;
  factory _TimesheetPeriodDto.fromJson(Map<String, dynamic> json) => _$TimesheetPeriodDtoFromJson(json);

 final  Map<String, dynamic> _from;
@override Map<String, dynamic> get from {
  if (_from is EqualUnmodifiableMapView) return _from;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_from);
}

 final  Map<String, dynamic> _till;
@override Map<String, dynamic> get till {
  if (_till is EqualUnmodifiableMapView) return _till;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_till);
}

@override final  bool isSubmitted;
 final  List<TimesheetShiftDto> _shifts;
@override List<TimesheetShiftDto> get shifts {
  if (_shifts is EqualUnmodifiableListView) return _shifts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shifts);
}

 final  List<TimesheetAbsenceDto> _absences;
@override List<TimesheetAbsenceDto> get absences {
  if (_absences is EqualUnmodifiableListView) return _absences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_absences);
}


/// Create a copy of TimesheetPeriodDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimesheetPeriodDtoCopyWith<_TimesheetPeriodDto> get copyWith => __$TimesheetPeriodDtoCopyWithImpl<_TimesheetPeriodDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesheetPeriodDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimesheetPeriodDto&&const DeepCollectionEquality().equals(other._from, _from)&&const DeepCollectionEquality().equals(other._till, _till)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted)&&const DeepCollectionEquality().equals(other._shifts, _shifts)&&const DeepCollectionEquality().equals(other._absences, _absences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_from),const DeepCollectionEquality().hash(_till),isSubmitted,const DeepCollectionEquality().hash(_shifts),const DeepCollectionEquality().hash(_absences));

@override
String toString() {
  return 'TimesheetPeriodDto(from: $from, till: $till, isSubmitted: $isSubmitted, shifts: $shifts, absences: $absences)';
}


}

/// @nodoc
abstract mixin class _$TimesheetPeriodDtoCopyWith<$Res> implements $TimesheetPeriodDtoCopyWith<$Res> {
  factory _$TimesheetPeriodDtoCopyWith(_TimesheetPeriodDto value, $Res Function(_TimesheetPeriodDto) _then) = __$TimesheetPeriodDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> from, Map<String, dynamic> till, bool isSubmitted, List<TimesheetShiftDto> shifts, List<TimesheetAbsenceDto> absences
});




}
/// @nodoc
class __$TimesheetPeriodDtoCopyWithImpl<$Res>
    implements _$TimesheetPeriodDtoCopyWith<$Res> {
  __$TimesheetPeriodDtoCopyWithImpl(this._self, this._then);

  final _TimesheetPeriodDto _self;
  final $Res Function(_TimesheetPeriodDto) _then;

/// Create a copy of TimesheetPeriodDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? till = null,Object? isSubmitted = null,Object? shifts = null,Object? absences = null,}) {
  return _then(_TimesheetPeriodDto(
from: null == from ? _self._from : from // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,till: null == till ? _self._till : till // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,shifts: null == shifts ? _self._shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<TimesheetShiftDto>,absences: null == absences ? _self._absences : absences // ignore: cast_nullable_to_non_nullable
as List<TimesheetAbsenceDto>,
  ));
}


}


/// @nodoc
mixin _$TimesheetShiftDto {

 int get id; Map<String, dynamic> get scheduleDate; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; String get name; String? get clientName; Map<String, dynamic>? get actualStartTime; Map<String, dynamic>? get actualEndTime; bool get isSubmitted;
/// Create a copy of TimesheetShiftDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesheetShiftDtoCopyWith<TimesheetShiftDto> get copyWith => _$TimesheetShiftDtoCopyWithImpl<TimesheetShiftDto>(this as TimesheetShiftDto, _$identity);

  /// Serializes this TimesheetShiftDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesheetShiftDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.scheduleDate, scheduleDate)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&(identical(other.name, name) || other.name == name)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&const DeepCollectionEquality().equals(other.actualStartTime, actualStartTime)&&const DeepCollectionEquality().equals(other.actualEndTime, actualEndTime)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(scheduleDate),const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),name,clientName,const DeepCollectionEquality().hash(actualStartTime),const DeepCollectionEquality().hash(actualEndTime),isSubmitted);

@override
String toString() {
  return 'TimesheetShiftDto(id: $id, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, name: $name, clientName: $clientName, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, isSubmitted: $isSubmitted)';
}


}

/// @nodoc
abstract mixin class $TimesheetShiftDtoCopyWith<$Res>  {
  factory $TimesheetShiftDtoCopyWith(TimesheetShiftDto value, $Res Function(TimesheetShiftDto) _then) = _$TimesheetShiftDtoCopyWithImpl;
@useResult
$Res call({
 int id, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String name, String? clientName, Map<String, dynamic>? actualStartTime, Map<String, dynamic>? actualEndTime, bool isSubmitted
});




}
/// @nodoc
class _$TimesheetShiftDtoCopyWithImpl<$Res>
    implements $TimesheetShiftDtoCopyWith<$Res> {
  _$TimesheetShiftDtoCopyWithImpl(this._self, this._then);

  final TimesheetShiftDto _self;
  final $Res Function(TimesheetShiftDto) _then;

/// Create a copy of TimesheetShiftDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? name = null,Object? clientName = freezed,Object? actualStartTime = freezed,Object? actualEndTime = freezed,Object? isSubmitted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,scheduleDate: null == scheduleDate ? _self.scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,actualStartTime: freezed == actualStartTime ? _self.actualStartTime : actualStartTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,actualEndTime: freezed == actualEndTime ? _self.actualEndTime : actualEndTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TimesheetShiftDto].
extension TimesheetShiftDtoPatterns on TimesheetShiftDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimesheetShiftDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimesheetShiftDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimesheetShiftDto value)  $default,){
final _that = this;
switch (_that) {
case _TimesheetShiftDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimesheetShiftDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimesheetShiftDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name,  String? clientName,  Map<String, dynamic>? actualStartTime,  Map<String, dynamic>? actualEndTime,  bool isSubmitted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimesheetShiftDto() when $default != null:
return $default(_that.id,_that.scheduleDate,_that.startTime,_that.endTime,_that.name,_that.clientName,_that.actualStartTime,_that.actualEndTime,_that.isSubmitted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name,  String? clientName,  Map<String, dynamic>? actualStartTime,  Map<String, dynamic>? actualEndTime,  bool isSubmitted)  $default,) {final _that = this;
switch (_that) {
case _TimesheetShiftDto():
return $default(_that.id,_that.scheduleDate,_that.startTime,_that.endTime,_that.name,_that.clientName,_that.actualStartTime,_that.actualEndTime,_that.isSubmitted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name,  String? clientName,  Map<String, dynamic>? actualStartTime,  Map<String, dynamic>? actualEndTime,  bool isSubmitted)?  $default,) {final _that = this;
switch (_that) {
case _TimesheetShiftDto() when $default != null:
return $default(_that.id,_that.scheduleDate,_that.startTime,_that.endTime,_that.name,_that.clientName,_that.actualStartTime,_that.actualEndTime,_that.isSubmitted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimesheetShiftDto implements TimesheetShiftDto {
  const _TimesheetShiftDto({required this.id, required final  Map<String, dynamic> scheduleDate, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, required this.name, this.clientName, final  Map<String, dynamic>? actualStartTime, final  Map<String, dynamic>? actualEndTime, required this.isSubmitted}): _scheduleDate = scheduleDate,_startTime = startTime,_endTime = endTime,_actualStartTime = actualStartTime,_actualEndTime = actualEndTime;
  factory _TimesheetShiftDto.fromJson(Map<String, dynamic> json) => _$TimesheetShiftDtoFromJson(json);

@override final  int id;
 final  Map<String, dynamic> _scheduleDate;
@override Map<String, dynamic> get scheduleDate {
  if (_scheduleDate is EqualUnmodifiableMapView) return _scheduleDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scheduleDate);
}

 final  Map<String, dynamic> _startTime;
@override Map<String, dynamic> get startTime {
  if (_startTime is EqualUnmodifiableMapView) return _startTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_startTime);
}

 final  Map<String, dynamic> _endTime;
@override Map<String, dynamic> get endTime {
  if (_endTime is EqualUnmodifiableMapView) return _endTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_endTime);
}

@override final  String name;
@override final  String? clientName;
 final  Map<String, dynamic>? _actualStartTime;
@override Map<String, dynamic>? get actualStartTime {
  final value = _actualStartTime;
  if (value == null) return null;
  if (_actualStartTime is EqualUnmodifiableMapView) return _actualStartTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _actualEndTime;
@override Map<String, dynamic>? get actualEndTime {
  final value = _actualEndTime;
  if (value == null) return null;
  if (_actualEndTime is EqualUnmodifiableMapView) return _actualEndTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  bool isSubmitted;

/// Create a copy of TimesheetShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimesheetShiftDtoCopyWith<_TimesheetShiftDto> get copyWith => __$TimesheetShiftDtoCopyWithImpl<_TimesheetShiftDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesheetShiftDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimesheetShiftDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._scheduleDate, _scheduleDate)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&(identical(other.name, name) || other.name == name)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&const DeepCollectionEquality().equals(other._actualStartTime, _actualStartTime)&&const DeepCollectionEquality().equals(other._actualEndTime, _actualEndTime)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_scheduleDate),const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),name,clientName,const DeepCollectionEquality().hash(_actualStartTime),const DeepCollectionEquality().hash(_actualEndTime),isSubmitted);

@override
String toString() {
  return 'TimesheetShiftDto(id: $id, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, name: $name, clientName: $clientName, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, isSubmitted: $isSubmitted)';
}


}

/// @nodoc
abstract mixin class _$TimesheetShiftDtoCopyWith<$Res> implements $TimesheetShiftDtoCopyWith<$Res> {
  factory _$TimesheetShiftDtoCopyWith(_TimesheetShiftDto value, $Res Function(_TimesheetShiftDto) _then) = __$TimesheetShiftDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String name, String? clientName, Map<String, dynamic>? actualStartTime, Map<String, dynamic>? actualEndTime, bool isSubmitted
});




}
/// @nodoc
class __$TimesheetShiftDtoCopyWithImpl<$Res>
    implements _$TimesheetShiftDtoCopyWith<$Res> {
  __$TimesheetShiftDtoCopyWithImpl(this._self, this._then);

  final _TimesheetShiftDto _self;
  final $Res Function(_TimesheetShiftDto) _then;

/// Create a copy of TimesheetShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? name = null,Object? clientName = freezed,Object? actualStartTime = freezed,Object? actualEndTime = freezed,Object? isSubmitted = null,}) {
  return _then(_TimesheetShiftDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,scheduleDate: null == scheduleDate ? _self._scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,actualStartTime: freezed == actualStartTime ? _self._actualStartTime : actualStartTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,actualEndTime: freezed == actualEndTime ? _self._actualEndTime : actualEndTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TimesheetAbsenceDto {

 int get id; Map<String, dynamic> get scheduleDate; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; String get name;
/// Create a copy of TimesheetAbsenceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesheetAbsenceDtoCopyWith<TimesheetAbsenceDto> get copyWith => _$TimesheetAbsenceDtoCopyWithImpl<TimesheetAbsenceDto>(this as TimesheetAbsenceDto, _$identity);

  /// Serializes this TimesheetAbsenceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesheetAbsenceDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.scheduleDate, scheduleDate)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(scheduleDate),const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),name);

@override
String toString() {
  return 'TimesheetAbsenceDto(id: $id, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, name: $name)';
}


}

/// @nodoc
abstract mixin class $TimesheetAbsenceDtoCopyWith<$Res>  {
  factory $TimesheetAbsenceDtoCopyWith(TimesheetAbsenceDto value, $Res Function(TimesheetAbsenceDto) _then) = _$TimesheetAbsenceDtoCopyWithImpl;
@useResult
$Res call({
 int id, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String name
});




}
/// @nodoc
class _$TimesheetAbsenceDtoCopyWithImpl<$Res>
    implements $TimesheetAbsenceDtoCopyWith<$Res> {
  _$TimesheetAbsenceDtoCopyWithImpl(this._self, this._then);

  final TimesheetAbsenceDto _self;
  final $Res Function(TimesheetAbsenceDto) _then;

/// Create a copy of TimesheetAbsenceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,scheduleDate: null == scheduleDate ? _self.scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimesheetAbsenceDto].
extension TimesheetAbsenceDtoPatterns on TimesheetAbsenceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimesheetAbsenceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimesheetAbsenceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimesheetAbsenceDto value)  $default,){
final _that = this;
switch (_that) {
case _TimesheetAbsenceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimesheetAbsenceDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimesheetAbsenceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimesheetAbsenceDto() when $default != null:
return $default(_that.id,_that.scheduleDate,_that.startTime,_that.endTime,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name)  $default,) {final _that = this;
switch (_that) {
case _TimesheetAbsenceDto():
return $default(_that.id,_that.scheduleDate,_that.startTime,_that.endTime,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TimesheetAbsenceDto() when $default != null:
return $default(_that.id,_that.scheduleDate,_that.startTime,_that.endTime,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimesheetAbsenceDto implements TimesheetAbsenceDto {
  const _TimesheetAbsenceDto({required this.id, required final  Map<String, dynamic> scheduleDate, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, required this.name}): _scheduleDate = scheduleDate,_startTime = startTime,_endTime = endTime;
  factory _TimesheetAbsenceDto.fromJson(Map<String, dynamic> json) => _$TimesheetAbsenceDtoFromJson(json);

@override final  int id;
 final  Map<String, dynamic> _scheduleDate;
@override Map<String, dynamic> get scheduleDate {
  if (_scheduleDate is EqualUnmodifiableMapView) return _scheduleDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scheduleDate);
}

 final  Map<String, dynamic> _startTime;
@override Map<String, dynamic> get startTime {
  if (_startTime is EqualUnmodifiableMapView) return _startTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_startTime);
}

 final  Map<String, dynamic> _endTime;
@override Map<String, dynamic> get endTime {
  if (_endTime is EqualUnmodifiableMapView) return _endTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_endTime);
}

@override final  String name;

/// Create a copy of TimesheetAbsenceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimesheetAbsenceDtoCopyWith<_TimesheetAbsenceDto> get copyWith => __$TimesheetAbsenceDtoCopyWithImpl<_TimesheetAbsenceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesheetAbsenceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimesheetAbsenceDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._scheduleDate, _scheduleDate)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_scheduleDate),const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),name);

@override
String toString() {
  return 'TimesheetAbsenceDto(id: $id, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TimesheetAbsenceDtoCopyWith<$Res> implements $TimesheetAbsenceDtoCopyWith<$Res> {
  factory _$TimesheetAbsenceDtoCopyWith(_TimesheetAbsenceDto value, $Res Function(_TimesheetAbsenceDto) _then) = __$TimesheetAbsenceDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String name
});




}
/// @nodoc
class __$TimesheetAbsenceDtoCopyWithImpl<$Res>
    implements _$TimesheetAbsenceDtoCopyWith<$Res> {
  __$TimesheetAbsenceDtoCopyWithImpl(this._self, this._then);

  final _TimesheetAbsenceDto _self;
  final $Res Function(_TimesheetAbsenceDto) _then;

/// Create a copy of TimesheetAbsenceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? name = null,}) {
  return _then(_TimesheetAbsenceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,scheduleDate: null == scheduleDate ? _self._scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TimesheetSubmitRequestDto {

 int? get scheduleId; int? get absenceId; Map<String, dynamic> get actualStartTime; Map<String, dynamic> get actualEndTime; String? get remark;
/// Create a copy of TimesheetSubmitRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesheetSubmitRequestDtoCopyWith<TimesheetSubmitRequestDto> get copyWith => _$TimesheetSubmitRequestDtoCopyWithImpl<TimesheetSubmitRequestDto>(this as TimesheetSubmitRequestDto, _$identity);

  /// Serializes this TimesheetSubmitRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesheetSubmitRequestDto&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.absenceId, absenceId) || other.absenceId == absenceId)&&const DeepCollectionEquality().equals(other.actualStartTime, actualStartTime)&&const DeepCollectionEquality().equals(other.actualEndTime, actualEndTime)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduleId,absenceId,const DeepCollectionEquality().hash(actualStartTime),const DeepCollectionEquality().hash(actualEndTime),remark);

@override
String toString() {
  return 'TimesheetSubmitRequestDto(scheduleId: $scheduleId, absenceId: $absenceId, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $TimesheetSubmitRequestDtoCopyWith<$Res>  {
  factory $TimesheetSubmitRequestDtoCopyWith(TimesheetSubmitRequestDto value, $Res Function(TimesheetSubmitRequestDto) _then) = _$TimesheetSubmitRequestDtoCopyWithImpl;
@useResult
$Res call({
 int? scheduleId, int? absenceId, Map<String, dynamic> actualStartTime, Map<String, dynamic> actualEndTime, String? remark
});




}
/// @nodoc
class _$TimesheetSubmitRequestDtoCopyWithImpl<$Res>
    implements $TimesheetSubmitRequestDtoCopyWith<$Res> {
  _$TimesheetSubmitRequestDtoCopyWithImpl(this._self, this._then);

  final TimesheetSubmitRequestDto _self;
  final $Res Function(TimesheetSubmitRequestDto) _then;

/// Create a copy of TimesheetSubmitRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scheduleId = freezed,Object? absenceId = freezed,Object? actualStartTime = null,Object? actualEndTime = null,Object? remark = freezed,}) {
  return _then(_self.copyWith(
scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,absenceId: freezed == absenceId ? _self.absenceId : absenceId // ignore: cast_nullable_to_non_nullable
as int?,actualStartTime: null == actualStartTime ? _self.actualStartTime : actualStartTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,actualEndTime: null == actualEndTime ? _self.actualEndTime : actualEndTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimesheetSubmitRequestDto].
extension TimesheetSubmitRequestDtoPatterns on TimesheetSubmitRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimesheetSubmitRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimesheetSubmitRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimesheetSubmitRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _TimesheetSubmitRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimesheetSubmitRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimesheetSubmitRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? scheduleId,  int? absenceId,  Map<String, dynamic> actualStartTime,  Map<String, dynamic> actualEndTime,  String? remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimesheetSubmitRequestDto() when $default != null:
return $default(_that.scheduleId,_that.absenceId,_that.actualStartTime,_that.actualEndTime,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? scheduleId,  int? absenceId,  Map<String, dynamic> actualStartTime,  Map<String, dynamic> actualEndTime,  String? remark)  $default,) {final _that = this;
switch (_that) {
case _TimesheetSubmitRequestDto():
return $default(_that.scheduleId,_that.absenceId,_that.actualStartTime,_that.actualEndTime,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? scheduleId,  int? absenceId,  Map<String, dynamic> actualStartTime,  Map<String, dynamic> actualEndTime,  String? remark)?  $default,) {final _that = this;
switch (_that) {
case _TimesheetSubmitRequestDto() when $default != null:
return $default(_that.scheduleId,_that.absenceId,_that.actualStartTime,_that.actualEndTime,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimesheetSubmitRequestDto implements TimesheetSubmitRequestDto {
  const _TimesheetSubmitRequestDto({this.scheduleId, this.absenceId, required final  Map<String, dynamic> actualStartTime, required final  Map<String, dynamic> actualEndTime, this.remark}): _actualStartTime = actualStartTime,_actualEndTime = actualEndTime;
  factory _TimesheetSubmitRequestDto.fromJson(Map<String, dynamic> json) => _$TimesheetSubmitRequestDtoFromJson(json);

@override final  int? scheduleId;
@override final  int? absenceId;
 final  Map<String, dynamic> _actualStartTime;
@override Map<String, dynamic> get actualStartTime {
  if (_actualStartTime is EqualUnmodifiableMapView) return _actualStartTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_actualStartTime);
}

 final  Map<String, dynamic> _actualEndTime;
@override Map<String, dynamic> get actualEndTime {
  if (_actualEndTime is EqualUnmodifiableMapView) return _actualEndTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_actualEndTime);
}

@override final  String? remark;

/// Create a copy of TimesheetSubmitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimesheetSubmitRequestDtoCopyWith<_TimesheetSubmitRequestDto> get copyWith => __$TimesheetSubmitRequestDtoCopyWithImpl<_TimesheetSubmitRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesheetSubmitRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimesheetSubmitRequestDto&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId)&&(identical(other.absenceId, absenceId) || other.absenceId == absenceId)&&const DeepCollectionEquality().equals(other._actualStartTime, _actualStartTime)&&const DeepCollectionEquality().equals(other._actualEndTime, _actualEndTime)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduleId,absenceId,const DeepCollectionEquality().hash(_actualStartTime),const DeepCollectionEquality().hash(_actualEndTime),remark);

@override
String toString() {
  return 'TimesheetSubmitRequestDto(scheduleId: $scheduleId, absenceId: $absenceId, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$TimesheetSubmitRequestDtoCopyWith<$Res> implements $TimesheetSubmitRequestDtoCopyWith<$Res> {
  factory _$TimesheetSubmitRequestDtoCopyWith(_TimesheetSubmitRequestDto value, $Res Function(_TimesheetSubmitRequestDto) _then) = __$TimesheetSubmitRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int? scheduleId, int? absenceId, Map<String, dynamic> actualStartTime, Map<String, dynamic> actualEndTime, String? remark
});




}
/// @nodoc
class __$TimesheetSubmitRequestDtoCopyWithImpl<$Res>
    implements _$TimesheetSubmitRequestDtoCopyWith<$Res> {
  __$TimesheetSubmitRequestDtoCopyWithImpl(this._self, this._then);

  final _TimesheetSubmitRequestDto _self;
  final $Res Function(_TimesheetSubmitRequestDto) _then;

/// Create a copy of TimesheetSubmitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scheduleId = freezed,Object? absenceId = freezed,Object? actualStartTime = null,Object? actualEndTime = null,Object? remark = freezed,}) {
  return _then(_TimesheetSubmitRequestDto(
scheduleId: freezed == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int?,absenceId: freezed == absenceId ? _self.absenceId : absenceId // ignore: cast_nullable_to_non_nullable
as int?,actualStartTime: null == actualStartTime ? _self._actualStartTime : actualStartTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,actualEndTime: null == actualEndTime ? _self._actualEndTime : actualEndTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
