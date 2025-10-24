// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_totem_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyTotemResponse {

 String get id;
/// Create a copy of MyTotemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTotemResponseCopyWith<MyTotemResponse> get copyWith => _$MyTotemResponseCopyWithImpl<MyTotemResponse>(this as MyTotemResponse, _$identity);

  /// Serializes this MyTotemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTotemResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MyTotemResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class $MyTotemResponseCopyWith<$Res>  {
  factory $MyTotemResponseCopyWith(MyTotemResponse value, $Res Function(MyTotemResponse) _then) = _$MyTotemResponseCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$MyTotemResponseCopyWithImpl<$Res>
    implements $MyTotemResponseCopyWith<$Res> {
  _$MyTotemResponseCopyWithImpl(this._self, this._then);

  final MyTotemResponse _self;
  final $Res Function(MyTotemResponse) _then;

/// Create a copy of MyTotemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MyTotemResponse].
extension MyTotemResponsePatterns on MyTotemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyTotemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyTotemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyTotemResponse value)  $default,){
final _that = this;
switch (_that) {
case _MyTotemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyTotemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MyTotemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyTotemResponse() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _MyTotemResponse():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _MyTotemResponse() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyTotemResponse implements MyTotemResponse {
  const _MyTotemResponse({required this.id});
  factory _MyTotemResponse.fromJson(Map<String, dynamic> json) => _$MyTotemResponseFromJson(json);

@override final  String id;

/// Create a copy of MyTotemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTotemResponseCopyWith<_MyTotemResponse> get copyWith => __$MyTotemResponseCopyWithImpl<_MyTotemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyTotemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTotemResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MyTotemResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MyTotemResponseCopyWith<$Res> implements $MyTotemResponseCopyWith<$Res> {
  factory _$MyTotemResponseCopyWith(_MyTotemResponse value, $Res Function(_MyTotemResponse) _then) = __$MyTotemResponseCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$MyTotemResponseCopyWithImpl<$Res>
    implements _$MyTotemResponseCopyWith<$Res> {
  __$MyTotemResponseCopyWithImpl(this._self, this._then);

  final _MyTotemResponse _self;
  final $Res Function(_MyTotemResponse) _then;

/// Create a copy of MyTotemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MyTotemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
