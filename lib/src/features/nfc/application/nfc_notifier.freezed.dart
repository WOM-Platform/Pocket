// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NFCState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFCState()';
}


}

/// @nodoc
class $NFCStateCopyWith<$Res>  {
$NFCStateCopyWith(NFCState _, $Res Function(NFCState) __);
}


/// Adds pattern-matching-related methods to [NFCState].
extension NFCStatePatterns on NFCState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NFCStateData value)?  data,TResult Function( NFCStateListening value)?  listening,TResult Function( NFCStateUnavailable value)?  unavailable,TResult Function( NFCStateLoading value)?  loading,TResult Function( NFCStateInvalidData value)?  invalidData,TResult Function( NFCStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NFCStateData() when data != null:
return data(_that);case NFCStateListening() when listening != null:
return listening(_that);case NFCStateUnavailable() when unavailable != null:
return unavailable(_that);case NFCStateLoading() when loading != null:
return loading(_that);case NFCStateInvalidData() when invalidData != null:
return invalidData(_that);case NFCStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NFCStateData value)  data,required TResult Function( NFCStateListening value)  listening,required TResult Function( NFCStateUnavailable value)  unavailable,required TResult Function( NFCStateLoading value)  loading,required TResult Function( NFCStateInvalidData value)  invalidData,required TResult Function( NFCStateError value)  error,}){
final _that = this;
switch (_that) {
case NFCStateData():
return data(_that);case NFCStateListening():
return listening(_that);case NFCStateUnavailable():
return unavailable(_that);case NFCStateLoading():
return loading(_that);case NFCStateInvalidData():
return invalidData(_that);case NFCStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NFCStateData value)?  data,TResult? Function( NFCStateListening value)?  listening,TResult? Function( NFCStateUnavailable value)?  unavailable,TResult? Function( NFCStateLoading value)?  loading,TResult? Function( NFCStateInvalidData value)?  invalidData,TResult? Function( NFCStateError value)?  error,}){
final _that = this;
switch (_that) {
case NFCStateData() when data != null:
return data(_that);case NFCStateListening() when listening != null:
return listening(_that);case NFCStateUnavailable() when unavailable != null:
return unavailable(_that);case NFCStateLoading() when loading != null:
return loading(_that);case NFCStateInvalidData() when invalidData != null:
return invalidData(_that);case NFCStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TotemData totemData)?  data,TResult Function()?  listening,TResult Function()?  unavailable,TResult Function()?  loading,TResult Function()?  invalidData,TResult Function( Object error,  StackTrace st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NFCStateData() when data != null:
return data(_that.totemData);case NFCStateListening() when listening != null:
return listening();case NFCStateUnavailable() when unavailable != null:
return unavailable();case NFCStateLoading() when loading != null:
return loading();case NFCStateInvalidData() when invalidData != null:
return invalidData();case NFCStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TotemData totemData)  data,required TResult Function()  listening,required TResult Function()  unavailable,required TResult Function()  loading,required TResult Function()  invalidData,required TResult Function( Object error,  StackTrace st)  error,}) {final _that = this;
switch (_that) {
case NFCStateData():
return data(_that.totemData);case NFCStateListening():
return listening();case NFCStateUnavailable():
return unavailable();case NFCStateLoading():
return loading();case NFCStateInvalidData():
return invalidData();case NFCStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TotemData totemData)?  data,TResult? Function()?  listening,TResult? Function()?  unavailable,TResult? Function()?  loading,TResult? Function()?  invalidData,TResult? Function( Object error,  StackTrace st)?  error,}) {final _that = this;
switch (_that) {
case NFCStateData() when data != null:
return data(_that.totemData);case NFCStateListening() when listening != null:
return listening();case NFCStateUnavailable() when unavailable != null:
return unavailable();case NFCStateLoading() when loading != null:
return loading();case NFCStateInvalidData() when invalidData != null:
return invalidData();case NFCStateError() when error != null:
return error(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class NFCStateData implements NFCState {
  const NFCStateData({required this.totemData});
  

 final  TotemData totemData;

/// Create a copy of NFCState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFCStateDataCopyWith<NFCStateData> get copyWith => _$NFCStateDataCopyWithImpl<NFCStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCStateData&&(identical(other.totemData, totemData) || other.totemData == totemData));
}


@override
int get hashCode => Object.hash(runtimeType,totemData);

@override
String toString() {
  return 'NFCState.data(totemData: $totemData)';
}


}

/// @nodoc
abstract mixin class $NFCStateDataCopyWith<$Res> implements $NFCStateCopyWith<$Res> {
  factory $NFCStateDataCopyWith(NFCStateData value, $Res Function(NFCStateData) _then) = _$NFCStateDataCopyWithImpl;
@useResult
$Res call({
 TotemData totemData
});


$TotemDataCopyWith<$Res> get totemData;

}
/// @nodoc
class _$NFCStateDataCopyWithImpl<$Res>
    implements $NFCStateDataCopyWith<$Res> {
  _$NFCStateDataCopyWithImpl(this._self, this._then);

  final NFCStateData _self;
  final $Res Function(NFCStateData) _then;

/// Create a copy of NFCState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totemData = null,}) {
  return _then(NFCStateData(
totemData: null == totemData ? _self.totemData : totemData // ignore: cast_nullable_to_non_nullable
as TotemData,
  ));
}

/// Create a copy of NFCState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemDataCopyWith<$Res> get totemData {
  
  return $TotemDataCopyWith<$Res>(_self.totemData, (value) {
    return _then(_self.copyWith(totemData: value));
  });
}
}

/// @nodoc


class NFCStateListening implements NFCState {
  const NFCStateListening();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCStateListening);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFCState.listening()';
}


}




/// @nodoc


class NFCStateUnavailable implements NFCState {
  const NFCStateUnavailable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCStateUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFCState.unavailable()';
}


}




/// @nodoc


class NFCStateLoading implements NFCState {
  const NFCStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFCState.loading()';
}


}




/// @nodoc


class NFCStateInvalidData implements NFCState {
  const NFCStateInvalidData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCStateInvalidData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NFCState.invalidData()';
}


}




/// @nodoc


class NFCStateError implements NFCState {
  const NFCStateError(this.error, this.st);
  

 final  Object error;
 final  StackTrace st;

/// Create a copy of NFCState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFCStateErrorCopyWith<NFCStateError> get copyWith => _$NFCStateErrorCopyWithImpl<NFCStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'NFCState.error(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $NFCStateErrorCopyWith<$Res> implements $NFCStateCopyWith<$Res> {
  factory $NFCStateErrorCopyWith(NFCStateError value, $Res Function(NFCStateError) _then) = _$NFCStateErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace st
});




}
/// @nodoc
class _$NFCStateErrorCopyWithImpl<$Res>
    implements $NFCStateErrorCopyWith<$Res> {
  _$NFCStateErrorCopyWithImpl(this._self, this._then);

  final NFCStateError _self;
  final $Res Function(NFCStateError) _then;

/// Create a copy of NFCState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = null,}) {
  return _then(NFCStateError(
null == error ? _self.error : error ,null == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

// dart format on
