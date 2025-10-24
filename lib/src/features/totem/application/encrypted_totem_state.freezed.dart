// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encrypted_totem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EncryptedTotemState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncryptedTotemState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EncryptedTotemState()';
}


}

/// @nodoc
class $EncryptedTotemStateCopyWith<$Res>  {
$EncryptedTotemStateCopyWith(EncryptedTotemState _, $Res Function(EncryptedTotemState) __);
}


/// Adds pattern-matching-related methods to [EncryptedTotemState].
extension EncryptedTotemStatePatterns on EncryptedTotemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EncryptedTotemStateLoading value)?  loading,TResult Function( EncryptedTotemStateInvalid value)?  invalid,TResult Function( EncryptedTotemStateFailure value)?  failure,TResult Function( EncryptedTotemStateCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EncryptedTotemStateLoading() when loading != null:
return loading(_that);case EncryptedTotemStateInvalid() when invalid != null:
return invalid(_that);case EncryptedTotemStateFailure() when failure != null:
return failure(_that);case EncryptedTotemStateCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EncryptedTotemStateLoading value)  loading,required TResult Function( EncryptedTotemStateInvalid value)  invalid,required TResult Function( EncryptedTotemStateFailure value)  failure,required TResult Function( EncryptedTotemStateCompleted value)  completed,}){
final _that = this;
switch (_that) {
case EncryptedTotemStateLoading():
return loading(_that);case EncryptedTotemStateInvalid():
return invalid(_that);case EncryptedTotemStateFailure():
return failure(_that);case EncryptedTotemStateCompleted():
return completed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EncryptedTotemStateLoading value)?  loading,TResult? Function( EncryptedTotemStateInvalid value)?  invalid,TResult? Function( EncryptedTotemStateFailure value)?  failure,TResult? Function( EncryptedTotemStateCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case EncryptedTotemStateLoading() when loading != null:
return loading(_that);case EncryptedTotemStateInvalid() when invalid != null:
return invalid(_that);case EncryptedTotemStateFailure() when failure != null:
return failure(_that);case EncryptedTotemStateCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  invalid,TResult Function( PersonalTotemFailure failure)?  failure,TResult Function( TotemData totemData)?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EncryptedTotemStateLoading() when loading != null:
return loading();case EncryptedTotemStateInvalid() when invalid != null:
return invalid();case EncryptedTotemStateFailure() when failure != null:
return failure(_that.failure);case EncryptedTotemStateCompleted() when completed != null:
return completed(_that.totemData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  invalid,required TResult Function( PersonalTotemFailure failure)  failure,required TResult Function( TotemData totemData)  completed,}) {final _that = this;
switch (_that) {
case EncryptedTotemStateLoading():
return loading();case EncryptedTotemStateInvalid():
return invalid();case EncryptedTotemStateFailure():
return failure(_that.failure);case EncryptedTotemStateCompleted():
return completed(_that.totemData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  invalid,TResult? Function( PersonalTotemFailure failure)?  failure,TResult? Function( TotemData totemData)?  completed,}) {final _that = this;
switch (_that) {
case EncryptedTotemStateLoading() when loading != null:
return loading();case EncryptedTotemStateInvalid() when invalid != null:
return invalid();case EncryptedTotemStateFailure() when failure != null:
return failure(_that.failure);case EncryptedTotemStateCompleted() when completed != null:
return completed(_that.totemData);case _:
  return null;

}
}

}

/// @nodoc


class EncryptedTotemStateLoading implements EncryptedTotemState {
  const EncryptedTotemStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncryptedTotemStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EncryptedTotemState.loading()';
}


}




/// @nodoc


class EncryptedTotemStateInvalid implements EncryptedTotemState {
  const EncryptedTotemStateInvalid();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncryptedTotemStateInvalid);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EncryptedTotemState.invalid()';
}


}




/// @nodoc


class EncryptedTotemStateFailure implements EncryptedTotemState {
  const EncryptedTotemStateFailure({required this.failure});
  

 final  PersonalTotemFailure failure;

/// Create a copy of EncryptedTotemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncryptedTotemStateFailureCopyWith<EncryptedTotemStateFailure> get copyWith => _$EncryptedTotemStateFailureCopyWithImpl<EncryptedTotemStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncryptedTotemStateFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'EncryptedTotemState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $EncryptedTotemStateFailureCopyWith<$Res> implements $EncryptedTotemStateCopyWith<$Res> {
  factory $EncryptedTotemStateFailureCopyWith(EncryptedTotemStateFailure value, $Res Function(EncryptedTotemStateFailure) _then) = _$EncryptedTotemStateFailureCopyWithImpl;
@useResult
$Res call({
 PersonalTotemFailure failure
});




}
/// @nodoc
class _$EncryptedTotemStateFailureCopyWithImpl<$Res>
    implements $EncryptedTotemStateFailureCopyWith<$Res> {
  _$EncryptedTotemStateFailureCopyWithImpl(this._self, this._then);

  final EncryptedTotemStateFailure _self;
  final $Res Function(EncryptedTotemStateFailure) _then;

/// Create a copy of EncryptedTotemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(EncryptedTotemStateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as PersonalTotemFailure,
  ));
}


}

/// @nodoc


class EncryptedTotemStateCompleted implements EncryptedTotemState {
  const EncryptedTotemStateCompleted({required this.totemData});
  

 final  TotemData totemData;

/// Create a copy of EncryptedTotemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncryptedTotemStateCompletedCopyWith<EncryptedTotemStateCompleted> get copyWith => _$EncryptedTotemStateCompletedCopyWithImpl<EncryptedTotemStateCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncryptedTotemStateCompleted&&(identical(other.totemData, totemData) || other.totemData == totemData));
}


@override
int get hashCode => Object.hash(runtimeType,totemData);

@override
String toString() {
  return 'EncryptedTotemState.completed(totemData: $totemData)';
}


}

/// @nodoc
abstract mixin class $EncryptedTotemStateCompletedCopyWith<$Res> implements $EncryptedTotemStateCopyWith<$Res> {
  factory $EncryptedTotemStateCompletedCopyWith(EncryptedTotemStateCompleted value, $Res Function(EncryptedTotemStateCompleted) _then) = _$EncryptedTotemStateCompletedCopyWithImpl;
@useResult
$Res call({
 TotemData totemData
});


$TotemDataCopyWith<$Res> get totemData;

}
/// @nodoc
class _$EncryptedTotemStateCompletedCopyWithImpl<$Res>
    implements $EncryptedTotemStateCompletedCopyWith<$Res> {
  _$EncryptedTotemStateCompletedCopyWithImpl(this._self, this._then);

  final EncryptedTotemStateCompleted _self;
  final $Res Function(EncryptedTotemStateCompleted) _then;

/// Create a copy of EncryptedTotemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totemData = null,}) {
  return _then(EncryptedTotemStateCompleted(
totemData: null == totemData ? _self.totemData : totemData // ignore: cast_nullable_to_non_nullable
as TotemData,
  ));
}

/// Create a copy of EncryptedTotemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemDataCopyWith<$Res> get totemData {
  
  return $TotemDataCopyWith<$Res>(_self.totemData, (value) {
    return _then(_self.copyWith(totemData: value));
  });
}
}

// dart format on
