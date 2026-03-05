// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseWrapper<T> {

/// Whether the request succeeded.
 bool get isSuccess;/// The response payload; null when [isSuccess] is false.
 T? get data;/// Human-readable error message when [isSuccess] is false.
 String? get errorMessage;/// Machine-readable error code.
 String? get errorCode;
/// Create a copy of ResponseWrapper
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseWrapperCopyWith<T, ResponseWrapper<T>> get copyWith => _$ResponseWrapperCopyWithImpl<T, ResponseWrapper<T>>(this as ResponseWrapper<T>, _$identity);

  /// Serializes this ResponseWrapper to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseWrapper<T>&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(data),errorMessage,errorCode);

@override
String toString() {
  return 'ResponseWrapper<$T>(isSuccess: $isSuccess, data: $data, errorMessage: $errorMessage, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $ResponseWrapperCopyWith<T,$Res>  {
  factory $ResponseWrapperCopyWith(ResponseWrapper<T> value, $Res Function(ResponseWrapper<T>) _then) = _$ResponseWrapperCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, T? data, String? errorMessage, String? errorCode
});




}
/// @nodoc
class _$ResponseWrapperCopyWithImpl<T,$Res>
    implements $ResponseWrapperCopyWith<T, $Res> {
  _$ResponseWrapperCopyWithImpl(this._self, this._then);

  final ResponseWrapper<T> _self;
  final $Res Function(ResponseWrapper<T>) _then;

/// Create a copy of ResponseWrapper
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? errorMessage = freezed,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseWrapper].
extension ResponseWrapperPatterns<T> on ResponseWrapper<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseWrapper<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseWrapper() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseWrapper<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResponseWrapper():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseWrapper<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseWrapper() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  T? data,  String? errorMessage,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseWrapper() when $default != null:
return $default(_that.isSuccess,_that.data,_that.errorMessage,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  T? data,  String? errorMessage,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _ResponseWrapper():
return $default(_that.isSuccess,_that.data,_that.errorMessage,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  T? data,  String? errorMessage,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _ResponseWrapper() when $default != null:
return $default(_that.isSuccess,_that.data,_that.errorMessage,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ResponseWrapper<T> implements ResponseWrapper<T> {
  const _ResponseWrapper({required this.isSuccess, this.data, this.errorMessage, this.errorCode});
  factory _ResponseWrapper.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ResponseWrapperFromJson(json,fromJsonT);

/// Whether the request succeeded.
@override final  bool isSuccess;
/// The response payload; null when [isSuccess] is false.
@override final  T? data;
/// Human-readable error message when [isSuccess] is false.
@override final  String? errorMessage;
/// Machine-readable error code.
@override final  String? errorCode;

/// Create a copy of ResponseWrapper
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseWrapperCopyWith<T, _ResponseWrapper<T>> get copyWith => __$ResponseWrapperCopyWithImpl<T, _ResponseWrapper<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ResponseWrapperToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseWrapper<T>&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(data),errorMessage,errorCode);

@override
String toString() {
  return 'ResponseWrapper<$T>(isSuccess: $isSuccess, data: $data, errorMessage: $errorMessage, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$ResponseWrapperCopyWith<T,$Res> implements $ResponseWrapperCopyWith<T, $Res> {
  factory _$ResponseWrapperCopyWith(_ResponseWrapper<T> value, $Res Function(_ResponseWrapper<T>) _then) = __$ResponseWrapperCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, T? data, String? errorMessage, String? errorCode
});




}
/// @nodoc
class __$ResponseWrapperCopyWithImpl<T,$Res>
    implements _$ResponseWrapperCopyWith<T, $Res> {
  __$ResponseWrapperCopyWithImpl(this._self, this._then);

  final _ResponseWrapper<T> _self;
  final $Res Function(_ResponseWrapper<T>) _then;

/// Create a copy of ResponseWrapper
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? errorMessage = freezed,Object? errorCode = freezed,}) {
  return _then(_ResponseWrapper<T>(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ApiError {

 String get message; String? get code; int? get statusCode;
/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorCopyWith<ApiError> get copyWith => _$ApiErrorCopyWithImpl<ApiError>(this as ApiError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiError&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,statusCode);

@override
String toString() {
  return 'ApiError(message: $message, code: $code, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<$Res>  {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) _then) = _$ApiErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? code, int? statusCode
});




}
/// @nodoc
class _$ApiErrorCopyWithImpl<$Res>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError _self;
  final $Res Function(ApiError) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? code = freezed,Object? statusCode = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiError].
extension ApiErrorPatterns on ApiError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiError value)  $default,){
final _that = this;
switch (_that) {
case _ApiError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiError value)?  $default,){
final _that = this;
switch (_that) {
case _ApiError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  String? code,  int? statusCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiError() when $default != null:
return $default(_that.message,_that.code,_that.statusCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  String? code,  int? statusCode)  $default,) {final _that = this;
switch (_that) {
case _ApiError():
return $default(_that.message,_that.code,_that.statusCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  String? code,  int? statusCode)?  $default,) {final _that = this;
switch (_that) {
case _ApiError() when $default != null:
return $default(_that.message,_that.code,_that.statusCode);case _:
  return null;

}
}

}

/// @nodoc


class _ApiError implements ApiError {
  const _ApiError({required this.message, this.code, this.statusCode});
  

@override final  String message;
@override final  String? code;
@override final  int? statusCode;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorCopyWith<_ApiError> get copyWith => __$ApiErrorCopyWithImpl<_ApiError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiError&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,statusCode);

@override
String toString() {
  return 'ApiError(message: $message, code: $code, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$ApiErrorCopyWith(_ApiError value, $Res Function(_ApiError) _then) = __$ApiErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, String? code, int? statusCode
});




}
/// @nodoc
class __$ApiErrorCopyWithImpl<$Res>
    implements _$ApiErrorCopyWith<$Res> {
  __$ApiErrorCopyWithImpl(this._self, this._then);

  final _ApiError _self;
  final $Res Function(_ApiError) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,Object? statusCode = freezed,}) {
  return _then(_ApiError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
