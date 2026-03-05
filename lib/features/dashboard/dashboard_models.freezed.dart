// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftDto {

 int get id; String get name; Map<String, dynamic> get scheduleDate; Map<String, dynamic> get startTime; Map<String, dynamic> get endTime; String? get clientName; String? get departmentName; AddressDto? get address; String? get scheduledRemark; bool? get isConfirmed; int? get confirmationStatusId;
/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftDtoCopyWith<ShiftDto> get copyWith => _$ShiftDtoCopyWithImpl<ShiftDto>(this as ShiftDto, _$identity);

  /// Serializes this ShiftDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.scheduleDate, scheduleDate)&&const DeepCollectionEquality().equals(other.startTime, startTime)&&const DeepCollectionEquality().equals(other.endTime, endTime)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.address, address) || other.address == address)&&(identical(other.scheduledRemark, scheduledRemark) || other.scheduledRemark == scheduledRemark)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.confirmationStatusId, confirmationStatusId) || other.confirmationStatusId == confirmationStatusId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(scheduleDate),const DeepCollectionEquality().hash(startTime),const DeepCollectionEquality().hash(endTime),clientName,departmentName,address,scheduledRemark,isConfirmed,confirmationStatusId);

@override
String toString() {
  return 'ShiftDto(id: $id, name: $name, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, clientName: $clientName, departmentName: $departmentName, address: $address, scheduledRemark: $scheduledRemark, isConfirmed: $isConfirmed, confirmationStatusId: $confirmationStatusId)';
}


}

/// @nodoc
abstract mixin class $ShiftDtoCopyWith<$Res>  {
  factory $ShiftDtoCopyWith(ShiftDto value, $Res Function(ShiftDto) _then) = _$ShiftDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String? clientName, String? departmentName, AddressDto? address, String? scheduledRemark, bool? isConfirmed, int? confirmationStatusId
});


$AddressDtoCopyWith<$Res>? get address;

}
/// @nodoc
class _$ShiftDtoCopyWithImpl<$Res>
    implements $ShiftDtoCopyWith<$Res> {
  _$ShiftDtoCopyWithImpl(this._self, this._then);

  final ShiftDto _self;
  final $Res Function(ShiftDto) _then;

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? clientName = freezed,Object? departmentName = freezed,Object? address = freezed,Object? scheduledRemark = freezed,Object? isConfirmed = freezed,Object? confirmationStatusId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scheduleDate: null == scheduleDate ? _self.scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDto?,scheduledRemark: freezed == scheduledRemark ? _self.scheduledRemark : scheduledRemark // ignore: cast_nullable_to_non_nullable
as String?,isConfirmed: freezed == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool?,confirmationStatusId: freezed == confirmationStatusId ? _self.confirmationStatusId : confirmationStatusId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressDtoCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftDto].
extension ShiftDtoPatterns on ShiftDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftDto value)  $default,){
final _that = this;
switch (_that) {
case _ShiftDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftDto value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String? clientName,  String? departmentName,  AddressDto? address,  String? scheduledRemark,  bool? isConfirmed,  int? confirmationStatusId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
return $default(_that.id,_that.name,_that.scheduleDate,_that.startTime,_that.endTime,_that.clientName,_that.departmentName,_that.address,_that.scheduledRemark,_that.isConfirmed,_that.confirmationStatusId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String? clientName,  String? departmentName,  AddressDto? address,  String? scheduledRemark,  bool? isConfirmed,  int? confirmationStatusId)  $default,) {final _that = this;
switch (_that) {
case _ShiftDto():
return $default(_that.id,_that.name,_that.scheduleDate,_that.startTime,_that.endTime,_that.clientName,_that.departmentName,_that.address,_that.scheduledRemark,_that.isConfirmed,_that.confirmationStatusId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  Map<String, dynamic> scheduleDate,  Map<String, dynamic> startTime,  Map<String, dynamic> endTime,  String? clientName,  String? departmentName,  AddressDto? address,  String? scheduledRemark,  bool? isConfirmed,  int? confirmationStatusId)?  $default,) {final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
return $default(_that.id,_that.name,_that.scheduleDate,_that.startTime,_that.endTime,_that.clientName,_that.departmentName,_that.address,_that.scheduledRemark,_that.isConfirmed,_that.confirmationStatusId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShiftDto implements ShiftDto {
  const _ShiftDto({required this.id, required this.name, required final  Map<String, dynamic> scheduleDate, required final  Map<String, dynamic> startTime, required final  Map<String, dynamic> endTime, this.clientName, this.departmentName, this.address, this.scheduledRemark, this.isConfirmed, this.confirmationStatusId}): _scheduleDate = scheduleDate,_startTime = startTime,_endTime = endTime;
  factory _ShiftDto.fromJson(Map<String, dynamic> json) => _$ShiftDtoFromJson(json);

@override final  int id;
@override final  String name;
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

@override final  String? clientName;
@override final  String? departmentName;
@override final  AddressDto? address;
@override final  String? scheduledRemark;
@override final  bool? isConfirmed;
@override final  int? confirmationStatusId;

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftDtoCopyWith<_ShiftDto> get copyWith => __$ShiftDtoCopyWithImpl<_ShiftDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._scheduleDate, _scheduleDate)&&const DeepCollectionEquality().equals(other._startTime, _startTime)&&const DeepCollectionEquality().equals(other._endTime, _endTime)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.address, address) || other.address == address)&&(identical(other.scheduledRemark, scheduledRemark) || other.scheduledRemark == scheduledRemark)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.confirmationStatusId, confirmationStatusId) || other.confirmationStatusId == confirmationStatusId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_scheduleDate),const DeepCollectionEquality().hash(_startTime),const DeepCollectionEquality().hash(_endTime),clientName,departmentName,address,scheduledRemark,isConfirmed,confirmationStatusId);

