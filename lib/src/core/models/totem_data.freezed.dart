// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totem_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TotemData {

 String get providerId; String get totemId; String? get eventId; String? get requestId;
/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemDataCopyWith<TotemData> get copyWith => _$TotemDataCopyWithImpl<TotemData>(this as TotemData, _$identity);

  /// Serializes this TotemData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemData&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.totemId, totemId) || other.totemId == totemId)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,totemId,eventId,requestId);

@override
String toString() {
  return 'TotemData(providerId: $providerId, totemId: $totemId, eventId: $eventId, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $TotemDataCopyWith<$Res>  {
  factory $TotemDataCopyWith(TotemData value, $Res Function(TotemData) _then) = _$TotemDataCopyWithImpl;
@useResult
$Res call({
 String providerId, String totemId, String? eventId, String? requestId
});




}
/// @nodoc
class _$TotemDataCopyWithImpl<$Res>
    implements $TotemDataCopyWith<$Res> {
  _$TotemDataCopyWithImpl(this._self, this._then);

  final TotemData _self;
  final $Res Function(TotemData) _then;

/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? providerId = null,Object? totemId = null,Object? eventId = freezed,Object? requestId = freezed,}) {
  return _then(_self.copyWith(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,totemId: null == totemId ? _self.totemId : totemId // ignore: cast_nullable_to_non_nullable
as String,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TotemData].
extension TotemDataPatterns on TotemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotemData value)  $default,){
final _that = this;
switch (_that) {
case _TotemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotemData value)?  $default,){
final _that = this;
switch (_that) {
case _TotemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String providerId,  String totemId,  String? eventId,  String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotemData() when $default != null:
return $default(_that.providerId,_that.totemId,_that.eventId,_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String providerId,  String totemId,  String? eventId,  String? requestId)  $default,) {final _that = this;
switch (_that) {
case _TotemData():
return $default(_that.providerId,_that.totemId,_that.eventId,_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String providerId,  String totemId,  String? eventId,  String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _TotemData() when $default != null:
return $default(_that.providerId,_that.totemId,_that.eventId,_that.requestId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotemData implements TotemData {
  const _TotemData({required this.providerId, required this.totemId, this.eventId, this.requestId});
  factory _TotemData.fromJson(Map<String, dynamic> json) => _$TotemDataFromJson(json);

@override final  String providerId;
@override final  String totemId;
@override final  String? eventId;
@override final  String? requestId;

/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotemDataCopyWith<_TotemData> get copyWith => __$TotemDataCopyWithImpl<_TotemData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotemDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotemData&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.totemId, totemId) || other.totemId == totemId)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,totemId,eventId,requestId);

@override
String toString() {
  return 'TotemData(providerId: $providerId, totemId: $totemId, eventId: $eventId, requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$TotemDataCopyWith<$Res> implements $TotemDataCopyWith<$Res> {
  factory _$TotemDataCopyWith(_TotemData value, $Res Function(_TotemData) _then) = __$TotemDataCopyWithImpl;
@override @useResult
$Res call({
 String providerId, String totemId, String? eventId, String? requestId
});




}
/// @nodoc
class __$TotemDataCopyWithImpl<$Res>
    implements _$TotemDataCopyWith<$Res> {
  __$TotemDataCopyWithImpl(this._self, this._then);

  final _TotemData _self;
  final $Res Function(_TotemData) _then;

/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? providerId = null,Object? totemId = null,Object? eventId = freezed,Object? requestId = freezed,}) {
  return _then(_TotemData(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,totemId: null == totemId ? _self.totemId : totemId // ignore: cast_nullable_to_non_nullable
as String,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ConnectionTotemData {

 String get totemId; DateTime get timestamp; double get lat; double get long;
/// Create a copy of ConnectionTotemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionTotemDataCopyWith<ConnectionTotemData> get copyWith => _$ConnectionTotemDataCopyWithImpl<ConnectionTotemData>(this as ConnectionTotemData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionTotemData&&(identical(other.totemId, totemId) || other.totemId == totemId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}


@override
int get hashCode => Object.hash(runtimeType,totemId,timestamp,lat,long);

@override
String toString() {
  return 'ConnectionTotemData(totemId: $totemId, timestamp: $timestamp, lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class $ConnectionTotemDataCopyWith<$Res>  {
  factory $ConnectionTotemDataCopyWith(ConnectionTotemData value, $Res Function(ConnectionTotemData) _then) = _$ConnectionTotemDataCopyWithImpl;
@useResult
$Res call({
 String totemId, DateTime timestamp, double lat, double long
});




}
/// @nodoc
class _$ConnectionTotemDataCopyWithImpl<$Res>
    implements $ConnectionTotemDataCopyWith<$Res> {
  _$ConnectionTotemDataCopyWithImpl(this._self, this._then);

  final ConnectionTotemData _self;
  final $Res Function(ConnectionTotemData) _then;

/// Create a copy of ConnectionTotemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totemId = null,Object? timestamp = null,Object? lat = null,Object? long = null,}) {
  return _then(_self.copyWith(
totemId: null == totemId ? _self.totemId : totemId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionTotemData].
extension ConnectionTotemDataPatterns on ConnectionTotemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionTotemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionTotemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionTotemData value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionTotemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionTotemData value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionTotemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String totemId,  DateTime timestamp,  double lat,  double long)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionTotemData() when $default != null:
return $default(_that.totemId,_that.timestamp,_that.lat,_that.long);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String totemId,  DateTime timestamp,  double lat,  double long)  $default,) {final _that = this;
switch (_that) {
case _ConnectionTotemData():
return $default(_that.totemId,_that.timestamp,_that.lat,_that.long);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String totemId,  DateTime timestamp,  double lat,  double long)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionTotemData() when $default != null:
return $default(_that.totemId,_that.timestamp,_that.lat,_that.long);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectionTotemData implements ConnectionTotemData {
  const _ConnectionTotemData({required this.totemId, required this.timestamp, required this.lat, required this.long});
  

@override final  String totemId;
@override final  DateTime timestamp;
@override final  double lat;
@override final  double long;

/// Create a copy of ConnectionTotemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionTotemDataCopyWith<_ConnectionTotemData> get copyWith => __$ConnectionTotemDataCopyWithImpl<_ConnectionTotemData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionTotemData&&(identical(other.totemId, totemId) || other.totemId == totemId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}


@override
int get hashCode => Object.hash(runtimeType,totemId,timestamp,lat,long);

@override
String toString() {
  return 'ConnectionTotemData(totemId: $totemId, timestamp: $timestamp, lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class _$ConnectionTotemDataCopyWith<$Res> implements $ConnectionTotemDataCopyWith<$Res> {
  factory _$ConnectionTotemDataCopyWith(_ConnectionTotemData value, $Res Function(_ConnectionTotemData) _then) = __$ConnectionTotemDataCopyWithImpl;
@override @useResult
$Res call({
 String totemId, DateTime timestamp, double lat, double long
});




}
/// @nodoc
class __$ConnectionTotemDataCopyWithImpl<$Res>
    implements _$ConnectionTotemDataCopyWith<$Res> {
  __$ConnectionTotemDataCopyWithImpl(this._self, this._then);

  final _ConnectionTotemData _self;
  final $Res Function(_ConnectionTotemData) _then;

/// Create a copy of ConnectionTotemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totemId = null,Object? timestamp = null,Object? lat = null,Object? long = null,}) {
  return _then(_ConnectionTotemData(
totemId: null == totemId ? _self.totemId : totemId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
