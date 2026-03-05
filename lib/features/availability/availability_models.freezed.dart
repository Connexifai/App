// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailabilitySettingsDto {

 bool get canAdjustAvailability; List<AvailabilityBasicSettingDto> get availabilities; List<AvailabilityBlockSettingDto> get availabilityBlocks;
/// Create a copy of AvailabilitySettingsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilitySettingsDtoCopyWith<AvailabilitySettingsDto> get copyWith => _$AvailabilitySettingsDtoCopyWithImpl<AvailabilitySettingsDto>(this as AvailabilitySettingsDto, _$identity);

  /// Serializes this AvailabilitySettingsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilitySettingsDto&&(identical(other.canAdjustAvailability, canAdjustAvailability) || other.canAdjustAvailability == canAdjustAvailability)&&const DeepCollectionEquality().equals(other.availabilities, availabilities)&&const DeepCollectionEquality().equals(other.availabilityBlocks, availabilityBlocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canAdjustAvailability,const DeepCollectionEquality().hash(availabilities),const DeepCollectionEquality().hash(availabilityBlocks));

@override
String toString() {
  return 'AvailabilitySettingsDto(canAdjustAvailability: $canAdjustAvailability, availabilities: $availabilities, availabilityBlocks: $availabilityBlocks)';
}


}

