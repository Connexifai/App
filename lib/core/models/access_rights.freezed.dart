// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_rights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccessRights {

/// Whether the user can request absence / leave.
 bool get featureRequestAbsenceEnabled;/// Whether the user can confirm a shift.
 bool get featureConfirmationEnabled;/// Whether the user can decline a shift.
 bool get featureConfirmationDeclineEnabled;/// Whether a remark is required when declining a shift.
 bool get featureConfirmationDeclineRemarkRequired;/// Whether the user can manage their availability.
 bool get featureRequestAvailabilityEnabled;/// Whether predefined availability blocks are used.
 bool get featureRequestAvailablityBlockEnabled;/// Whether the marketplace / self-scheduling is enabled.
 bool get featureMarketplaceEnabled;/// Whether the timesheet module is enabled.
 bool get featureTimesheetsEnabled;/// Whether punch via QR code is enabled.
 bool get featureQrCodeEnabled;/// Whether punch via geofencing is enabled.
 bool get featureGeofencingEnabled;
/// Create a copy of AccessRights
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessRightsCopyWith<AccessRights> get copyWith => _$AccessRightsCopyWithImpl<AccessRights>(this as AccessRights, _$identity);

  /// Serializes this AccessRights to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessRights&&(identical(other.featureRequestAbsenceEnabled, featureRequestAbsenceEnabled) || other.featureRequestAbsenceEnabled == featureRequestAbsenceEnabled)&&(identical(other.featureConfirmationEnabled, featureConfirmationEnabled) || other.featureConfirmationEnabled == featureConfirmationEnabled)&&(identical(other.featureConfirmationDeclineEnabled, featureConfirmationDeclineEnabled) || other.featureConfirmationDeclineEnabled == featureConfirmationDeclineEnabled)&&(identical(other.featureConfirmationDeclineRemarkRequired, featureConfirmationDeclineRemarkRequired) || other.featureConfirmationDeclineRemarkRequired == featureConfirmationDeclineRemarkRequired)&&(identical(other.featureRequestAvailabilityEnabled, featureRequestAvailabilityEnabled) || other.featureRequestAvailabilityEnabled == featureRequestAvailabilityEnabled)&&(identical(other.featureRequestAvailablityBlockEnabled, featureRequestAvailablityBlockEnabled) || other.featureRequestAvailablityBlockEnabled == featureRequestAvailablityBlockEnabled)&&(identical(other.featureMarketplaceEnabled, featureMarketplaceEnabled) || other.featureMarketplaceEnabled == featureMarketplaceEnabled)&&(identical(other.featureTimesheetsEnabled, featureTimesheetsEnabled) || other.featureTimesheetsEnabled == featureTimesheetsEnabled)&&(identical(other.featureQrCodeEnabled, featureQrCodeEnabled) || other.featureQrCodeEnabled == featureQrCodeEnabled)&&(identical(other.featureGeofencingEnabled, featureGeofencingEnabled) || other.featureGeofencingEnabled == featureGeofencingEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,featureRequestAbsenceEnabled,featureConfirmationEnabled,featureConfirmationDeclineEnabled,featureConfirmationDeclineRemarkRequired,featureRequestAvailabilityEnabled,featureRequestAvailablityBlockEnabled,featureMarketplaceEnabled,featureTimesheetsEnabled,featureQrCodeEnabled,featureGeofencingEnabled);

@override
String toString() {
  return 'AccessRights(featureRequestAbsenceEnabled: $featureRequestAbsenceEnabled, featureConfirmationEnabled: $featureConfirmationEnabled, featureConfirmationDeclineEnabled: $featureConfirmationDeclineEnabled, featureConfirmationDeclineRemarkRequired: $featureConfirmationDeclineRemarkRequired, featureRequestAvailabilityEnabled: $featureRequestAvailabilityEnabled, featureRequestAvailablityBlockEnabled: $featureRequestAvailablityBlockEnabled, featureMarketplaceEnabled: $featureMarketplaceEnabled, featureTimesheetsEnabled: $featureTimesheetsEnabled, featureQrCodeEnabled: $featureQrCodeEnabled, featureGeofencingEnabled: $featureGeofencingEnabled)';
}


}

