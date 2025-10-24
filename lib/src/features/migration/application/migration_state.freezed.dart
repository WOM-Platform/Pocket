// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MigrationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MigrationState()';
}


}

/// @nodoc
class $MigrationStateCopyWith<$Res>  {
$MigrationStateCopyWith(MigrationState _, $Res Function(MigrationState) __);
}


/// Adds pattern-matching-related methods to [MigrationState].
extension MigrationStatePatterns on MigrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MigrationStateData value)?  data,TResult Function( MigrationStateLoading value)?  loading,TResult Function( MigrationStateInitial value)?  initial,TResult Function( MigrationStateComplete value)?  complete,TResult Function( MigrationStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MigrationStateData() when data != null:
return data(_that);case MigrationStateLoading() when loading != null:
return loading(_that);case MigrationStateInitial() when initial != null:
return initial(_that);case MigrationStateComplete() when complete != null:
return complete(_that);case MigrationStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MigrationStateData value)  data,required TResult Function( MigrationStateLoading value)  loading,required TResult Function( MigrationStateInitial value)  initial,required TResult Function( MigrationStateComplete value)  complete,required TResult Function( MigrationStateError value)  error,}){
final _that = this;
switch (_that) {
case MigrationStateData():
return data(_that);case MigrationStateLoading():
return loading(_that);case MigrationStateInitial():
return initial(_that);case MigrationStateComplete():
return complete(_that);case MigrationStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MigrationStateData value)?  data,TResult? Function( MigrationStateLoading value)?  loading,TResult? Function( MigrationStateInitial value)?  initial,TResult? Function( MigrationStateComplete value)?  complete,TResult? Function( MigrationStateError value)?  error,}){
final _that = this;
switch (_that) {
case MigrationStateData() when data != null:
return data(_that);case MigrationStateLoading() when loading != null:
return loading(_that);case MigrationStateInitial() when initial != null:
return initial(_that);case MigrationStateComplete() when complete != null:
return complete(_that);case MigrationStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String pin,  int womsCount,  int totemsCount)?  data,TResult Function()?  loading,TResult Function()?  initial,TResult Function( MigrationData data)?  complete,TResult Function( Object error,  StackTrace st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MigrationStateData() when data != null:
return data(_that.pin,_that.womsCount,_that.totemsCount);case MigrationStateLoading() when loading != null:
return loading();case MigrationStateInitial() when initial != null:
return initial();case MigrationStateComplete() when complete != null:
return complete(_that.data);case MigrationStateError() when error != null:
return error(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String pin,  int womsCount,  int totemsCount)  data,required TResult Function()  loading,required TResult Function()  initial,required TResult Function( MigrationData data)  complete,required TResult Function( Object error,  StackTrace st)  error,}) {final _that = this;
switch (_that) {
case MigrationStateData():
return data(_that.pin,_that.womsCount,_that.totemsCount);case MigrationStateLoading():
return loading();case MigrationStateInitial():
return initial();case MigrationStateComplete():
return complete(_that.data);case MigrationStateError():
return error(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String pin,  int womsCount,  int totemsCount)?  data,TResult? Function()?  loading,TResult? Function()?  initial,TResult? Function( MigrationData data)?  complete,TResult? Function( Object error,  StackTrace st)?  error,}) {final _that = this;
switch (_that) {
case MigrationStateData() when data != null:
return data(_that.pin,_that.womsCount,_that.totemsCount);case MigrationStateLoading() when loading != null:
return loading();case MigrationStateInitial() when initial != null:
return initial();case MigrationStateComplete() when complete != null:
return complete(_that.data);case MigrationStateError() when error != null:
return error(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class MigrationStateData implements MigrationState {
  const MigrationStateData({required this.pin, required this.womsCount, required this.totemsCount});
  

 final  String pin;
 final  int womsCount;
 final  int totemsCount;

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MigrationStateDataCopyWith<MigrationStateData> get copyWith => _$MigrationStateDataCopyWithImpl<MigrationStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationStateData&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.womsCount, womsCount) || other.womsCount == womsCount)&&(identical(other.totemsCount, totemsCount) || other.totemsCount == totemsCount));
}


