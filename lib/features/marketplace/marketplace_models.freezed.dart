// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketplaceShiftDto {

 int get id; String get name; String? get clientName; String? get departmentName; Map<String, dynamic> get scheduleDate; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; Map<String, dynamic>? get address; double? get distance; bool get isScheduled;
/// Create a copy of MarketplaceShiftDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketplaceShiftDtoCopyWith<MarketplaceShiftDto> get copyWith => _$MarketplaceShiftDtoCopyWithImpl<MarketplaceShiftDto>(this as MarketplaceShiftDto, _$identity);

  /// Serializes this MarketplaceShiftDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketplaceShiftDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&const DeepCollectionEquality().equals(other.scheduleDate, scheduleDate)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&const DeepCollectionEquality().equals(other.address, address)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isScheduled, isScheduled) || other.isScheduled == isScheduled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,clientName,departmentName,const DeepCollectionEquality().hash(scheduleDate),const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),const DeepCollectionEquality().hash(address),distance,isScheduled);

@override
String toString() {
  return 'MarketplaceShiftDto(id: $id, name: $name, clientName: $clientName, departmentName: $departmentName, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, address: $address, distance: $distance, isScheduled: $isScheduled)';
}


}

/// @nodoc
abstract mixin class $MarketplaceShiftDtoCopyWith<$Res>  {
  factory $MarketplaceShiftDtoCopyWith(MarketplaceShiftDto value, $Res Function(MarketplaceShiftDto) _then) = _$MarketplaceShiftDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? clientName, String? departmentName, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, Map<String, dynamic>? address, double? distance, bool isScheduled
});




}
/// @nodoc
class _$MarketplaceShiftDtoCopyWithImpl<$Res>
    implements $MarketplaceShiftDtoCopyWith<$Res> {
  _$MarketplaceShiftDtoCopyWithImpl(this._self, this._then);

  final MarketplaceShiftDto _self;
  final $Res Function(MarketplaceShiftDto) _then;

/// Create a copy of MarketplaceShiftDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? clientName = freezed,Object? departmentName = freezed,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? address = freezed,Object? distance = freezed,Object? isScheduled = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,scheduleDate: null == scheduleDate ? _self.scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,isScheduled: null == isScheduled ? _self.isScheduled : isScheduled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketplaceShiftDto].
extension MarketplaceShiftDtoPatterns on MarketplaceShiftDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketplaceShiftDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketplaceShiftDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketplaceShiftDto value)  $default,){
final _that = this;
switch (_that) {
case _MarketplaceShiftDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketplaceShiftDto value)?  $default,){
final _that = this;
switch (_that) {
case _MarketplaceShiftDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? clientName,  String? departmentName,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic>? address,  double? distance,  bool isScheduled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketplaceShiftDto() when $default != null:
return $default(_that.id,_that.name,_that.clientName,_that.departmentName,_that.scheduleDate,_that.startTime,_that.endTime,_that.address,_that.distance,_that.isScheduled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? clientName,  String? departmentName,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic>? address,  double? distance,  bool isScheduled)  $default,) {final _that = this;
switch (_that) {
case _MarketplaceShiftDto():
return $default(_that.id,_that.name,_that.clientName,_that.departmentName,_that.scheduleDate,_that.startTime,_that.endTime,_that.address,_that.distance,_that.isScheduled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? clientName,  String? departmentName,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  Map<String, dynamic>? address,  double? distance,  bool isScheduled)?  $default,) {final _that = this;
switch (_that) {
case _MarketplaceShiftDto() when $default != null:
return $default(_that.id,_that.name,_that.clientName,_that.departmentName,_that.scheduleDate,_that.startTime,_that.endTime,_that.address,_that.distance,_that.isScheduled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketplaceShiftDto implements MarketplaceShiftDto {
  const _MarketplaceShiftDto({required this.id, required this.name, this.clientName, this.departmentName, required final  Map<String, dynamic> scheduleDate, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, final  Map<String, dynamic>? address, this.distance, required this.isScheduled}): _scheduleDate = scheduleDate,_startTime = startTime,_endTime = endTime,_address = address;
  factory _MarketplaceShiftDto.fromJson(Map<String, dynamic> json) => _$MarketplaceShiftDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? clientName;
@override final  String? departmentName;
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

 final  Map<String, dynamic>? _address;
@override Map<String, dynamic>? get address {
  final value = _address;
  if (value == null) return null;
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  double? distance;
@override final  bool isScheduled;

/// Create a copy of MarketplaceShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketplaceShiftDtoCopyWith<_MarketplaceShiftDto> get copyWith => __$MarketplaceShiftDtoCopyWithImpl<_MarketplaceShiftDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketplaceShiftDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketplaceShiftDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&const DeepCollectionEquality().equals(other._scheduleDate, _scheduleDate)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isScheduled, isScheduled) || other.isScheduled == isScheduled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,clientName,departmentName,const DeepCollectionEquality().hash(_scheduleDate),const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),const DeepCollectionEquality().hash(_address),distance,isScheduled);

@override
String toString() {
  return 'MarketplaceShiftDto(id: $id, name: $name, clientName: $clientName, departmentName: $departmentName, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, address: $address, distance: $distance, isScheduled: $isScheduled)';
}


}

/// @nodoc
abstract mixin class _$MarketplaceShiftDtoCopyWith<$Res> implements $MarketplaceShiftDtoCopyWith<$Res> {
  factory _$MarketplaceShiftDtoCopyWith(_MarketplaceShiftDto value, $Res Function(_MarketplaceShiftDto) _then) = __$MarketplaceShiftDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? clientName, String? departmentName, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, Map<String, dynamic>? address, double? distance, bool isScheduled
});




}
/// @nodoc
class __$MarketplaceShiftDtoCopyWithImpl<$Res>
    implements _$MarketplaceShiftDtoCopyWith<$Res> {
  __$MarketplaceShiftDtoCopyWithImpl(this._self, this._then);

  final _MarketplaceShiftDto _self;
  final $Res Function(_MarketplaceShiftDto) _then;

/// Create a copy of MarketplaceShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? clientName = freezed,Object? departmentName = freezed,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? address = freezed,Object? distance = freezed,Object? isScheduled = null,}) {
  return _then(_MarketplaceShiftDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,scheduleDate: null == scheduleDate ? _self._scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,address: freezed == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,isScheduled: null == isScheduled ? _self.isScheduled : isScheduled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MarketplaceOverviewDto {

 List<MarketplaceShiftDto> get shifts;
/// Create a copy of MarketplaceOverviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketplaceOverviewDtoCopyWith<MarketplaceOverviewDto> get copyWith => _$MarketplaceOverviewDtoCopyWithImpl<MarketplaceOverviewDto>(this as MarketplaceOverviewDto, _$identity);

  /// Serializes this MarketplaceOverviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketplaceOverviewDto&&const DeepCollectionEquality().equals(other.shifts, shifts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(shifts));

@override
String toString() {
  return 'MarketplaceOverviewDto(shifts: $shifts)';
}


}

/// @nodoc
abstract mixin class $MarketplaceOverviewDtoCopyWith<$Res>  {
  factory $MarketplaceOverviewDtoCopyWith(MarketplaceOverviewDto value, $Res Function(MarketplaceOverviewDto) _then) = _$MarketplaceOverviewDtoCopyWithImpl;
@useResult
$Res call({
 List<MarketplaceShiftDto> shifts
});




}
/// @nodoc
class _$MarketplaceOverviewDtoCopyWithImpl<$Res>
    implements $MarketplaceOverviewDtoCopyWith<$Res> {
  _$MarketplaceOverviewDtoCopyWithImpl(this._self, this._then);

  final MarketplaceOverviewDto _self;
  final $Res Function(MarketplaceOverviewDto) _then;

/// Create a copy of MarketplaceOverviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shifts = null,}) {
  return _then(_self.copyWith(
shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<MarketplaceShiftDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketplaceOverviewDto].
extension MarketplaceOverviewDtoPatterns on MarketplaceOverviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketplaceOverviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketplaceOverviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketplaceOverviewDto value)  $default,){
final _that = this;
switch (_that) {
case _MarketplaceOverviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketplaceOverviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _MarketplaceOverviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MarketplaceShiftDto> shifts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketplaceOverviewDto() when $default != null:
return $default(_that.shifts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MarketplaceShiftDto> shifts)  $default,) {final _that = this;
switch (_that) {
case _MarketplaceOverviewDto():
return $default(_that.shifts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MarketplaceShiftDto> shifts)?  $default,) {final _that = this;
switch (_that) {
case _MarketplaceOverviewDto() when $default != null:
return $default(_that.shifts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketplaceOverviewDto implements MarketplaceOverviewDto {
  const _MarketplaceOverviewDto({required final  List<MarketplaceShiftDto> shifts}): _shifts = shifts;
  factory _MarketplaceOverviewDto.fromJson(Map<String, dynamic> json) => _$MarketplaceOverviewDtoFromJson(json);

 final  List<MarketplaceShiftDto> _shifts;
@override List<MarketplaceShiftDto> get shifts {
  if (_shifts is EqualUnmodifiableListView) return _shifts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shifts);
}


/// Create a copy of MarketplaceOverviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketplaceOverviewDtoCopyWith<_MarketplaceOverviewDto> get copyWith => __$MarketplaceOverviewDtoCopyWithImpl<_MarketplaceOverviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketplaceOverviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketplaceOverviewDto&&const DeepCollectionEquality().equals(other._shifts, _shifts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_shifts));

@override
String toString() {
  return 'MarketplaceOverviewDto(shifts: $shifts)';
}


}

/// @nodoc
abstract mixin class _$MarketplaceOverviewDtoCopyWith<$Res> implements $MarketplaceOverviewDtoCopyWith<$Res> {
  factory _$MarketplaceOverviewDtoCopyWith(_MarketplaceOverviewDto value, $Res Function(_MarketplaceOverviewDto) _then) = __$MarketplaceOverviewDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MarketplaceShiftDto> shifts
});




}
/// @nodoc
class __$MarketplaceOverviewDtoCopyWithImpl<$Res>
    implements _$MarketplaceOverviewDtoCopyWith<$Res> {
  __$MarketplaceOverviewDtoCopyWithImpl(this._self, this._then);

  final _MarketplaceOverviewDto _self;
  final $Res Function(_MarketplaceOverviewDto) _then;

/// Create a copy of MarketplaceOverviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shifts = null,}) {
  return _then(_MarketplaceOverviewDto(
shifts: null == shifts ? _self._shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<MarketplaceShiftDto>,
  ));
}


}

// dart format on