/// @nodoc
abstract mixin class $AccessRightsCopyWith<$Res>  {
  factory $AccessRightsCopyWith(AccessRights value, $Res Function(AccessRights) _then) = _$AccessRightsCopyWithImpl;
@useResult
$Res call({
 bool featureRequestAbsenceEnabled, bool featureConfirmationEnabled, bool featureConfirmationDeclineEnabled, bool featureConfirmationDeclineRemarkRequired, bool featureRequestAvailabilityEnabled, bool featureRequestAvailablityBlockEnabled, bool featureMarketplaceEnabled, bool featureTimesheetsEnabled, bool featureQrCodeEnabled, bool featureGeofencingEnabled
});




}
/// @nodoc
class _$AccessRightsCopyWithImpl<$Res>
    implements $AccessRightsCopyWith<$Res> {
  _$AccessRightsCopyWithImpl(this._self, this._then);

  final AccessRights _self;
  final $Res Function(AccessRights) _then;

/// Create a copy of AccessRights
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? featureRequestAbsenceEnabled = null,Object? featureConfirmationEnabled = null,Object? featureConfirmationDeclineEnabled = null,Object? featureConfirmationDeclineRemarkRequired = null,Object? featureRequestAvailabilityEnabled = null,Object? featureRequestAvailablityBlockEnabled = null,Object? featureMarketplaceEnabled = null,Object? featureTimesheetsEnabled = null,Object? featureQrCodeEnabled = null,Object? featureGeofencingEnabled = null,}) {
  return _then(_self.copyWith(
featureRequestAbsenceEnabled: null == featureRequestAbsenceEnabled ? _self.featureRequestAbsenceEnabled : featureRequestAbsenceEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureConfirmationEnabled: null == featureConfirmationEnabled ? _self.featureConfirmationEnabled : featureConfirmationEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureConfirmationDeclineEnabled: null == featureConfirmationDeclineEnabled ? _self.featureConfirmationDeclineEnabled : featureConfirmationDeclineEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureConfirmationDeclineRemarkRequired: null == featureConfirmationDeclineRemarkRequired ? _self.featureConfirmationDeclineRemarkRequired : featureConfirmationDeclineRemarkRequired // ignore: cast_nullable_to_non_nullable
as bool,featureRequestAvailabilityEnabled: null == featureRequestAvailabilityEnabled ? _self.featureRequestAvailabilityEnabled : featureRequestAvailabilityEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureRequestAvailablityBlockEnabled: null == featureRequestAvailablityBlockEnabled ? _self.featureRequestAvailablityBlockEnabled : featureRequestAvailablityBlockEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureMarketplaceEnabled: null == featureMarketplaceEnabled ? _self.featureMarketplaceEnabled : featureMarketplaceEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureTimesheetsEnabled: null == featureTimesheetsEnabled ? _self.featureTimesheetsEnabled : featureTimesheetsEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureQrCodeEnabled: null == featureQrCodeEnabled ? _self.featureQrCodeEnabled : featureQrCodeEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureGeofencingEnabled: null == featureGeofencingEnabled ? _self.featureGeofencingEnabled : featureGeofencingEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AccessRights].
extension AccessRightsPatterns on AccessRights {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccessRights value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccessRights() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccessRights value)  $default,){
final _that = this;
switch (_that) {
case _AccessRights():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccessRights value)?  $default,){
final _that = this;
switch (_that) {
case _AccessRights() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool featureRequestAbsenceEnabled,  bool featureConfirmationEnabled,  bool featureConfirmationDeclineEnabled,  bool featureConfirmationDeclineRemarkRequired,  bool featureRequestAvailabilityEnabled,  bool featureRequestAvailablityBlockEnabled,  bool featureMarketplaceEnabled,  bool featureTimesheetsEnabled,  bool featureQrCodeEnabled,  bool featureGeofencingEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccessRights() when $default != null:
return $default(_that.featureRequestAbsenceEnabled,_that.featureConfirmationEnabled,_that.featureConfirmationDeclineEnabled,_that.featureConfirmationDeclineRemarkRequired,_that.featureRequestAvailabilityEnabled,_that.featureRequestAvailablityBlockEnabled,_that.featureMarketplaceEnabled,_that.featureTimesheetsEnabled,_that.featureQrCodeEnabled,_that.featureGeofencingEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool featureRequestAbsenceEnabled,  bool featureConfirmationEnabled,  bool featureConfirmationDeclineEnabled,  bool featureConfirmationDeclineRemarkRequired,  bool featureRequestAvailabilityEnabled,  bool featureRequestAvailablityBlockEnabled,  bool featureMarketplaceEnabled,  bool featureTimesheetsEnabled,  bool featureQrCodeEnabled,  bool featureGeofencingEnabled)  $default,) {final _that = this;
switch (_that) {
case _AccessRights():
return $default(_that.featureRequestAbsenceEnabled,_that.featureConfirmationEnabled,_that.featureConfirmationDeclineEnabled,_that.featureConfirmationDeclineRemarkRequired,_that.featureRequestAvailabilityEnabled,_that.featureRequestAvailablityBlockEnabled,_that.featureMarketplaceEnabled,_that.featureTimesheetsEnabled,_that.featureQrCodeEnabled,_that.featureGeofencingEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool featureRequestAbsenceEnabled,  bool featureConfirmationEnabled,  bool featureConfirmationDeclineEnabled,  bool featureConfirmationDeclineRemarkRequired,  bool featureRequestAvailabilityEnabled,  bool featureRequestAvailablityBlockEnabled,  bool featureMarketplaceEnabled,  bool featureTimesheetsEnabled,  bool featureQrCodeEnabled,  bool featureGeofencingEnabled)?  $default,) {final _that = this;
switch (_that) {
case _AccessRights() when $default != null:
return $default(_that.featureRequestAbsenceEnabled,_that.featureConfirmationEnabled,_that.featureConfirmationDeclineEnabled,_that.featureConfirmationDeclineRemarkRequired,_that.featureRequestAvailabilityEnabled,_that.featureRequestAvailablityBlockEnabled,_that.featureMarketplaceEnabled,_that.featureTimesheetsEnabled,_that.featureQrCodeEnabled,_that.featureGeofencingEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccessRights implements AccessRights {
  const _AccessRights({this.featureRequestAbsenceEnabled = false, this.featureConfirmationEnabled = false, this.featureConfirmationDeclineEnabled = false, this.featureConfirmationDeclineRemarkRequired = false, this.featureRequestAvailabilityEnabled = false, this.featureRequestAvailablityBlockEnabled = false, this.featureMarketplaceEnabled = false, this.featureTimesheetsEnabled = false, this.featureQrCodeEnabled = false, this.featureGeofencingEnabled = false});
  factory _AccessRights.fromJson(Map<String, dynamic> json) => _$AccessRightsFromJson(json);

/// Whether the user can request absence / leave.
@override@JsonKey() final  bool featureRequestAbsenceEnabled;
/// Whether the user can confirm a shift.
@override@JsonKey() final  bool featureConfirmationEnabled;
/// Whether the user can decline a shift.
@override@JsonKey() final  bool featureConfirmationDeclineEnabled;
/// Whether a remark is required when declining a shift.
@override@JsonKey() final  bool featureConfirmationDeclineRemarkRequired;
/// Whether the user can manage their availability.
@override@JsonKey() final  bool featureRequestAvailabilityEnabled;
/// Whether predefined availability blocks are used.
@override@JsonKey() final  bool featureRequestAvailablityBlockEnabled;
/// Whether the marketplace / self-scheduling is enabled.
@override@JsonKey() final  bool featureMarketplaceEnabled;
/// Whether the timesheet module is enabled.
@override@JsonKey() final  bool featureTimesheetsEnabled;
/// Whether punch via QR code is enabled.
@override@JsonKey() final  bool featureQrCodeEnabled;
/// Whether punch via geofencing is enabled.
@override@JsonKey() final  bool featureGeofencingEnabled;

/// Create a copy of AccessRights
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessRightsCopyWith<_AccessRights> get copyWith => __$AccessRightsCopyWithImpl<_AccessRights>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessRightsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccessRights&&(identical(other.featureRequestAbsenceEnabled, featureRequestAbsenceEnabled) || other.featureRequestAbsenceEnabled == featureRequestAbsenceEnabled)&&(identical(other.featureConfirmationEnabled, featureConfirmationEnabled) || other.featureConfirmationEnabled == featureConfirmationEnabled)&&(identical(other.featureConfirmationDeclineEnabled, featureConfirmationDeclineEnabled) || other.featureConfirmationDeclineEnabled == featureConfirmationDeclineEnabled)&&(identical(other.featureConfirmationDeclineRemarkRequired, featureConfirmationDeclineRemarkRequired) || other.featureConfirmationDeclineRemarkRequired == featureConfirmationDeclineRemarkRequired)&&(identical(other.featureRequestAvailabilityEnabled, featureRequestAvailabilityEnabled) || other.featureRequestAvailabilityEnabled == featureRequestAvailabilityEnabled)&&(identical(other.featureRequestAvailablityBlockEnabled, featureRequestAvailablityBlockEnabled) || other.featureRequestAvailablityBlockEnabled == featureRequestAvailablityBlockEnabled)&&(identical(other.featureMarketplaceEnabled, featureMarketplaceEnabled) || other.featureMarketplaceEnabled == featureMarketplaceEnabled)&&(identical(other.featureTimesheetsEnabled, featureTimesheetsEnabled) || other.featureTimesheetsEnabled == featureTimesheetsEnabled)&&(identical(other.featureQrCodeEnabled, featureQrCodeEnabled) || other.featureQrCodeEnabled == featureQrCodeEnabled)&&(identical(other.featureGeofencingEnabled, featureGeofencingEnabled) || other.featureGeofencingEnabled == featureGeofencingEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,featureRequestAbsenceEnabled,featureConfirmationEnabled,featureConfirmationDeclineEnabled,featureConfirmationDeclineRemarkRequired,featureRequestAvailabilityEnabled,featureRequestAvailablityBlockEnabled,featureMarketplaceEnabled,featureTimesheetsEnabled,featureQrCodeEnabled,featureGeofencingEnabled);

@override
String toString() {
  return 'AccessRights(featureRequestAbsenceEnabled: $featureRequestAbsenceEnabled, featureConfirmationEnabled: $featureConfirmationEnabled, featureConfirmationDeclineEnabled: $featureConfirmationDeclineEnabled, featureConfirmationDeclineRemarkRequired: $featureConfirmationDeclineRemarkRequired, featureRequestAvailabilityEnabled: $featureRequestAvailabilityEnabled, featureRequestAvailablityBlockEnabled: $featureRequestAvailablityBlockEnabled, featureMarketplaceEnabled: $featureMarketplaceEnabled, featureTimesheetsEnabled: $featureTimesheetsEnabled, featureQrCodeEnabled: $featureQrCodeEnabled, featureGeofencingEnabled: $featureGeofencingEnabled)';
}


}

/// @nodoc
abstract mixin class _$AccessRightsCopyWith<$Res> implements $AccessRightsCopyWith<$Res> {
  factory _$AccessRightsCopyWith(_AccessRights value, $Res Function(_AccessRights) _then) = __$AccessRightsCopyWithImpl;
@override @useResult
$Res call({
 bool featureRequestAbsenceEnabled, bool featureConfirmationEnabled, bool featureConfirmationDeclineEnabled, bool featureConfirmationDeclineRemarkRequired, bool featureRequestAvailabilityEnabled, bool featureRequestAvailablityBlockEnabled, bool featureMarketplaceEnabled, bool featureTimesheetsEnabled, bool featureQrCodeEnabled, bool featureGeofencingEnabled
});




}
/// @nodoc
class __$AccessRightsCopyWithImpl<$Res>
    implements _$AccessRightsCopyWith<$Res> {
  __$AccessRightsCopyWithImpl(this._self, this._then);

  final _AccessRights _self;
  final $Res Function(_AccessRights) _then;

/// Create a copy of AccessRights
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? featureRequestAbsenceEnabled = null,Object? featureConfirmationEnabled = null,Object? featureConfirmationDeclineEnabled = null,Object? featureConfirmationDeclineRemarkRequired = null,Object? featureRequestAvailabilityEnabled = null,Object? featureRequestAvailablityBlockEnabled = null,Object? featureMarketplaceEnabled = null,Object? featureTimesheetsEnabled = null,Object? featureQrCodeEnabled = null,Object? featureGeofencingEnabled = null,}) {
  return _then(_AccessRights(
featureRequestAbsenceEnabled: null == featureRequestAbsenceEnabled ? _self.featureRequestAbsenceEnabled : featureRequestAbsenceEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureConfirmationEnabled: null == featureConfirmationEnabled ? _self.featureConfirmationEnabled : featureConfirmationEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureConfirmationDeclineEnabled: null == featureConfirmationDeclineEnabled ? _self.featureConfirmationDeclineEnabled : featureConfirmationDeclineEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureConfirmationDeclineRemarkRequired: null == featureConfirmationDeclineRemarkRequired ? _self.featureConfirmationDeclineRemarkRequired : featureConfirmationDeclineRemarkRequired // ignore: cast_nullable_to_non_nullable
as bool,featureRequestAvailabilityEnabled: null == featureRequestAvailabilityEnabled ? _self.featureRequestAvailabilityEnabled : featureRequestAvailabilityEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureRequestAvailablityBlockEnabled: null == featureRequestAvailablityBlockEnabled ? _self.featureRequestAvailablityBlockEnabled : featureRequestAvailablityBlockEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureMarketplaceEnabled: null == featureMarketplaceEnabled ? _self.featureMarketplaceEnabled : featureMarketplaceEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureTimesheetsEnabled: null == featureTimesheetsEnabled ? _self.featureTimesheetsEnabled : featureTimesheetsEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureQrCodeEnabled: null == featureQrCodeEnabled ? _self.featureQrCodeEnabled : featureQrCodeEnabled // ignore: cast_nullable_to_non_nullable
as bool,featureGeofencingEnabled: null == featureGeofencingEnabled ? _self.featureGeofencingEnabled : featureGeofencingEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