@override
String toString() {
  return 'ShiftDto(id: $id, name: $name, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, clientName: $clientName, departmentName: $departmentName, address: $address, scheduledRemark: $scheduledRemark, isConfirmed: $isConfirmed, confirmationStatusId: $confirmationStatusId)';
}


}

/// @nodoc
abstract mixin class _$ShiftDtoCopyWith<$Res> implements $ShiftDtoCopyWith<$Res> {
  factory _$ShiftDtoCopyWith(_ShiftDto value, $Res Function(_ShiftDto) _then) = __$ShiftDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Map<String, dynamic> scheduleDate, Map<String, dynamic> startTime, Map<String, dynamic> endTime, String? clientName, String? departmentName, AddressDto? address, String? scheduledRemark, bool? isConfirmed, int? confirmationStatusId
});


@override $AddressDtoCopyWith<$Res>? get address;

}
/// @nodoc
class __$ShiftDtoCopyWithImpl<$Res>
    implements _$ShiftDtoCopyWith<$Res> {
  __$ShiftDtoCopyWithImpl(this._self, this._then);

  final _ShiftDto _self;
  final $Res Function(_ShiftDto) _then;

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? scheduleDate = null,Object? startTime = null,Object? endTime = null,Object? clientName = freezed,Object? departmentName = freezed,Object? address = freezed,Object? scheduledRemark = freezed,Object? isConfirmed = freezed,Object? confirmationStatusId = freezed,}) {
  return _then(_ShiftDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scheduleDate: null == scheduleDate ? _self._scheduleDate : scheduleDate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,startTime: null == startTime ? _self._startTime : startTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,endTime: null == endTime ? _self._endTime : endTime // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDto?,scheduledRemark: freezed == scheduledRemark ? _self.scheduledRemark : scheduledRemark // ignore: cast_nullable_to_non_nullable
as String?,isConfirmed: freezed == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool?,confirmationStatusId: freezed == confirmationStatusId ? _self.confirmationStatusId : confirmationStatusId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressDtoCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$AddressDto {

 String get street; String get number; String? get numberAddition; String? get postalCode; String? get city; String? get county; String? get country;/// Pre-resolved latitude (when available).
 double? get latitude;/// Pre-resolved longitude (when available).
 double? get longitude;
/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<AddressDto> get copyWith => _$AddressDtoCopyWithImpl<AddressDto>(this as AddressDto, _$identity);

  /// Serializes this AddressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDto&&(identical(other.street, street) || other.street == street)&&(identical(other.number, number) || other.number == number)&&(identical(other.numberAddition, numberAddition) || other.numberAddition == numberAddition)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.county, county) || other.county == county)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,number,numberAddition,postalCode,city,county,country,latitude,longitude);

@override
String toString() {
  return 'AddressDto(street: $street, number: $number, numberAddition: $numberAddition, postalCode: $postalCode, city: $city, county: $county, country: $country, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $AddressDtoCopyWith<$Res>  {
  factory $AddressDtoCopyWith(AddressDto value, $Res Function(AddressDto) _then) = _$AddressDtoCopyWithImpl;
@useResult
$Res call({
 String street, String number, String? numberAddition, String? postalCode, String? city, String? county, String? country, double? latitude, double? longitude
});




}
/// @nodoc
class _$AddressDtoCopyWithImpl<$Res>
    implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._self, this._then);

  final AddressDto _self;
  final $Res Function(AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? street = null,Object? number = null,Object? numberAddition = freezed,Object? postalCode = freezed,Object? city = freezed,Object? county = freezed,Object? country = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,numberAddition: freezed == numberAddition ? _self.numberAddition : numberAddition // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressDto].
extension AddressDtoPatterns on AddressDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDto value)  $default,){
final _that = this;
switch (_that) {
case _AddressDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDto value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String street,  String number,  String? numberAddition,  String? postalCode,  String? city,  String? county,  String? country,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
return $default(_that.street,_that.number,_that.numberAddition,_that.postalCode,_that.city,_that.county,_that.country,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String street,  String number,  String? numberAddition,  String? postalCode,  String? city,  String? county,  String? country,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _AddressDto():
return $default(_that.street,_that.number,_that.numberAddition,_that.postalCode,_that.city,_that.county,_that.country,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String street,  String number,  String? numberAddition,  String? postalCode,  String? city,  String? county,  String? country,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
return $default(_that.street,_that.number,_that.numberAddition,_that.postalCode,_that.city,_that.county,_that.country,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressDto implements AddressDto {
  const _AddressDto({required this.street, required this.number, this.numberAddition, this.postalCode, this.city, this.county, this.country, this.latitude, this.longitude});
  factory _AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

@override final  String street;
@override final  String number;
@override final  String? numberAddition;
@override final  String? postalCode;
@override final  String? city;
@override final  String? county;
@override final  String? country;
/// Pre-resolved latitude (when available).
@override final  double? latitude;
/// Pre-resolved longitude (when available).
@override final  double? longitude;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDtoCopyWith<_AddressDto> get copyWith => __$AddressDtoCopyWithImpl<_AddressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDto&&(identical(other.street, street) || other.street == street)&&(identical(other.number, number) || other.number == number)&&(identical(other.numberAddition, numberAddition) || other.numberAddition == numberAddition)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.county, county) || other.county == county)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,number,numberAddition,postalCode,city,county,country,latitude,longitude);

@override
String toString() {
  return 'AddressDto(street: $street, number: $number, numberAddition: $numberAddition, postalCode: $postalCode, city: $city, county: $county, country: $country, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AddressDtoCopyWith<$Res> implements $AddressDtoCopyWith<$Res> {
  factory _$AddressDtoCopyWith(_AddressDto value, $Res Function(_AddressDto) _then) = __$AddressDtoCopyWithImpl;
@override @useResult
$Res call({
 String street, String number, String? numberAddition, String? postalCode, String? city, String? county, String? country, double? latitude, double? longitude
});




}
/// @nodoc
class __$AddressDtoCopyWithImpl<$Res>
    implements _$AddressDtoCopyWith<$Res> {
  __$AddressDtoCopyWithImpl(this._self, this._then);

  final _AddressDto _self;
  final $Res Function(_AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? street = null,Object? number = null,Object? numberAddition = freezed,Object? postalCode = freezed,Object? city = freezed,Object? county = freezed,Object? country = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_AddressDto(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,numberAddition: freezed == numberAddition ? _self.numberAddition : numberAddition // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$PunchRequestDto {

 int get scheduleId;
/// Create a copy of PunchRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PunchRequestDtoCopyWith<PunchRequestDto> get copyWith => _$PunchRequestDtoCopyWithImpl<PunchRequestDto>(this as PunchRequestDto, _$identity);

  /// Serializes this PunchRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PunchRequestDto&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduleId);

@override
String toString() {
  return 'PunchRequestDto(scheduleId: $scheduleId)';
}


}

/// @nodoc
abstract mixin class $PunchRequestDtoCopyWith<$Res>  {
  factory $PunchRequestDtoCopyWith(PunchRequestDto value, $Res Function(PunchRequestDto) _then) = _$PunchRequestDtoCopyWithImpl;
@useResult
$Res call({
 int scheduleId
});




}
/// @nodoc
class _$PunchRequestDtoCopyWithImpl<$Res>
    implements $PunchRequestDtoCopyWith<$Res> {
  _$PunchRequestDtoCopyWithImpl(this._self, this._then);

  final PunchRequestDto _self;
  final $Res Function(PunchRequestDto) _then;

/// Create a copy of PunchRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scheduleId = null,}) {
  return _then(_self.copyWith(
scheduleId: null == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PunchRequestDto].
extension PunchRequestDtoPatterns on PunchRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PunchRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PunchRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PunchRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _PunchRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PunchRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _PunchRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int scheduleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PunchRequestDto() when $default != null:
return $default(_that.scheduleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int scheduleId)  $default,) {final _that = this;
switch (_that) {
case _PunchRequestDto():
return $default(_that.scheduleId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int scheduleId)?  $default,) {final _that = this;
switch (_that) {
case _PunchRequestDto() when $default != null:
return $default(_that.scheduleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PunchRequestDto implements PunchRequestDto {
  const _PunchRequestDto({required this.scheduleId});
  factory _PunchRequestDto.fromJson(Map<String, dynamic> json) => _$PunchRequestDtoFromJson(json);

@override final  int scheduleId;

/// Create a copy of PunchRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PunchRequestDtoCopyWith<_PunchRequestDto> get copyWith => __$PunchRequestDtoCopyWithImpl<_PunchRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PunchRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PunchRequestDto&&(identical(other.scheduleId, scheduleId) || other.scheduleId == scheduleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduleId);

@override
String toString() {
  return 'PunchRequestDto(scheduleId: $scheduleId)';
}


}

/// @nodoc
abstract mixin class _$PunchRequestDtoCopyWith<$Res> implements $PunchRequestDtoCopyWith<$Res> {
  factory _$PunchRequestDtoCopyWith(_PunchRequestDto value, $Res Function(_PunchRequestDto) _then) = __$PunchRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int scheduleId
});




}
/// @nodoc
class __$PunchRequestDtoCopyWithImpl<$Res>
    implements _$PunchRequestDtoCopyWith<$Res> {
  __$PunchRequestDtoCopyWithImpl(this._self, this._then);

  final _PunchRequestDto _self;
  final $Res Function(_PunchRequestDto) _then;

/// Create a copy of PunchRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scheduleId = null,}) {
  return _then(_PunchRequestDto(
scheduleId: null == scheduleId ? _self.scheduleId : scheduleId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