/// @nodoc
abstract mixin class $AvailabilitySettingsDtoCopyWith<$Res>  {
  factory $AvailabilitySettingsDtoCopyWith(AvailabilitySettingsDto value, $Res Function(AvailabilitySettingsDto) _then) = _$AvailabilitySettingsDtoCopyWithImpl;
@useResult
$Res call({
 bool canAdjustAvailability, List<AvailabilityBasicSettingDto> availabilities, List<AvailabilityBlockSettingDto> availabilityBlocks
});




}
/// @nodoc
class _$AvailabilitySettingsDtoCopyWithImpl<$Res>
    implements $AvailabilitySettingsDtoCopyWith<$Res> {
  _$AvailabilitySettingsDtoCopyWithImpl(this._self, this._then);

  final AvailabilitySettingsDto _self;
  final $Res Function(AvailabilitySettingsDto) _then;

/// Create a copy of AvailabilitySettingsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canAdjustAvailability = null,Object? availabilities = null,Object? availabilityBlocks = null,}) {
  return _then(_self.copyWith(
canAdjustAvailability: null == canAdjustAvailability ? _self.canAdjustAvailability : canAdjustAvailability // ignore: cast_nullable_to_non_nullable
as bool,availabilities: null == availabilities ? _self.availabilities : availabilities // ignore: cast_nullable_to_non_nullable
as List<AvailabilityBasicSettingDto>,availabilityBlocks: null == availabilityBlocks ? _self.availabilityBlocks : availabilityBlocks // ignore: cast_nullable_to_non_nullable
as List<AvailabilityBlockSettingDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilitySettingsDto].
extension AvailabilitySettingsDtoPatterns on AvailabilitySettingsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilitySettingsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilitySettingsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilitySettingsDto value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySettingsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilitySettingsDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySettingsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canAdjustAvailability,  List<AvailabilityBasicSettingDto> availabilities,  List<AvailabilityBlockSettingDto> availabilityBlocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilitySettingsDto() when $default != null:
return $default(_that.canAdjustAvailability,_that.availabilities,_that.availabilityBlocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canAdjustAvailability,  List<AvailabilityBasicSettingDto> availabilities,  List<AvailabilityBlockSettingDto> availabilityBlocks)  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySettingsDto():
return $default(_that.canAdjustAvailability,_that.availabilities,_that.availabilityBlocks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canAdjustAvailability,  List<AvailabilityBasicSettingDto> availabilities,  List<AvailabilityBlockSettingDto> availabilityBlocks)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySettingsDto() when $default != null:
return $default(_that.canAdjustAvailability,_that.availabilities,_that.availabilityBlocks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilitySettingsDto implements AvailabilitySettingsDto {
  const _AvailabilitySettingsDto({required this.canAdjustAvailability, required final  List<AvailabilityBasicSettingDto> availabilities, required final  List<AvailabilityBlockSettingDto> availabilityBlocks}): _availabilities = availabilities,_availabilityBlocks = availabilityBlocks;
  factory _AvailabilitySettingsDto.fromJson(Map<String, dynamic> json) => _$AvailabilitySettingsDtoFromJson(json);

@override final  bool canAdjustAvailability;
 final  List<AvailabilityBasicSettingDto> _availabilities;
@override List<AvailabilityBasicSettingDto> get availabilities {
  if (_availabilities is EqualUnmodifiableListView) return _availabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availabilities);
}

 final  List<AvailabilityBlockSettingDto> _availabilityBlocks;
@override List<AvailabilityBlockSettingDto> get availabilityBlocks {
  if (_availabilityBlocks is EqualUnmodifiableListView) return _availabilityBlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availabilityBlocks);
}


/// Create a copy of AvailabilitySettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilitySettingsDtoCopyWith<_AvailabilitySettingsDto> get copyWith => __$AvailabilitySettingsDtoCopyWithImpl<_AvailabilitySettingsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilitySettingsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilitySettingsDto&&(identical(other.canAdjustAvailability, canAdjustAvailability) || other.canAdjustAvailability == canAdjustAvailability)&&const DeepCollectionEquality().equals(other._availabilities, _availabilities)&&const DeepCollectionEquality().equals(other._availabilityBlocks, _availabilityBlocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canAdjustAvailability,const DeepCollectionEquality().hash(_availabilities),const DeepCollectionEquality().hash(_availabilityBlocks));

@override
String toString() {
  return 'AvailabilitySettingsDto(canAdjustAvailability: $canAdjustAvailability, availabilities: $availabilities, availabilityBlocks: $availabilityBlocks)';
}


}

/// @nodoc
abstract mixin class _$AvailabilitySettingsDtoCopyWith<$Res> implements $AvailabilitySettingsDtoCopyWith<$Res> {
  factory _$AvailabilitySettingsDtoCopyWith(_AvailabilitySettingsDto value, $Res Function(_AvailabilitySettingsDto) _then) = __$AvailabilitySettingsDtoCopyWithImpl;
@override @useResult
$Res call({
 bool canAdjustAvailability, List<AvailabilityBasicSettingDto> availabilities, List<AvailabilityBlockSettingDto> availabilityBlocks
});




}
/// @nodoc
class __$AvailabilitySettingsDtoCopyWithImpl<$Res>
    implements _$AvailabilitySettingsDtoCopyWith<$Res> {
  __$AvailabilitySettingsDtoCopyWithImpl(this._self, this._then);

  final _AvailabilitySettingsDto _self;
  final $Res Function(_AvailabilitySettingsDto) _then;

/// Create a copy of AvailabilitySettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canAdjustAvailability = null,Object? availabilities = null,Object? availabilityBlocks = null,}) {
  return _then(_AvailabilitySettingsDto(
canAdjustAvailability: null == canAdjustAvailability ? _self.canAdjustAvailability : canAdjustAvailability // ignore: cast_nullable_to_non_nullable
as bool,availabilities: null == availabilities ? _self._availabilities : availabilities // ignore: cast_nullable_to_non_nullable
as List<AvailabilityBasicSettingDto>,availabilityBlocks: null == availabilityBlocks ? _self._availabilityBlocks : availabilityBlocks // ignore: cast_nullable_to_non_nullable
as List<AvailabilityBlockSettingDto>,
  ));
}


}


/// @nodoc
mixin _$AvailabilityBasicSettingDto {

 int? get id; Map<String, dynamic> get requestFrom; Map<String, dynamic> get requestUntil;
/// Create a copy of AvailabilityBasicSettingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilityBasicSettingDtoCopyWith<AvailabilityBasicSettingDto> get copyWith => _$AvailabilityBasicSettingDtoCopyWithImpl<AvailabilityBasicSettingDto>(this as AvailabilityBasicSettingDto, _$identity);

  /// Serializes this AvailabilityBasicSettingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilityBasicSettingDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.requestFrom, requestFrom)&&const DeepCollectionEquality().equals(other.requestUntil, requestUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(requestFrom),const DeepCollectionEquality().hash(requestUntil));

@override
String toString() {
  return 'AvailabilityBasicSettingDto(id: $id, requestFrom: $requestFrom, requestUntil: $requestUntil)';
}


}