@override
int get hashCode => Object.hash(runtimeType,pin,womsCount,totemsCount);

@override
String toString() {
  return 'MigrationState.data(pin: $pin, womsCount: $womsCount, totemsCount: $totemsCount)';
}


}

/// @nodoc
abstract mixin class $MigrationStateDataCopyWith<$Res> implements $MigrationStateCopyWith<$Res> {
  factory $MigrationStateDataCopyWith(MigrationStateData value, $Res Function(MigrationStateData) _then) = _$MigrationStateDataCopyWithImpl;
@useResult
$Res call({
 String pin, int womsCount, int totemsCount
});




}
/// @nodoc
class _$MigrationStateDataCopyWithImpl<$Res>
    implements $MigrationStateDataCopyWith<$Res> {
  _$MigrationStateDataCopyWithImpl(this._self, this._then);

  final MigrationStateData _self;
  final $Res Function(MigrationStateData) _then;

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,Object? womsCount = null,Object? totemsCount = null,}) {
  return _then(MigrationStateData(
pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,womsCount: null == womsCount ? _self.womsCount : womsCount // ignore: cast_nullable_to_non_nullable
as int,totemsCount: null == totemsCount ? _self.totemsCount : totemsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MigrationStateLoading implements MigrationState {
  const MigrationStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MigrationState.loading()';
}


}




/// @nodoc


class MigrationStateInitial implements MigrationState {
  const MigrationStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MigrationState.initial()';
}


}




/// @nodoc


class MigrationStateComplete implements MigrationState {
  const MigrationStateComplete({required this.data});
  

 final  MigrationData data;

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MigrationStateCompleteCopyWith<MigrationStateComplete> get copyWith => _$MigrationStateCompleteCopyWithImpl<MigrationStateComplete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationStateComplete&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'MigrationState.complete(data: $data)';
}


}

/// @nodoc
abstract mixin class $MigrationStateCompleteCopyWith<$Res> implements $MigrationStateCopyWith<$Res> {
  factory $MigrationStateCompleteCopyWith(MigrationStateComplete value, $Res Function(MigrationStateComplete) _then) = _$MigrationStateCompleteCopyWithImpl;
@useResult
$Res call({
 MigrationData data
});


$MigrationDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MigrationStateCompleteCopyWithImpl<$Res>
    implements $MigrationStateCompleteCopyWith<$Res> {
  _$MigrationStateCompleteCopyWithImpl(this._self, this._then);

  final MigrationStateComplete _self;
  final $Res Function(MigrationStateComplete) _then;

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(MigrationStateComplete(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MigrationData,
  ));
}

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MigrationDataCopyWith<$Res> get data {
  
  return $MigrationDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class MigrationStateError implements MigrationState {
  const MigrationStateError(this.error, this.st);
  

 final  Object error;
 final  StackTrace st;

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MigrationStateErrorCopyWith<MigrationStateError> get copyWith => _$MigrationStateErrorCopyWithImpl<MigrationStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MigrationStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'MigrationState.error(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $MigrationStateErrorCopyWith<$Res> implements $MigrationStateCopyWith<$Res> {
  factory $MigrationStateErrorCopyWith(MigrationStateError value, $Res Function(MigrationStateError) _then) = _$MigrationStateErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace st
});




}
/// @nodoc
class _$MigrationStateErrorCopyWithImpl<$Res>
    implements $MigrationStateErrorCopyWith<$Res> {
  _$MigrationStateErrorCopyWithImpl(this._self, this._then);

  final MigrationStateError _self;
  final $Res Function(MigrationStateError) _then;

/// Create a copy of MigrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = null,}) {
  return _then(MigrationStateError(
null == error ? _self.error : error ,null == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

// dart format on
