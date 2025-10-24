// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aim_percentage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AimInPercentage {

 String get aim; int get count; double get percentage;
/// Create a copy of AimInPercentage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AimInPercentageCopyWith<AimInPercentage> get copyWith => _$AimInPercentageCopyWithImpl<AimInPercentage>(this as AimInPercentage, _$identity);

  /// Serializes this AimInPercentage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AimInPercentage&&(identical(other.aim, aim) || other.aim == aim)&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aim,count,percentage);

@override
String toString() {
  return 'AimInPercentage(aim: $aim, count: $count, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $AimInPercentageCopyWith<$Res>  {
  factory $AimInPercentageCopyWith(AimInPercentage value, $Res Function(AimInPercentage) _then) = _$AimInPercentageCopyWithImpl;
@useResult
$Res call({
 String aim, int count, double percentage
});




}
/// @nodoc
class _$AimInPercentageCopyWithImpl<$Res>
    implements $AimInPercentageCopyWith<$Res> {
  _$AimInPercentageCopyWithImpl(this._self, this._then);

  final AimInPercentage _self;
  final $Res Function(AimInPercentage) _then;

/// Create a copy of AimInPercentage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aim = null,Object? count = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
aim: null == aim ? _self.aim : aim // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AimInPercentage].
extension AimInPercentagePatterns on AimInPercentage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AimInPercentage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AimInPercentage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AimInPercentage value)  $default,){
final _that = this;
switch (_that) {
case _AimInPercentage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AimInPercentage value)?  $default,){
final _that = this;
switch (_that) {
case _AimInPercentage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String aim,  int count,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AimInPercentage() when $default != null:
return $default(_that.aim,_that.count,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String aim,  int count,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _AimInPercentage():
return $default(_that.aim,_that.count,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String aim,  int count,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _AimInPercentage() when $default != null:
return $default(_that.aim,_that.count,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AimInPercentage implements AimInPercentage {
  const _AimInPercentage({required this.aim, required this.count, required this.percentage});
  factory _AimInPercentage.fromJson(Map<String, dynamic> json) => _$AimInPercentageFromJson(json);

@override final  String aim;
@override final  int count;
@override final  double percentage;

/// Create a copy of AimInPercentage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AimInPercentageCopyWith<_AimInPercentage> get copyWith => __$AimInPercentageCopyWithImpl<_AimInPercentage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AimInPercentageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AimInPercentage&&(identical(other.aim, aim) || other.aim == aim)&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aim,count,percentage);

@override
String toString() {
  return 'AimInPercentage(aim: $aim, count: $count, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$AimInPercentageCopyWith<$Res> implements $AimInPercentageCopyWith<$Res> {
  factory _$AimInPercentageCopyWith(_AimInPercentage value, $Res Function(_AimInPercentage) _then) = __$AimInPercentageCopyWithImpl;
@override @useResult
$Res call({
 String aim, int count, double percentage
});




}
/// @nodoc
class __$AimInPercentageCopyWithImpl<$Res>
    implements _$AimInPercentageCopyWith<$Res> {
  __$AimInPercentageCopyWithImpl(this._self, this._then);

  final _AimInPercentage _self;
  final $Res Function(_AimInPercentage) _then;

/// Create a copy of AimInPercentage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aim = null,Object? count = null,Object? percentage = null,}) {
  return _then(_AimInPercentage(
aim: null == aim ? _self.aim : aim // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