/// @nodoc
abstract mixin class $AvailabilityBasicSettingDtoCopyWith<$Res>  {
  factory $AvailabilityBasicSettingDtoCopyWith(AvailabilityBasicSettingDto value, $Res Function(AvailabilityBasicSettingDto) _then) = _$AvailabilityBasicSettingDtoCopyWithImpl;
@useResult
$Res call({
 int? id, Map<String, dynamic> requestFrom, Map<String, dynamic> requestUntil
});




}
/// @nodoc
class _$AvailabilityBasicSettingDtoCopyWithImpl<$Res>
    implements $AvailabilityBasicSettingDtoCopyWith<$Res> {
  _$AvailabilityBasicSettingDtoCopyWithImpl(this._self, this._then);

  final AvailabilityBasicSettingDto _self;
  final $Res Function(AvailabilityBasicSettingDto) _then;

/// Create a copy of AvailabilityBasicSettingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? requestFrom = null,Object? requestUntil = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,requestFrom: null == requestFrom ? _self.requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestUntil: null == requestUntil ? _self.requestUntil : requestUntil // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilityBasicSettingDto].
extension AvailabilityBasicSettingDtoPatterns on AvailabilityBasicSettingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilityBasicSettingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilityBasicSettingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilityBasicSettingDto value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilityBasicSettingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilityBasicSettingDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilityBasicSettingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  Map<String, dynamic> requestFrom,  Map<String, dynamic> requestUntil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilityBasicSettingDto() when $default != null:
return $default(_that.id,_that.requestFrom,_that.requestUntil);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  Map<String, dynamic> requestFrom,  Map<String, dynamic> requestUntil)  $default,) {final _that = this;
switch (_that) {
case _AvailabilityBasicSettingDto():
return $default(_that.id,_that.requestFrom,_that.requestUntil);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  Map<String, dynamic> requestFrom,  Map<String, dynamic> requestUntil)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilityBasicSettingDto() when $default != null:
return $default(_that.id,_that.requestFrom,_that.requestUntil);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilityBasicSettingDto implements AvailabilityBasicSettingDto {
  const _AvailabilityBasicSettingDto({this.id, required final  Map<String, dynamic> requestFrom, required final  Map<String, dynamic> requestUntil}): _requestFrom = requestFrom,_requestUntil = requestUntil;
  factory _AvailabilityBasicSettingDto.fromJson(Map<String, dynamic> json) => _$AvailabilityBasicSettingDtoFromJson(json);

@override final  int? id;
 final  Map<String, dynamic> _requestFrom;
@override Map<String, dynamic> get requestFrom {
  if (_requestFrom is EqualUnmodifiableMapView) return _requestFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_requestFrom);
}

 final  Map<String, dynamic> _requestUntil;
@override Map<String, dynamic> get requestUntil {
  if (_requestUntil is EqualUnmodifiableMapView) return _requestUntil;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_requestUntil);
}


/// Create a copy of AvailabilityBasicSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilityBasicSettingDtoCopyWith<_AvailabilityBasicSettingDto> get copyWith => __$AvailabilityBasicSettingDtoCopyWithImpl<_AvailabilityBasicSettingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilityBasicSettingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilityBasicSettingDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._requestFrom, _requestFrom)&&const DeepCollectionEquality().equals(other._requestUntil, _requestUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_requestFrom),const DeepCollectionEquality().hash(_requestUntil));

@override
String toString() {
  return 'AvailabilityBasicSettingDto(id: $id, requestFrom: $requestFrom, requestUntil: $requestUntil)';
}


}

