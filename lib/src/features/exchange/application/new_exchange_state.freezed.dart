// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_exchange_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewExchangeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewExchangeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewExchangeState()';
}


}

/// @nodoc
class $NewExchangeStateCopyWith<$Res>  {
$NewExchangeStateCopyWith(NewExchangeState _, $Res Function(NewExchangeState) __);
}


/// Adds pattern-matching-related methods to [NewExchangeState].
extension NewExchangeStatePatterns on NewExchangeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NewExchangeStateData value)?  data,TResult Function( NewExchangeStateLoading value)?  loading,TResult Function( NewExchangeStateinsufficientVouchers value)?  insufficientVouchers,TResult Function( NewExchangeStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NewExchangeStateData() when data != null:
return data(_that);case NewExchangeStateLoading() when loading != null:
return loading(_that);case NewExchangeStateinsufficientVouchers() when insufficientVouchers != null:
return insufficientVouchers(_that);case NewExchangeStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NewExchangeStateData value)  data,required TResult Function( NewExchangeStateLoading value)  loading,required TResult Function( NewExchangeStateinsufficientVouchers value)  insufficientVouchers,required TResult Function( NewExchangeStateError value)  error,}){
final _that = this;
switch (_that) {
case NewExchangeStateData():
return data(_that);case NewExchangeStateLoading():
return loading(_that);case NewExchangeStateinsufficientVouchers():
return insufficientVouchers(_that);case NewExchangeStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NewExchangeStateData value)?  data,TResult? Function( NewExchangeStateLoading value)?  loading,TResult? Function( NewExchangeStateinsufficientVouchers value)?  insufficientVouchers,TResult? Function( NewExchangeStateError value)?  error,}){
final _that = this;
switch (_that) {
case NewExchangeStateData() when data != null:
return data(_that);case NewExchangeStateLoading() when loading != null:
return loading(_that);case NewExchangeStateinsufficientVouchers() when insufficientVouchers != null:
return insufficientVouchers(_that);case NewExchangeStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String link,  String pin,  int womCount)?  data,TResult Function()?  loading,TResult Function()?  insufficientVouchers,TResult Function( Object error,  StackTrace st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NewExchangeStateData() when data != null:
return data(_that.link,_that.pin,_that.womCount);case NewExchangeStateLoading() when loading != null:
return loading();case NewExchangeStateinsufficientVouchers() when insufficientVouchers != null:
return insufficientVouchers();case NewExchangeStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String link,  String pin,  int womCount)  data,required TResult Function()  loading,required TResult Function()  insufficientVouchers,required TResult Function( Object error,  StackTrace st)  error,}) {final _that = this;
switch (_that) {
case NewExchangeStateData():
return data(_that.link,_that.pin,_that.womCount);case NewExchangeStateLoading():
return loading();case NewExchangeStateinsufficientVouchers():
return insufficientVouchers();case NewExchangeStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String link,  String pin,  int womCount)?  data,TResult? Function()?  loading,TResult? Function()?  insufficientVouchers,TResult? Function( Object error,  StackTrace st)?  error,}) {final _that = this;
switch (_that) {
case NewExchangeStateData() when data != null:
return data(_that.link,_that.pin,_that.womCount);case NewExchangeStateLoading() when loading != null:
return loading();case NewExchangeStateinsufficientVouchers() when insufficientVouchers != null:
return insufficientVouchers();case NewExchangeStateError() when error != null:
return error(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class NewExchangeStateData implements NewExchangeState {
  const NewExchangeStateData({required this.link, required this.pin, required this.womCount});
  

 final  String link;
 final  String pin;
 final  int womCount;

/// Create a copy of NewExchangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewExchangeStateDataCopyWith<NewExchangeStateData> get copyWith => _$NewExchangeStateDataCopyWithImpl<NewExchangeStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewExchangeStateData&&(identical(other.link, link) || other.link == link)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.womCount, womCount) || other.womCount == womCount));
}


@override
int get hashCode => Object.hash(runtimeType,link,pin,womCount);

@override
String toString() {
  return 'NewExchangeState.data(link: $link, pin: $pin, womCount: $womCount)';
}


}

/// @nodoc
abstract mixin class $NewExchangeStateDataCopyWith<$Res> implements $NewExchangeStateCopyWith<$Res> {
  factory $NewExchangeStateDataCopyWith(NewExchangeStateData value, $Res Function(NewExchangeStateData) _then) = _$NewExchangeStateDataCopyWithImpl;
@useResult
$Res call({
 String link, String pin, int womCount
});




}
/// @nodoc
class _$NewExchangeStateDataCopyWithImpl<$Res>
    implements $NewExchangeStateDataCopyWith<$Res> {
  _$NewExchangeStateDataCopyWithImpl(this._self, this._then);

  final NewExchangeStateData _self;
  final $Res Function(NewExchangeStateData) _then;

/// Create a copy of NewExchangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? link = null,Object? pin = null,Object? womCount = null,}) {
  return _then(NewExchangeStateData(
link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,womCount: null == womCount ? _self.womCount : womCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NewExchangeStateLoading implements NewExchangeState {
  const NewExchangeStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewExchangeStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewExchangeState.loading()';
}


}




/// @nodoc


class NewExchangeStateinsufficientVouchers implements NewExchangeState {
  const NewExchangeStateinsufficientVouchers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewExchangeStateinsufficientVouchers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewExchangeState.insufficientVouchers()';
}


}




/// @nodoc


class NewExchangeStateError implements NewExchangeState {
  const NewExchangeStateError(this.error, this.st);
  

 final  Object error;
 final  StackTrace st;

/// Create a copy of NewExchangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewExchangeStateErrorCopyWith<NewExchangeStateError> get copyWith => _$NewExchangeStateErrorCopyWithImpl<NewExchangeStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewExchangeStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'NewExchangeState.error(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $NewExchangeStateErrorCopyWith<$Res> implements $NewExchangeStateCopyWith<$Res> {
  factory $NewExchangeStateErrorCopyWith(NewExchangeStateError value, $Res Function(NewExchangeStateError) _then) = _$NewExchangeStateErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace st
});




}
/// @nodoc
class _$NewExchangeStateErrorCopyWithImpl<$Res>
    implements $NewExchangeStateErrorCopyWith<$Res> {
  _$NewExchangeStateErrorCopyWithImpl(this._self, this._then);

  final NewExchangeStateError _self;
  final $Res Function(NewExchangeStateError) _then;

/// Create a copy of NewExchangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = null,}) {
  return _then(NewExchangeStateError(
null == error ? _self.error : error ,null == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

/// @nodoc
mixin _$ExchangeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExchangeState()';
}


}

/// @nodoc
class $ExchangeStateCopyWith<$Res>  {
$ExchangeStateCopyWith(ExchangeState _, $Res Function(ExchangeState) __);
}


/// Adds pattern-matching-related methods to [ExchangeState].
extension ExchangeStatePatterns on ExchangeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExchangeStateInitial value)?  initial,TResult Function( ExchangeStateLoading value)?  loading,TResult Function( ExchangeStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExchangeStateInitial() when initial != null:
return initial(_that);case ExchangeStateLoading() when loading != null:
return loading(_that);case ExchangeStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExchangeStateInitial value)  initial,required TResult Function( ExchangeStateLoading value)  loading,required TResult Function( ExchangeStateError value)  error,}){
final _that = this;
switch (_that) {
case ExchangeStateInitial():
return initial(_that);case ExchangeStateLoading():
return loading(_that);case ExchangeStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExchangeStateInitial value)?  initial,TResult? Function( ExchangeStateLoading value)?  loading,TResult? Function( ExchangeStateError value)?  error,}){
final _that = this;
switch (_that) {
case ExchangeStateInitial() when initial != null:
return initial(_that);case ExchangeStateLoading() when loading != null:
return loading(_that);case ExchangeStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int dailyAvailableWom,  int totalAvailableWom)?  initial,TResult Function()?  loading,TResult Function( Object error,  StackTrace st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExchangeStateInitial() when initial != null:
return initial(_that.dailyAvailableWom,_that.totalAvailableWom);case ExchangeStateLoading() when loading != null:
return loading();case ExchangeStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int dailyAvailableWom,  int totalAvailableWom)  initial,required TResult Function()  loading,required TResult Function( Object error,  StackTrace st)  error,}) {final _that = this;
switch (_that) {
case ExchangeStateInitial():
return initial(_that.dailyAvailableWom,_that.totalAvailableWom);case ExchangeStateLoading():
return loading();case ExchangeStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int dailyAvailableWom,  int totalAvailableWom)?  initial,TResult? Function()?  loading,TResult? Function( Object error,  StackTrace st)?  error,}) {final _that = this;
switch (_that) {
case ExchangeStateInitial() when initial != null:
return initial(_that.dailyAvailableWom,_that.totalAvailableWom);case ExchangeStateLoading() when loading != null:
return loading();case ExchangeStateError() when error != null:
return error(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class ExchangeStateInitial implements ExchangeState {
  const ExchangeStateInitial({required this.dailyAvailableWom, required this.totalAvailableWom});
  

 final  int dailyAvailableWom;
 final  int totalAvailableWom;

/// Create a copy of ExchangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeStateInitialCopyWith<ExchangeStateInitial> get copyWith => _$ExchangeStateInitialCopyWithImpl<ExchangeStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeStateInitial&&(identical(other.dailyAvailableWom, dailyAvailableWom) || other.dailyAvailableWom == dailyAvailableWom)&&(identical(other.totalAvailableWom, totalAvailableWom) || other.totalAvailableWom == totalAvailableWom));
}


@override
int get hashCode => Object.hash(runtimeType,dailyAvailableWom,totalAvailableWom);

@override
String toString() {
  return 'ExchangeState.initial(dailyAvailableWom: $dailyAvailableWom, totalAvailableWom: $totalAvailableWom)';
}


}

/// @nodoc
abstract mixin class $ExchangeStateInitialCopyWith<$Res> implements $ExchangeStateCopyWith<$Res> {
  factory $ExchangeStateInitialCopyWith(ExchangeStateInitial value, $Res Function(ExchangeStateInitial) _then) = _$ExchangeStateInitialCopyWithImpl;
@useResult
$Res call({
 int dailyAvailableWom, int totalAvailableWom
});




}
/// @nodoc
class _$ExchangeStateInitialCopyWithImpl<$Res>
    implements $ExchangeStateInitialCopyWith<$Res> {
  _$ExchangeStateInitialCopyWithImpl(this._self, this._then);

  final ExchangeStateInitial _self;
  final $Res Function(ExchangeStateInitial) _then;

/// Create a copy of ExchangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dailyAvailableWom = null,Object? totalAvailableWom = null,}) {
  return _then(ExchangeStateInitial(
dailyAvailableWom: null == dailyAvailableWom ? _self.dailyAvailableWom : dailyAvailableWom // ignore: cast_nullable_to_non_nullable
as int,totalAvailableWom: null == totalAvailableWom ? _self.totalAvailableWom : totalAvailableWom // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ExchangeStateLoading implements ExchangeState {
  const ExchangeStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExchangeState.loading()';
}


}




/// @nodoc


class ExchangeStateError implements ExchangeState {
  const ExchangeStateError(this.error, this.st);
  

 final  Object error;
 final  StackTrace st;

/// Create a copy of ExchangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeStateErrorCopyWith<ExchangeStateError> get copyWith => _$ExchangeStateErrorCopyWithImpl<ExchangeStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'ExchangeState.error(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $ExchangeStateErrorCopyWith<$Res> implements $ExchangeStateCopyWith<$Res> {
  factory $ExchangeStateErrorCopyWith(ExchangeStateError value, $Res Function(ExchangeStateError) _then) = _$ExchangeStateErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace st
});




}
/// @nodoc
class _$ExchangeStateErrorCopyWithImpl<$Res>
    implements $ExchangeStateErrorCopyWith<$Res> {
  _$ExchangeStateErrorCopyWithImpl(this._self, this._then);

  final ExchangeStateError _self;
  final $Res Function(ExchangeStateError) _then;

/// Create a copy of ExchangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = null,}) {
  return _then(ExchangeStateError(
null == error ? _self.error : error ,null == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

// dart format on
