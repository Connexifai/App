// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

/// The tenant identity (X-Tenant-Identity header value).
 String get tenantIdentity;/// The OAuth client_id used for authentication.
 String get clientId;/// The OAuth client_secret used for authentication.
 String get clientSecret;/// The current JWT access token.
 String get accessToken;/// The refresh token for obtaining a new access token.
 String get refreshToken;/// When the access token expires (UTC).
 DateTime get accessTokenExpiresAt;/// When the refresh token expires (UTC).
 DateTime get refreshTokenExpiresAt;/// Optional user identity (X-User-Identity header value).
 String get userIdentity;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.tenantIdentity, tenantIdentity) || other.tenantIdentity == tenantIdentity)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.userIdentity, userIdentity) || other.userIdentity == userIdentity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantIdentity,clientId,clientSecret,accessToken,refreshToken,accessTokenExpiresAt,refreshTokenExpiresAt,userIdentity);

@override
String toString() {
  return 'SessionModel(tenantIdentity: $tenantIdentity, clientId: $clientId, clientSecret: $clientSecret, accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresAt: $accessTokenExpiresAt, refreshTokenExpiresAt: $refreshTokenExpiresAt, userIdentity: $userIdentity)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 String tenantIdentity, String clientId, String clientSecret, String accessToken, String refreshToken, DateTime accessTokenExpiresAt, DateTime refreshTokenExpiresAt, String userIdentity
});




}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantIdentity = null,Object? clientId = null,Object? clientSecret = null,Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresAt = null,Object? refreshTokenExpiresAt = null,Object? userIdentity = null,}) {
  return _then(_self.copyWith(
tenantIdentity: null == tenantIdentity ? _self.tenantIdentity : tenantIdentity // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,userIdentity: null == userIdentity ? _self.userIdentity : userIdentity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantIdentity,  String clientId,  String clientSecret,  String accessToken,  String refreshToken,  DateTime accessTokenExpiresAt,  DateTime refreshTokenExpiresAt,  String userIdentity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.tenantIdentity,_that.clientId,_that.clientSecret,_that.accessToken,_that.refreshToken,_that.accessTokenExpiresAt,_that.refreshTokenExpiresAt,_that.userIdentity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantIdentity,  String clientId,  String clientSecret,  String accessToken,  String refreshToken,  DateTime accessTokenExpiresAt,  DateTime refreshTokenExpiresAt,  String userIdentity)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.tenantIdentity,_that.clientId,_that.clientSecret,_that.accessToken,_that.refreshToken,_that.accessTokenExpiresAt,_that.refreshTokenExpiresAt,_that.userIdentity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantIdentity,  String clientId,  String clientSecret,  String accessToken,  String refreshToken,  DateTime accessTokenExpiresAt,  DateTime refreshTokenExpiresAt,  String userIdentity)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.tenantIdentity,_that.clientId,_that.clientSecret,_that.accessToken,_that.refreshToken,_that.accessTokenExpiresAt,_that.refreshTokenExpiresAt,_that.userIdentity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel implements SessionModel {
  const _SessionModel({required this.tenantIdentity, required this.clientId, required this.clientSecret, required this.accessToken, required this.refreshToken, required this.accessTokenExpiresAt, required this.refreshTokenExpiresAt, this.userIdentity = ''});
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

/// The tenant identity (X-Tenant-Identity header value).
@override final  String tenantIdentity;
/// The OAuth client_id used for authentication.
@override final  String clientId;
/// The OAuth client_secret used for authentication.
@override final  String clientSecret;
/// The current JWT access token.
@override final  String accessToken;
/// The refresh token for obtaining a new access token.
@override final  String refreshToken;
/// When the access token expires (UTC).
@override final  DateTime accessTokenExpiresAt;
/// When the refresh token expires (UTC).
@override final  DateTime refreshTokenExpiresAt;
/// Optional user identity (X-User-Identity header value).
@override@JsonKey() final  String userIdentity;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.tenantIdentity, tenantIdentity) || other.tenantIdentity == tenantIdentity)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.userIdentity, userIdentity) || other.userIdentity == userIdentity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantIdentity,clientId,clientSecret,accessToken,refreshToken,accessTokenExpiresAt,refreshTokenExpiresAt,userIdentity);

@override
String toString() {
  return 'SessionModel(tenantIdentity: $tenantIdentity, clientId: $clientId, clientSecret: $clientSecret, accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresAt: $accessTokenExpiresAt, refreshTokenExpiresAt: $refreshTokenExpiresAt, userIdentity: $userIdentity)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 String tenantIdentity, String clientId, String clientSecret, String accessToken, String refreshToken, DateTime accessTokenExpiresAt, DateTime refreshTokenExpiresAt, String userIdentity
});




}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantIdentity = null,Object? clientId = null,Object? clientSecret = null,Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresAt = null,Object? refreshTokenExpiresAt = null,Object? userIdentity = null,}) {
  return _then(_SessionModel(
tenantIdentity: null == tenantIdentity ? _self.tenantIdentity : tenantIdentity // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,userIdentity: null == userIdentity ? _self.userIdentity : userIdentity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