/// @nodoc
abstract mixin class _$AvailabilityBasicSettingDtoCopyWith<$Res> implements $AvailabilityBasicSettingDtoCopyWith<$Res> {
  factory _$AvailabilityBasicSettingDtoCopyWith(_AvailabilityBasicSettingDto value, $Res Function(_AvailabilityBasicSettingDto) _then) = __$AvailabilityBasicSettingDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, Map<String, dynamic> requestFrom, Map<String, dynamic> requestUntil
});




}
/// @nodoc
class __$AvailabilityBasicSettingDtoCopyWithImpl<$Res>
    implements _$AvailabilityBasicSettingDtoCopyWith<$Res> {
  __$AvailabilityBasicSettingDtoCopyWithImpl(this._self, this._then);

  final _AvailabilityBasicSettingDto _self;
  final $Res Function(_AvailabilityBasicSettingDto) _then;

/// Create a copy of AvailabilityBasicSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? requestFrom = null,Object? requestUntil = null,}) {
  return _then(_AvailabilityBasicSettingDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,requestFrom: null == requestFrom ? _self._requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestUntil: null == requestUntil ? _self._requestUntil : requestUntil // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$AvailabilityBlockSettingDto {

 int? get id; int? get availabilityId; String get name; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; Map<String, dynamic> get requestFrom; Map<String, dynamic> get requestUntil;
/// Create a copy of AvailabilityBlockSettingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilityBlockSettingDtoCopyWith<AvailabilityBlockSettingDto> get copyWith => _$AvailabilityBlockSettingDtoCopyWithImpl<AvailabilityBlockSettingDto>(this as AvailabilityBlockSettingDto, _$identity);

  /// Serializes this AvailabilityBlockSettingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilityBlockSettingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.availabilityId, availabilityId) || other.availabilityId == availabilityId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&const DeepCollectionEquality().equals(other.requestFrom, requestFrom)&&const DeepCollectionEquality().equals(other.requestUntil, requestUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,availabilityId,name,const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),const DeepCollectionEquality().hash(requestFrom),const DeepCollectionEquality().hash(requestUntil));

@override
String toString() {
  return 'AvailabilityBlockSettingDto(id: $id, availabilityId: $availabilityId, name: $name, startTime: $startTime, endTime: $endTime, requestFrom: $requestFrom, requestUntil: $requestUntil)';
}


}

/// @nodoc
abstract mixin class $AvailabilityBlockSettingDtoCopyWith<$Res>  {
  factory $AvailabilityBlockSettingDtoCopyWith(AvailabilityBlockSettingDto value, $Res Function(AvailabilityBlockSettingDto) _then) = _$AvailabilityBlockSettingDtoCopyWithImpl;
@useResult
$Res call({
 int? id, int? availabilityId, String name, Map<String, dynamic> startTime, Map<String, dynamic> endTime, Map<String, dynamic> requestFrom, Map<String, dynamic> requestUntil
});




}
/// @nodoc
class _$AvailabilityBlockSettingDtoCopyWithImpl<$Res>
    implements $AvailabilityBlockSettingDtoCopyWith<$Res> {
  _$AvailabilityBlockSettingDtoCopyWithImpl(this._self, this._then);

  final AvailabilityBlockSettingDto _self;
  final $Res Function(AvailabilityBlockSettingDto) _then;

/// Create a copy of AvailabilityBlockSettingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? availabilityId = freezed,Object? name = null,Object? startTime = null,Object? endTime = null,Object? requestFrom = null,Object? requestUntil = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,availabilityId: freezed == availabilityId ? _self.availabilityId : availabilityId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestFrom: null == requestFrom ? _self.requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestUntil: null == requestUntil ? _self.requestUntil : requestUntil // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilityBlockSettingDto].
extension AvailabilityBlockSettingDtoPatterns on AvailabilityBlockSettingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilityBlockSettingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilityBlockSettingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilityBlockSettingDto value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilityBlockSettingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilityBlockSettingDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilityBlockSettingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? availabilityId,  String name,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic> requestFrom,  Map<String, dynamic> requestUntil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilityBlockSettingDto() when $default != null:
return $default(_that.id,_that.availabilityId,_that.name,_that.startTime,_that.endTime,_that.requestFrom,_that.requestUntil);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? availabilityId,  String name,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic> requestFrom,  Map<String, dynamic> requestUntil)  $default,) {final _that = this;
switch (_that) {
case _AvailabilityBlockSettingDto():
return $default(_that.id,_that.availabilityId,_that.name,_that.startTime,_that.endTime,_that.requestFrom,_that.requestUntil);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? availabilityId,  String name,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic> requestFrom,  Map<String, dynamic> requestUntil)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilityBlockSettingDto() when $default != null:
return $default(_that.id,_that.availabilityId,_that.name,_that.startTime,_that.endTime,_that.requestFrom,_that.requestUntil);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilityBlockSettingDto implements AvailabilityBlockSettingDto {
  const _AvailabilityBlockSettingDto({this.id, this.availabilityId, required this.name, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, required final  Map<String, dynamic> requestFrom, required final  Map<String, dynamic> requestUntil}): _startTime = startTime,_endTime = endTime,_requestFrom = requestFrom,_requestUntil = requestUntil;
  factory _AvailabilityBlockSettingDto.fromJson(Map<String, dynamic> json) => _$AvailabilityBlockSettingDtoFromJson(json);

@override final  int? id;
@override final  int? availabilityId;
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

 final  Map<String, dynamic> _requestFrom;
@override Map<String, dynamic> get requestFrom {
  if (_requestFrom is EqualUnmodifiableMapView) return _requestFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_requestFrom);
}

 final  Map<String, dynamic> _requestUntil;
@override Map<String, dynamic> get requestUntil {
  if (_requestUntil is EqualUnmodifiableMapView) return _requestUntil;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_requestUntil);
}


