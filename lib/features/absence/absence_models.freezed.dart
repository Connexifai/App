// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absence_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbsencePresenceSettingDto {

 int? get id; String get name; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; Map<String, dynamic>? get requestFrom; Map<String, dynamic>? get requestTill; bool get remarkRequired;
/// Create a copy of AbsencePresenceSettingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbsencePresenceSettingDtoCopyWith<AbsencePresenceSettingDto> get copyWith => _$AbsencePresenceSettingDtoCopyWithImpl<AbsencePresenceSettingDto>(this as AbsencePresenceSettingDto, _$identity);

  /// Serializes this AbsencePresenceSettingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbsencePresenceSettingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&const DeepCollectionEquality().equals(other.requestFrom, requestFrom)&&const DeepCollectionEquality().equals(other.requestTill, requestTill)&&(identical(other.remarkRequired, remarkRequired) || other.remarkRequired == remarkRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),const DeepCollectionEquality().hash(requestFrom),const DeepCollectionEquality().hash(requestTill),remarkRequired);

@override
String toString() {
  return 'AbsencePresenceSettingDto(id: $id, name: $name, startTime: $startTime, endTime: $endTime, requestFrom: $requestFrom, requestTill: $requestTill, remarkRequired: $remarkRequired)';
}


}

/// @nodoc
abstract mixin class $AbsencePresenceSettingDtoCopyWith<$Res>  {
  factory $AbsencePresenceSettingDtoCopyWith(AbsencePresenceSettingDto value, $Res Function(AbsencePresenceSettingDto) _then) = _$AbsencePresenceSettingDtoCopyWithImpl;
@useResult
$Res call({
 int? id, String name, Map<String, dynamic> startTime, Map<String, dynamic> endTime, Map<String, dynamic>? requestFrom, Map<String, dynamic>? requestTill, bool remarkRequired
});




}
/// @nodoc
class _$AbsencePresenceSettingDtoCopyWithImpl<$Res>
    implements $AbsencePresenceSettingDtoCopyWith<$Res> {
  _$AbsencePresenceSettingDtoCopyWithImpl(this._self, this._then);

  final AbsencePresenceSettingDto _self;
  final $Res Function(AbsencePresenceSettingDto) _then;

/// Create a copy of AbsencePresenceSettingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? startTime = null,Object? endTime = null,Object? requestFrom = freezed,Object? requestTill = freezed,Object? remarkRequired = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestFrom: freezed == requestFrom ? _self.requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,requestTill: freezed == requestTill ? _self.requestTill : requestTill // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,remarkRequired: null == remarkRequired ? _self.remarkRequired : remarkRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AbsencePresenceSettingDto].
extension AbsencePresenceSettingDtoPatterns on AbsencePresenceSettingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbsencePresenceSettingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbsencePresenceSettingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbsencePresenceSettingDto value)  $default,){
final _that = this;
switch (_that) {
case _AbsencePresenceSettingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbsencePresenceSettingDto value)?  $default,){
final _that = this;
switch (_that) {
case _AbsencePresenceSettingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic>? requestFrom,  Map<String, dynamic>? requestTill,  bool remarkRequired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbsencePresenceSettingDto() when $default != null:
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.requestFrom,_that.requestTill,_that.remarkRequired);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic>? requestFrom,  Map<String, dynamic>? requestTill,  bool remarkRequired)  $default,) {final _that = this;
switch (_that) {
case _AbsencePresenceSettingDto():
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.requestFrom,_that.requestTill,_that.remarkRequired);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic>? requestFrom,  Map<String, dynamic>? requestTill,  bool remarkRequired)?  $default,) {final _that = this;
switch (_that) {
case _AbsencePresenceSettingDto() when $default != null:
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.requestFrom,_that.requestTill,_that.remarkRequired);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbsencePresenceSettingDto implements AbsencePresenceSettingDto {
  const _AbsencePresenceSettingDto({this.id, required this.name, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, final  Map<String, dynamic>? requestFrom, final  Map<String, dynamic>? requestTill, required this.remarkRequired}): _startTime = startTime,_endTime = endTime,_requestFrom = requestFrom,_requestTill = requestTill;
  factory _AbsencePresenceSettingDto.fromJson(Map<String, dynamic> json) => _$AbsencePresenceSettingDtoFromJson(json);

@override final  int? id;
@override final  String name;
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

 final  Map<String, dynamic>? _requestFrom;
@override Map<String, dynamic>? get requestFrom {
  final value = _requestFrom;
  if (value == null) return null;
  if (_requestFrom is EqualUnmodifiableMapView) return _requestFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _requestTill;
@override Map<String, dynamic>? get requestTill {
  final value = _requestTill;
  if (value == null) return null;
  if (_requestTill is EqualUnmodifiableMapView) return _requestTill;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  bool remarkRequired;

/// Create a copy of AbsencePresenceSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbsencePresenceSettingDtoCopyWith<_AbsencePresenceSettingDto> get copyWith => __$AbsencePresenceSettingDtoCopyWithImpl<_AbsencePresenceSettingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbsencePresenceSettingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbsencePresenceSettingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&const DeepCollectionEquality().equals(other._requestFrom, _requestFrom)&&const DeepCollectionEquality().equals(other._requestTill, _requestTill)&&(identical(other.remarkRequired, remarkRequired) || other.remarkRequired == remarkRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),const DeepCollectionEquality().hash(_requestFrom),const DeepCollectionEquality().hash(_requestTill),remarkRequired);

@override
String toString() {
  return 'AbsencePresenceSettingDto(id: $id, name: $name, startTime: $startTime, endTime: $endTime, requestFrom: $requestFrom, requestTill: $requestTill, remarkRequired: $remarkRequired)';
}


}

/// @nodoc
abstract mixin class _$AbsencePresenceSettingDtoCopyWith<$Res> implements $AbsencePresenceSettingDtoCopyWith<$Res> {
  factory _$AbsencePresenceSettingDtoCopyWith(_AbsencePresenceSettingDto value, $Res Function(_AbsencePresenceSettingDto) _then) = __$AbsencePresenceSettingDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, Map<String, dynamic> startTime, Map<String, dynamic> endTime, Map<String, dynamic>? requestFrom, Map<String, dynamic>? requestTill, bool remarkRequired
});




}
/// @nodoc
class __$AbsencePresenceSettingDtoCopyWithImpl<$Res>
    implements _$AbsencePresenceSettingDtoCopyWith<$Res> {
  __$AbsencePresenceSettingDtoCopyWithImpl(this._self, this._then);

  final _AbsencePresenceSettingDto _self;
  final $Res Function(_AbsencePresenceSettingDto) _then;

/// Create a copy of AbsencePresenceSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? startTime = null,Object? endTime = null,Object? requestFrom = freezed,Object? requestTill = freezed,Object? remarkRequired = null,}) {
  return _then(_AbsencePresenceSettingDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestFrom: freezed == requestFrom ? _self._requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,requestTill: freezed == requestTill ? _self._requestTill : requestTill // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,remarkRequired: null == remarkRequired ? _self.remarkRequired : remarkRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AbsenceRequestDto {

 int? get id; Map<String, dynamic> get startDate; Map<String, dynamic> get endDate; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; String get remark;
/// Create a copy of AbsenceRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbsenceRequestDtoCopyWith<AbsenceRequestDto> get copyWith => _$AbsenceRequestDtoCopyWithImpl<AbsenceRequestDto>(this as AbsenceRequestDto, _$identity);

  /// Serializes this AbsenceRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbsenceRequestDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.startDate, startDate)&&const DeepCollectionEquality().equals(other.endDate, endDate)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(startDate),const DeepCollectionEquality().hash(endDate),const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),remark);

@override
String toString() {
  return 'AbsenceRequestDto(id: $id, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $AbsenceRequestDtoCopyWith<$Res>  {
  factory $AbsenceRequestDtoCopyWith(AbsenceRequestDto value, $Res Function(AbsenceRequestDto) _then) = _$AbsenceRequestDtoCopyWithImpl;
@useResult
$Res call({
 int? id, Map<String, dynamic> startDate, Map<String, dynamic> endDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String remark
});




}
/// @nodoc
class _$AbsenceRequestDtoCopyWithImpl<$Res>
    implements $AbsenceRequestDtoCopyWith<$Res> {
  _$AbsenceRequestDtoCopyWithImpl(this._self, this._then);

  final AbsenceRequestDto _self;
  final $Res Function(AbsenceRequestDto) _then;

/// Create a copy of AbsenceRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? startTime = null,Object? endTime = null,Object? remark = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AbsenceRequestDto].
extension AbsenceRequestDtoPatterns on AbsenceRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbsenceRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbsenceRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbsenceRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AbsenceRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbsenceRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AbsenceRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  Map<String, dynamic> startDate,  Map<String, dynamic> endDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbsenceRequestDto() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.startTime,_that.endTime,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  Map<String, dynamic> startDate,  Map<String, dynamic> endDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String remark)  $default,) {final _that = this;
switch (_that) {
case _AbsenceRequestDto():
return $default(_that.id,_that.startDate,_that.endDate,_that.startTime,_that.endTime,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  Map<String, dynamic> startDate,  Map<String, dynamic> endDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String remark)?  $default,) {final _that = this;
switch (_that) {
case _AbsenceRequestDto() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.startTime,_that.endTime,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbsenceRequestDto implements AbsenceRequestDto {
  const _AbsenceRequestDto({this.id, required final  Map<String, dynamic> startDate, required final  Map<String, dynamic> endDate, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, required this.remark}): _startDate = startDate,_endDate = endDate,_startTime = startTime,_endTime = endTime;
  factory _AbsenceRequestDto.fromJson(Map<String, dynamic> json) => _$AbsenceRequestDtoFromJson(json);

@override final  int? id;
 final  Map<String, dynamic> _startDate;
@override Map<String, dynamic> get startDate {
  if (_startDate is EqualUnmodifiableMapView) return _startDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_startDate);
}

 final  Map<String, dynamic> _endDate;
@override Map<String, dynamic> get endDate {
  if (_endDate is EqualUnmodifiableMapView) return _endDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_endDate);
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

@override final  String remark;

/// Create a copy of AbsenceRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbsenceRequestDtoCopyWith<_AbsenceRequestDto> get copyWith => __$AbsenceRequestDtoCopyWithImpl<_AbsenceRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbsenceRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbsenceRequestDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._startDate, _startDate)&&const DeepCollectionEquality().equals(other._endDate, _endDate)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_startDate),const DeepCollectionEquality().hash(_endDate),const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),remark);

@override
String toString() {
  return 'AbsenceRequestDto(id: $id, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$AbsenceRequestDtoCopyWith<$Res> implements $AbsenceRequestDtoCopyWith<$Res> {
  factory _$AbsenceRequestDtoCopyWith(_AbsenceRequestDto value, $Res Function(_AbsenceRequestDto) _then) = __$AbsenceRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, Map<String, dynamic> startDate, Map<String, dynamic> endDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String remark
});




}
/// @nodoc
class __$AbsenceRequestDtoCopyWithImpl<$Res>
    implements _$AbsenceRequestDtoCopyWith<$Res> {
  __$AbsenceRequestDtoCopyWithImpl(this._self, this._then);

  final _AbsenceRequestDto _self;
  final $Res Function(_AbsenceRequestDto) _then;

/// Create a copy of AbsenceRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? startTime = null,Object? endTime = null,Object? remark = null,}) {
  return _then(_AbsenceRequestDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startDate: null == startDate ? _self._startDate : startDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endDate: null == endDate ? _self._endDate : endDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AbsenceResponseDto {

 int? get id; Map<String, dynamic> get startDate; Map<String, dynamic> get endDate; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; String get name; int? get color; String? get employeeRemark; String? get plannerRemark; int? get statusId;
/// Create a copy of AbsenceResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbsenceResponseDtoCopyWith<AbsenceResponseDto> get copyWith => _$AbsenceResponseDtoCopyWithImpl<AbsenceResponseDto>(this as AbsenceResponseDto, _$identity);

  /// Serializes this AbsenceResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbsenceResponseDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.startDate, startDate)&&const DeepCollectionEquality().equals(other.endDate, endDate)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.employeeRemark, employeeRemark) || other.employeeRemark == employeeRemark)&&(identical(other.plannerRemark, plannerRemark) || other.plannerRemark == plannerRemark)&&(identical(other.statusId, statusId) || other.statusId == statusId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(startDate),const DeepCollectionEquality().hash(endDate),const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),name,color,employeeRemark,plannerRemark,statusId);

@override
String toString() {
  return 'AbsenceResponseDto(id: $id, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, name: $name, color: $color, employeeRemark: $employeeRemark, plannerRemark: $plannerRemark, statusId: $statusId)';
}


}

/// @nodoc
abstract mixin class $AbsenceResponseDtoCopyWith<$Res>  {
  factory $AbsenceResponseDtoCopyWith(AbsenceResponseDto value, $Res Function(AbsenceResponseDto) _then) = _$AbsenceResponseDtoCopyWithImpl;
@useResult
$Res call({
 int? id, Map<String, dynamic> startDate, Map<String, dynamic> endDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String name, int? color, String? employeeRemark, String? plannerRemark, int? statusId
});




}
/// @nodoc
class _$AbsenceResponseDtoCopyWithImpl<$Res>
    implements $AbsenceResponseDtoCopyWith<$Res> {
  _$AbsenceResponseDtoCopyWithImpl(this._self, this._then);

  final AbsenceResponseDto _self;
  final $Res Function(AbsenceResponseDto) _then;

/// Create a copy of AbsenceResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? startTime = null,Object? endTime = null,Object? name = null,Object? color = freezed,Object? employeeRemark = freezed,Object? plannerRemark = freezed,Object? statusId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int?,employeeRemark: freezed == employeeRemark ? _self.employeeRemark : employeeRemark // ignore: cast_nullable_to_non_nullable
as String?,plannerRemark: freezed == plannerRemark ? _self.plannerRemark : plannerRemark // ignore: cast_nullable_to_non_nullable
as String?,statusId: freezed == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AbsenceResponseDto].
extension AbsenceResponseDtoPatterns on AbsenceResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbsenceResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbsenceResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbsenceResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AbsenceResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbsenceResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AbsenceResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  Map<String, dynamic> startDate,  Map<String, dynamic> endDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name,  int? color,  String? employeeRemark,  String? plannerRemark,  int? statusId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbsenceResponseDto() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.startTime,_that.endTime,_that.name,_that.color,_that.employeeRemark,_that.plannerRemark,_that.statusId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  Map<String, dynamic> startDate,  Map<String, dynamic> endDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name,  int? color,  String? employeeRemark,  String? plannerRemark,  int? statusId)  $default,) {final _that = this;
switch (_that) {
case _AbsenceResponseDto():
return $default(_that.id,_that.startDate,_that.endDate,_that.startTime,_that.endTime,_that.name,_that.color,_that.employeeRemark,_that.plannerRemark,_that.statusId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  Map<String, dynamic> startDate,  Map<String, dynamic> endDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String name,  int? color,  String? employeeRemark,  String? plannerRemark,  int? statusId)?  $default,) {final _that = this;
switch (_that) {
case _AbsenceResponseDto() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.startTime,_that.endTime,_that.name,_that.color,_that.employeeRemark,_that.plannerRemark,_that.statusId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbsenceResponseDto implements AbsenceResponseDto {
  const _AbsenceResponseDto({this.id, required final  Map<String, dynamic> startDate, required final  Map<String, dynamic> endDate, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, required this.name, this.color, this.employeeRemark, this.plannerRemark, this.statusId}): _startDate = startDate,_endDate = endDate,_startTime = startTime,_endTime = endTime;
  factory _AbsenceResponseDto.fromJson(Map<String, dynamic> json) => _$AbsenceResponseDtoFromJson(json);

@override final  int? id;
 final  Map<String, dynamic> _startDate;
@override Map<String, dynamic> get startDate {
  if (_startDate is EqualUnmodifiableMapView) return _startDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_startDate);
}

 final  Map<String, dynamic> _endDate;
@override Map<String, dynamic> get endDate {
  if (_endDate is EqualUnmodifiableMapView) return _endDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_endDate);
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
@override final  int? color;
@override final  String? employeeRemark;
@override final  String? plannerRemark;
@override final  int? statusId;

/// Create a copy of AbsenceResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbsenceResponseDtoCopyWith<_AbsenceResponseDto> get copyWith => __$AbsenceResponseDtoCopyWithImpl<_AbsenceResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbsenceResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbsenceResponseDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._startDate, _startDate)&&const DeepCollectionEquality().equals(other._endDate, _endDate)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.employeeRemark, employeeRemark) || other.employeeRemark == employeeRemark)&&(identical(other.plannerRemark, plannerRemark) || other.plannerRemark == plannerRemark)&&(identical(other.statusId, statusId) || other.statusId == statusId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_startDate),const DeepCollectionEquality().hash(_endDate),const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),name,color,employeeRemark,plannerRemark,statusId);

@override
String toString() {
  return 'AbsenceResponseDto(id: $id, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, name: $name, color: $color, employeeRemark: $employeeRemark, plannerRemark: $plannerRemark, statusId: $statusId)';
}


}

/// @nodoc
abstract mixin class _$AbsenceResponseDtoCopyWith<$Res> implements $AbsenceResponseDtoCopyWith<$Res> {
  factory _$AbsenceResponseDtoCopyWith(_AbsenceResponseDto value, $Res Function(_AbsenceResponseDto) _then) = __$AbsenceResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, Map<String, dynamic> startDate, Map<String, dynamic> endDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String name, int? color, String? employeeRemark, String? plannerRemark, int? statusId
});




}
/// @nodoc
class __$AbsenceResponseDtoCopyWithImpl<$Res>
    implements _$AbsenceResponseDtoCopyWith<$Res> {
  __$AbsenceResponseDtoCopyWithImpl(this._self, this._then);

  final _AbsenceResponseDto _self;
  final $Res Function(_AbsenceResponseDto) _then;

/// Create a copy of AbsenceResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? startTime = null,Object? endTime = null,Object? name = null,Object? color = freezed,Object? employeeRemark = freezed,Object? plannerRemark = freezed,Object? statusId = freezed,}) {
  return _then(_AbsenceResponseDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startDate: null == startDate ? _self._startDate : startDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endDate: null == endDate ? _self._endDate : endDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int?,employeeRemark: freezed == employeeRemark ? _self.employeeRemark : employeeRemark // ignore: cast_nullable_to_non_nullable
as String?,plannerRemark: freezed == plannerRemark ? _self.plannerRemark : plannerRemark // ignore: cast_nullable_to_non_nullable
as String?,statusId: freezed == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
