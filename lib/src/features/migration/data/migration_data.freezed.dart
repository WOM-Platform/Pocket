// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MigrationData {

 String get code; String get link;@DateTimeConverter() DateTime get importDeadline;
/// Create a copy of MigrationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MigrationDataCopyWith<MigrationData> get copyWith => _$MigrationDataCopyWithImpl<MigrationData>(this as MigrationData, _$identity);

  /// Serializes this MigrationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationData&&(identical(other.code, code) || other.code == code)&&(identical(other.link, link) || other.link == link)&&(identical(other.importDeadline, importDeadline) || other.importDeadline == importDeadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,link,importDeadline);

@override
String toString() {
  return 'MigrationData(code: $code, link: $link, importDeadline: $importDeadline)';
}


}

/// @nodoc
abstract mixin class $MigrationDataCopyWith<$Res>  {
  factory $MigrationDataCopyWith(MigrationData value, $Res Function(MigrationData) _then) = _$MigrationDataCopyWithImpl;
@useResult
$Res call({
 String code, String link,@DateTimeConverter() DateTime importDeadline
});




}
/// @nodoc
class _$MigrationDataCopyWithImpl<$Res>
    implements $MigrationDataCopyWith<$Res> {
  _$MigrationDataCopyWithImpl(this._self, this._then);

  final MigrationData _self;
  final $Res Function(MigrationData) _then;

/// Create a copy of MigrationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? link = null,Object? importDeadline = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,importDeadline: null == importDeadline ? _self.importDeadline : importDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MigrationData].
extension MigrationDataPatterns on MigrationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MigrationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MigrationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MigrationData value)  $default,){
final _that = this;
switch (_that) {
case _MigrationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MigrationData value)?  $default,){
final _that = this;
switch (_that) {
case _MigrationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String link, @DateTimeConverter()  DateTime importDeadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MigrationData() when $default != null:
return $default(_that.code,_that.link,_that.importDeadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String link, @DateTimeConverter()  DateTime importDeadline)  $default,) {final _that = this;
switch (_that) {
case _MigrationData():
return $default(_that.code,_that.link,_that.importDeadline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String link, @DateTimeConverter()  DateTime importDeadline)?  $default,) {final _that = this;
switch (_that) {
case _MigrationData() when $default != null:
return $default(_that.code,_that.link,_that.importDeadline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MigrationData implements MigrationData {
  const _MigrationData({required this.code, required this.link, @DateTimeConverter() required this.importDeadline});
  factory _MigrationData.fromJson(Map<String, dynamic> json) => _$MigrationDataFromJson(json);

@override final  String code;
@override final  String link;
@override@DateTimeConverter() final  DateTime importDeadline;

/// Create a copy of MigrationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MigrationDataCopyWith<_MigrationData> get copyWith => __$MigrationDataCopyWithImpl<_MigrationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MigrationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MigrationData&&(identical(other.code, code) || other.code == code)&&(identical(other.link, link) || other.link == link)&&(identical(other.importDeadline, importDeadline) || other.importDeadline == importDeadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,link,importDeadline);

@override
String toString() {
  return 'MigrationData(code: $code, link: $link, importDeadline: $importDeadline)';
}


}

/// @nodoc
abstract mixin class _$MigrationDataCopyWith<$Res> implements $MigrationDataCopyWith<$Res> {
  factory _$MigrationDataCopyWith(_MigrationData value, $Res Function(_MigrationData) _then) = __$MigrationDataCopyWithImpl;
@override @useResult
$Res call({
 String code, String link,@DateTimeConverter() DateTime importDeadline
});




}
/// @nodoc
class __$MigrationDataCopyWithImpl<$Res>
    implements _$MigrationDataCopyWith<$Res> {
  __$MigrationDataCopyWithImpl(this._self, this._then);

  final _MigrationData _self;
  final $Res Function(_MigrationData) _then;

/// Create a copy of MigrationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? link = null,Object? importDeadline = null,}) {
  return _then(_MigrationData(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,importDeadline: null == importDeadline ? _self.importDeadline : importDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