/// Create a copy of AvailabilityBlockSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilityBlockSettingDtoCopyWith<_AvailabilityBlockSettingDto> get copyWith => __$AvailabilityBlockSettingDtoCopyWithImpl<_AvailabilityBlockSettingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilityBlockSettingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilityBlockSettingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.availabilityId, availabilityId) || other.availabilityId == availabilityId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&const DeepCollectionEquality().equals(other._requestFrom, _requestFrom)&&const DeepCollectionEquality().equals(other._requestUntil, _requestUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,availabilityId,name,const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),const DeepCollectionEquality().hash(_requestFrom),const DeepCollectionEquality().hash(_requestUntil));

@override
String toString() {
  return 'AvailabilityBlockSettingDto(id: $id, availabilityId: $availabilityId, name: $name, startTime: $startTime, endTime: $endTime, requestFrom: $requestFrom, requestUntil: $requestUntil)';
}


}

/// @nodoc
abstract mixin class _$AvailabilityBlockSettingDtoCopyWith<$Res> implements $AvailabilityBlockSettingDtoCopyWith<$Res> {
  factory _$AvailabilityBlockSettingDtoCopyWith(_AvailabilityBlockSettingDto value, $Res Function(_AvailabilityBlockSettingDto) _then) = __$AvailabilityBlockSettingDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? availabilityId, String name, Map<String, dynamic> startTime, Map<String, dynamic> endTime, Map<String, dynamic> requestFrom, Map<String, dynamic> requestUntil
});




}
/// @nodoc
class __$AvailabilityBlockSettingDtoCopyWithImpl<$Res>
    implements _$AvailabilityBlockSettingDtoCopyWith<$Res> {
  __$AvailabilityBlockSettingDtoCopyWithImpl(this._self, this._then);

  final _AvailabilityBlockSettingDto _self;
  final $Res Function(_AvailabilityBlockSettingDto) _then;

/// Create a copy of AvailabilityBlockSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? availabilityId = freezed,Object? name = null,Object? startTime = null,Object? endTime = null,Object? requestFrom = null,Object? requestUntil = null,}) {
  return _then(_AvailabilityBlockSettingDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,availabilityId: freezed == availabilityId ? _self.availabilityId : availabilityId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestFrom: null == requestFrom ? _self._requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestUntil: null == requestUntil ? _self._requestUntil : requestUntil // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$AvailabilityRequestDto {

 int? get availabilityId; int? get availabilityBlockId; Map<String, dynamic>? get startTime; Map<String, dynamic>? get endTime; Map<String, dynamic>? get requestFrom; Map<String, dynamic>? get requestUntil; List<Map<String, dynamic>>? get calendarDays; List<int>? get recurrenceDays; int? get recurrenceWeekInterval; String? get remark;
/// Create a copy of AvailabilityRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilityRequestDtoCopyWith<AvailabilityRequestDto> get copyWith => _$AvailabilityRequestDtoCopyWithImpl<AvailabilityRequestDto>(this as AvailabilityRequestDto, _$identity);

  /// Serializes this AvailabilityRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilityRequestDto&&(identical(other.availabilityId, availabilityId) || other.availabilityId == availabilityId)&&(identical(other.availabilityBlockId, availabilityBlockId) || other.availabilityBlockId == availabilityBlockId)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&const DeepCollectionEquality().equals(other.requestFrom, requestFrom)&&const DeepCollectionEquality().equals(other.requestUntil, requestUntil)&&const DeepCollectionEquality().equals(other.calendarDays, calendarDays)&&const DeepCollectionEquality().equals(other.recurrenceDays, recurrenceDays)&&(identical(other.recurrenceWeekInterval, recurrenceWeekInterval) || other.recurrenceWeekInterval == recurrenceWeekInterval)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,availabilityId,availabilityBlockId,const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),const DeepCollectionEquality().hash(requestFrom),const DeepCollectionEquality().hash(requestUntil),const DeepCollectionEquality().hash(calendarDays),const DeepCollectionEquality().hash(recurrenceDays),recurrenceWeekInterval,remark);

@override
String toString() {
  return 'AvailabilityRequestDto(availabilityId: $availabilityId, availabilityBlockId: $availabilityBlockId, startTime: $startTime, endTime: $endTime, requestFrom: $requestFrom, requestUntil: $requestUntil, calendarDays: $calendarDays, recurrenceDays: $recurrenceDays, recurrenceWeekInterval: $recurrenceWeekInterval, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $AvailabilityRequestDtoCopyWith<$Res>  {
  factory $AvailabilityRequestDtoCopyWith(AvailabilityRequestDto value, $Res Function(AvailabilityRequestDto) _then) = _$AvailabilityRequestDtoCopyWithImpl;
@useResult
$Res call({
 int? availabilityId, int? availabilityBlockId, Map<String, dynamic>? startTime, Map<String, dynamic>? endTime, Map<String, dynamic>? requestFrom, Map<String, dynamic>? requestUntil, List<Map<String, dynamic>>? calendarDays, List<int>? recurrenceDays, int? recurrenceWeekInterval, String? remark
});




}
/// @nodoc
class _$AvailabilityRequestDtoCopyWithImpl<$Res>
    implements $AvailabilityRequestDtoCopyWith<$Res> {
  _$AvailabilityRequestDtoCopyWithImpl(this._self, this._then);

  final AvailabilityRequestDto _self;
  final $Res Function(AvailabilityRequestDto) _then;

/// Create a copy of AvailabilityRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availabilityId = freezed,Object? availabilityBlockId = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? requestFrom = freezed,Object? requestUntil = freezed,Object? calendarDays = freezed,Object? recurrenceDays = freezed,Object? recurrenceWeekInterval = freezed,Object? remark = freezed,}) {
  return _then(_self.copyWith(
availabilityId: freezed == availabilityId ? _self.availabilityId : availabilityId // ignore: cast_nullable_to_non_nullable
as int?,availabilityBlockId: freezed == availabilityBlockId ? _self.availabilityBlockId : availabilityBlockId // ignore: cast_nullable_to_non_nullable
as int?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,requestFrom: freezed == requestFrom ? _self.requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,requestUntil: freezed == requestUntil ? _self.requestUntil : requestUntil // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,calendarDays: freezed == calendarDays ? _self.calendarDays : calendarDays // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,recurrenceDays: freezed == recurrenceDays ? _self.recurrenceDays : recurrenceDays // ignore: cast_nullable_to_non_nullable
as List<int>?,recurrenceWeekInterval: freezed == recurrenceWeekInterval ? _self.recurrenceWeekInterval : recurrenceWeekInterval // ignore: cast_nullable_to_non_nullable
as int?,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilityRequestDto].
extension AvailabilityRequestDtoPatterns on AvailabilityRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilityRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilityRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilityRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilityRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilityRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilityRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? availabilityId,  int? availabilityBlockId,  Map<String, dynamic>? startTime,  Map<String, dynamic>? endTime,  Map<String, dynamic>? requestFrom,  Map<String, dynamic>? requestUntil,  List<Map<String, dynamic>>? calendarDays,  List<int>? recurrenceDays,  int? recurrenceWeekInterval,  String? remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilityRequestDto() when $default != null:
return $default(_that.availabilityId,_that.availabilityBlockId,_that.startTime,_that.endTime,_that.requestFrom,_that.requestUntil,_that.calendarDays,_that.recurrenceDays,_that.recurrenceWeekInterval,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? availabilityId,  int? availabilityBlockId,  Map<String, dynamic>? startTime,  Map<String, dynamic>? endTime,  Map<String, dynamic>? requestFrom,  Map<String, dynamic>? requestUntil,  List<Map<String, dynamic>>? calendarDays,  List<int>? recurrenceDays,  int? recurrenceWeekInterval,  String? remark)  $default,) {final _that = this;
switch (_that) {
case _AvailabilityRequestDto():
return $default(_that.availabilityId,_that.availabilityBlockId,_that.startTime,_that.endTime,_that.requestFrom,_that.requestUntil,_that.calendarDays,_that.recurrenceDays,_that.recurrenceWeekInterval,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? availabilityId,  int? availabilityBlockId,  Map<String, dynamic>? startTime,  Map<String, dynamic>? endTime,  Map<String, dynamic>? requestFrom,  Map<String, dynamic>? requestUntil,  List<Map<String, dynamic>>? calendarDays,  List<int>? recurrenceDays,  int? recurrenceWeekInterval,  String? remark)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilityRequestDto() when $default != null:
return $default(_that.availabilityId,_that.availabilityBlockId,_that.startTime,_that.endTime,_that.requestFrom,_that.requestUntil,_that.calendarDays,_that.recurrenceDays,_that.recurrenceWeekInterval,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilityRequestDto implements AvailabilityRequestDto {
  const _AvailabilityRequestDto({this.availabilityId, this.availabilityBlockId, final  Map<String, dynamic>? startTime, final  Map<String, dynamic>? endTime, final  Map<String, dynamic>? requestFrom, final  Map<String, dynamic>? requestUntil, final  List<Map<String, dynamic>>? calendarDays, final  List<int>? recurrenceDays, this.recurrenceWeekInterval, this.remark}): _startTime = startTime,_endTime = endTime,_requestFrom = requestFrom,_requestUntil = requestUntil,_calendarDays = calendarDays,_recurrenceDays = recurrenceDays;
  factory _AvailabilityRequestDto.fromJson(Map<String, dynamic> json) => _$AvailabilityRequestDtoFromJson(json);

@override final  int? availabilityId;
@override final  int? availabilityBlockId;
 final  Map<String, dynamic>? _startTime;
@override Map<String, dynamic>? get startTime {
  final value = _startTime;
  if (value == null) return null;
  if (_startTime is EqualUnmodifiableMapView) return _startTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _endTime;
@override Map<String, dynamic>? get endTime {
  final value = _endTime;
  if (value == null) return null;
  if (_endTime is EqualUnmodifiableMapView) return _endTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _requestFrom;
@override Map<String, dynamic>? get requestFrom {
  final value = _requestFrom;
  if (value == null) return null;
  if (_requestFrom is EqualUnmodifiableMapView) return _requestFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _requestUntil;
@override Map<String, dynamic>? get requestUntil {
  final value = _requestUntil;
  if (value == null) return null;
  if (_requestUntil is EqualUnmodifiableMapView) return _requestUntil;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<Map<String, dynamic>>? _calendarDays;
@override List<Map<String, dynamic>>? get calendarDays {
  final value = _calendarDays;
  if (value == null) return null;
  if (_calendarDays is EqualUnmodifiableListView) return _calendarDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _recurrenceDays;
@override List<int>? get recurrenceDays {
  final value = _recurrenceDays;
  if (value == null) return null;
  if (_recurrenceDays is EqualUnmodifiableListView) return _recurrenceDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? recurrenceWeekInterval;
@override final  String? remark;

/// Create a copy of AvailabilityRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilityRequestDtoCopyWith<_AvailabilityRequestDto> get copyWith => __$AvailabilityRequestDtoCopyWithImpl<_AvailabilityRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilityRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilityRequestDto&&(identical(other.availabilityId, availabilityId) || other.availabilityId == availabilityId)&&(identical(other.availabilityBlockId, availabilityBlockId) || other.availabilityBlockId == availabilityBlockId)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&const DeepCollectionEquality().equals(other._requestFrom, _requestFrom)&&const DeepCollectionEquality().equals(other._requestUntil, _requestUntil)&&const DeepCollectionEquality().equals(other._calendarDays, _calendarDays)&&const DeepCollectionEquality().equals(other._recurrenceDays, _recurrenceDays)&&(identical(other.recurrenceWeekInterval, recurrenceWeekInterval) || other.recurrenceWeekInterval == recurrenceWeekInterval)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,availabilityId,availabilityBlockId,const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),const DeepCollectionEquality().hash(_requestFrom),const DeepCollectionEquality().hash(_requestUntil),const DeepCollectionEquality().hash(_calendarDays),const DeepCollectionEquality().hash(_recurrenceDays),recurrenceWeekInterval,remark);

@override
String toString() {
  return 'AvailabilityRequestDto(availabilityId: $availabilityId, availabilityBlockId: $availabilityBlockId, startTime: $startTime, endTime: $endTime, requestFrom: $requestFrom, requestUntil: $requestUntil, calendarDays: $calendarDays, recurrenceDays: $recurrenceDays, recurrenceWeekInterval: $recurrenceWeekInterval, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$AvailabilityRequestDtoCopyWith<$Res> implements $AvailabilityRequestDtoCopyWith<$Res> {
  factory _$AvailabilityRequestDtoCopyWith(_AvailabilityRequestDto value, $Res Function(_AvailabilityRequestDto) _then) = __$AvailabilityRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int? availabilityId, int? availabilityBlockId, Map<String, dynamic>? startTime, Map<String, dynamic>? endTime, Map<String, dynamic>? requestFrom, Map<String, dynamic>? requestUntil, List<Map<String, dynamic>>? calendarDays, List<int>? recurrenceDays, int? recurrenceWeekInterval, String? remark
});




}
/// @nodoc
class __$AvailabilityRequestDtoCopyWithImpl<$Res>
    implements _$AvailabilityRequestDtoCopyWith<$Res> {
  __$AvailabilityRequestDtoCopyWithImpl(this._self, this._then);

  final _AvailabilityRequestDto _self;
  final $Res Function(_AvailabilityRequestDto) _then;

/// Create a copy of AvailabilityRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availabilityId = freezed,Object? availabilityBlockId = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? requestFrom = freezed,Object? requestUntil = freezed,Object? calendarDays = freezed,Object? recurrenceDays = freezed,Object? recurrenceWeekInterval = freezed,Object? remark = freezed,}) {
  return _then(_AvailabilityRequestDto(
availabilityId: freezed == availabilityId ? _self.availabilityId : availabilityId // ignore: cast_nullable_to_non_nullable
as int?,availabilityBlockId: freezed == availabilityBlockId ? _self.availabilityBlockId : availabilityBlockId // ignore: cast_nullable_to_non_nullable
as int?,startTime: freezed == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,endTime: freezed == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,requestFrom: freezed == requestFrom ? _self._requestFrom : requestFrom // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,requestUntil: freezed == requestUntil ? _self._requestUntil : requestUntil // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,calendarDays: freezed == calendarDays ? _self._calendarDays : calendarDays // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,recurrenceDays: freezed == recurrenceDays ? _self._recurrenceDays : recurrenceDays // ignore: cast_nullable_to_non_nullable
as List<int>?,recurrenceWeekInterval: freezed == recurrenceWeekInterval ? _self.recurrenceWeekInterval : recurrenceWeekInterval // ignore: cast_nullable_to_non_nullable
as int?,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
