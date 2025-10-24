// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionModel {

@TransactionTypeConverter() TransactionType get type; String get source;// required String country,
@JsonKey(name: 'Aim') String get aimCode;@DateTimeConverter()@JsonKey(name: 'Timestamp') DateTime get date;// @JsonKey(name: 'Aim') required Aim aim,
@JsonKey(name: 'Id') int get id; int get size; String? get ackUrl; String? get pin; String? get link;@DateTimeConverter() DateTime? get importDeadline;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.type, type) || other.type == type)&&(identical(other.source, source) || other.source == source)&&(identical(other.aimCode, aimCode) || other.aimCode == aimCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.ackUrl, ackUrl) || other.ackUrl == ackUrl)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.link, link) || other.link == link)&&(identical(other.importDeadline, importDeadline) || other.importDeadline == importDeadline));
}


@override
int get hashCode => Object.hash(runtimeType,type,source,aimCode,date,id,size,ackUrl,pin,link,importDeadline);

@override
String toString() {
  return 'TransactionModel(type: $type, source: $source, aimCode: $aimCode, date: $date, id: $id, size: $size, ackUrl: $ackUrl, pin: $pin, link: $link, importDeadline: $importDeadline)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
@TransactionTypeConverter() TransactionType type, String source,@JsonKey(name: 'Aim') String aimCode,@DateTimeConverter()@JsonKey(name: 'Timestamp') DateTime date,@JsonKey(name: 'Id') int id, int size, String? ackUrl, String? pin, String? link,@DateTimeConverter() DateTime? importDeadline
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? source = null,Object? aimCode = null,Object? date = null,Object? id = null,Object? size = null,Object? ackUrl = freezed,Object? pin = freezed,Object? link = freezed,Object? importDeadline = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,aimCode: null == aimCode ? _self.aimCode : aimCode // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,ackUrl: freezed == ackUrl ? _self.ackUrl : ackUrl // ignore: cast_nullable_to_non_nullable
as String?,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,importDeadline: freezed == importDeadline ? _self.importDeadline : importDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@TransactionTypeConverter()  TransactionType type,  String source, @JsonKey(name: 'Aim')  String aimCode, @DateTimeConverter()@JsonKey(name: 'Timestamp')  DateTime date, @JsonKey(name: 'Id')  int id,  int size,  String? ackUrl,  String? pin,  String? link, @DateTimeConverter()  DateTime? importDeadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.type,_that.source,_that.aimCode,_that.date,_that.id,_that.size,_that.ackUrl,_that.pin,_that.link,_that.importDeadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@TransactionTypeConverter()  TransactionType type,  String source, @JsonKey(name: 'Aim')  String aimCode, @DateTimeConverter()@JsonKey(name: 'Timestamp')  DateTime date, @JsonKey(name: 'Id')  int id,  int size,  String? ackUrl,  String? pin,  String? link, @DateTimeConverter()  DateTime? importDeadline)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.type,_that.source,_that.aimCode,_that.date,_that.id,_that.size,_that.ackUrl,_that.pin,_that.link,_that.importDeadline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@TransactionTypeConverter()  TransactionType type,  String source, @JsonKey(name: 'Aim')  String aimCode, @DateTimeConverter()@JsonKey(name: 'Timestamp')  DateTime date, @JsonKey(name: 'Id')  int id,  int size,  String? ackUrl,  String? pin,  String? link, @DateTimeConverter()  DateTime? importDeadline)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.type,_that.source,_that.aimCode,_that.date,_that.id,_that.size,_that.ackUrl,_that.pin,_that.link,_that.importDeadline);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionModel implements TransactionModel {
  const _TransactionModel({@TransactionTypeConverter() required this.type, required this.source, @JsonKey(name: 'Aim') required this.aimCode, @DateTimeConverter()@JsonKey(name: 'Timestamp') required this.date, @JsonKey(name: 'Id') required this.id, required this.size, this.ackUrl, this.pin, this.link, @DateTimeConverter() this.importDeadline});
  

@override@TransactionTypeConverter() final  TransactionType type;
@override final  String source;
// required String country,
@override@JsonKey(name: 'Aim') final  String aimCode;
@override@DateTimeConverter()@JsonKey(name: 'Timestamp') final  DateTime date;
// @JsonKey(name: 'Aim') required Aim aim,
@override@JsonKey(name: 'Id') final  int id;
@override final  int size;
@override final  String? ackUrl;
@override final  String? pin;
@override final  String? link;
@override@DateTimeConverter() final  DateTime? importDeadline;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.type, type) || other.type == type)&&(identical(other.source, source) || other.source == source)&&(identical(other.aimCode, aimCode) || other.aimCode == aimCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.ackUrl, ackUrl) || other.ackUrl == ackUrl)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.link, link) || other.link == link)&&(identical(other.importDeadline, importDeadline) || other.importDeadline == importDeadline));
}


@override
int get hashCode => Object.hash(runtimeType,type,source,aimCode,date,id,size,ackUrl,pin,link,importDeadline);

@override
String toString() {
  return 'TransactionModel(type: $type, source: $source, aimCode: $aimCode, date: $date, id: $id, size: $size, ackUrl: $ackUrl, pin: $pin, link: $link, importDeadline: $importDeadline)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
@TransactionTypeConverter() TransactionType type, String source,@JsonKey(name: 'Aim') String aimCode,@DateTimeConverter()@JsonKey(name: 'Timestamp') DateTime date,@JsonKey(name: 'Id') int id, int size, String? ackUrl, String? pin, String? link,@DateTimeConverter() DateTime? importDeadline
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? source = null,Object? aimCode = null,Object? date = null,Object? id = null,Object? size = null,Object? ackUrl = freezed,Object? pin = freezed,Object? link = freezed,Object? importDeadline = freezed,}) {
  return _then(_TransactionModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,aimCode: null == aimCode ? _self.aimCode : aimCode // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,ackUrl: freezed == ackUrl ? _self.ackUrl : ackUrl // ignore: cast_nullable_to_non_nullable
as String?,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,importDeadline: freezed == importDeadline ? _self.importDeadline : importDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
