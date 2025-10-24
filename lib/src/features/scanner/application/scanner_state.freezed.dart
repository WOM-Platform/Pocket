// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState()';
}


}

/// @nodoc
class $ScannerStateCopyWith<$Res>  {
$ScannerStateCopyWith(ScannerState _, $Res Function(ScannerState) __);
}


/// Adds pattern-matching-related methods to [ScannerState].
extension ScannerStatePatterns on ScannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScannerStateSingle value)?  single,TResult Function( ScannerStateMultiple value)?  multiple,TResult Function( ScannerStateProcessing value)?  processing,TResult Function( ScannerStateEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScannerStateSingle() when single != null:
return single(_that);case ScannerStateMultiple() when multiple != null:
return multiple(_that);case ScannerStateProcessing() when processing != null:
return processing(_that);case ScannerStateEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScannerStateSingle value)  single,required TResult Function( ScannerStateMultiple value)  multiple,required TResult Function( ScannerStateProcessing value)  processing,required TResult Function( ScannerStateEmpty value)  empty,}){
final _that = this;
switch (_that) {
case ScannerStateSingle():
return single(_that);case ScannerStateMultiple():
return multiple(_that);case ScannerStateProcessing():
return processing(_that);case ScannerStateEmpty():
return empty(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScannerStateSingle value)?  single,TResult? Function( ScannerStateMultiple value)?  multiple,TResult? Function( ScannerStateProcessing value)?  processing,TResult? Function( ScannerStateEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case ScannerStateSingle() when single != null:
return single(_that);case ScannerStateMultiple() when multiple != null:
return multiple(_that);case ScannerStateProcessing() when processing != null:
return processing(_that);case ScannerStateEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String url,  int total,  ScanAction scanAction,  TotemData? totemData)?  single,TResult Function( int total)?  multiple,TResult Function()?  processing,TResult Function( int total)?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScannerStateSingle() when single != null:
return single(_that.url,_that.total,_that.scanAction,_that.totemData);case ScannerStateMultiple() when multiple != null:
return multiple(_that.total);case ScannerStateProcessing() when processing != null:
return processing();case ScannerStateEmpty() when empty != null:
return empty(_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String url,  int total,  ScanAction scanAction,  TotemData? totemData)  single,required TResult Function( int total)  multiple,required TResult Function()  processing,required TResult Function( int total)  empty,}) {final _that = this;
switch (_that) {
case ScannerStateSingle():
return single(_that.url,_that.total,_that.scanAction,_that.totemData);case ScannerStateMultiple():
return multiple(_that.total);case ScannerStateProcessing():
return processing();case ScannerStateEmpty():
return empty(_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String url,  int total,  ScanAction scanAction,  TotemData? totemData)?  single,TResult? Function( int total)?  multiple,TResult? Function()?  processing,TResult? Function( int total)?  empty,}) {final _that = this;
switch (_that) {
case ScannerStateSingle() when single != null:
return single(_that.url,_that.total,_that.scanAction,_that.totemData);case ScannerStateMultiple() when multiple != null:
return multiple(_that.total);case ScannerStateProcessing() when processing != null:
return processing();case ScannerStateEmpty() when empty != null:
return empty(_that.total);case _:
  return null;

}
}

}

/// @nodoc


class ScannerStateSingle implements ScannerState {
  const ScannerStateSingle({required this.url, required this.total, required this.scanAction, this.totemData});
  

 final  String url;
 final  int total;
 final  ScanAction scanAction;
 final  TotemData? totemData;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerStateSingleCopyWith<ScannerStateSingle> get copyWith => _$ScannerStateSingleCopyWithImpl<ScannerStateSingle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerStateSingle&&(identical(other.url, url) || other.url == url)&&(identical(other.total, total) || other.total == total)&&(identical(other.scanAction, scanAction) || other.scanAction == scanAction)&&(identical(other.totemData, totemData) || other.totemData == totemData));
}


@override
int get hashCode => Object.hash(runtimeType,url,total,scanAction,totemData);

@override
String toString() {
  return 'ScannerState.single(url: $url, total: $total, scanAction: $scanAction, totemData: $totemData)';
}


}

/// @nodoc
abstract mixin class $ScannerStateSingleCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScannerStateSingleCopyWith(ScannerStateSingle value, $Res Function(ScannerStateSingle) _then) = _$ScannerStateSingleCopyWithImpl;
@useResult
$Res call({
 String url, int total, ScanAction scanAction, TotemData? totemData
});


$TotemDataCopyWith<$Res>? get totemData;

}
/// @nodoc
class _$ScannerStateSingleCopyWithImpl<$Res>
    implements $ScannerStateSingleCopyWith<$Res> {
  _$ScannerStateSingleCopyWithImpl(this._self, this._then);

  final ScannerStateSingle _self;
  final $Res Function(ScannerStateSingle) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,Object? total = null,Object? scanAction = null,Object? totemData = freezed,}) {
  return _then(ScannerStateSingle(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,scanAction: null == scanAction ? _self.scanAction : scanAction // ignore: cast_nullable_to_non_nullable
as ScanAction,totemData: freezed == totemData ? _self.totemData : totemData // ignore: cast_nullable_to_non_nullable
as TotemData?,
  ));
}

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemDataCopyWith<$Res>? get totemData {
    if (_self.totemData == null) {
    return null;
  }

  return $TotemDataCopyWith<$Res>(_self.totemData!, (value) {
    return _then(_self.copyWith(totemData: value));
  });
}
}

/// @nodoc


class ScannerStateMultiple implements ScannerState {
  const ScannerStateMultiple({required this.total});
  

 final  int total;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerStateMultipleCopyWith<ScannerStateMultiple> get copyWith => _$ScannerStateMultipleCopyWithImpl<ScannerStateMultiple>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerStateMultiple&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'ScannerState.multiple(total: $total)';
}


}

/// @nodoc
abstract mixin class $ScannerStateMultipleCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScannerStateMultipleCopyWith(ScannerStateMultiple value, $Res Function(ScannerStateMultiple) _then) = _$ScannerStateMultipleCopyWithImpl;
@useResult
$Res call({
 int total
});




}
/// @nodoc
class _$ScannerStateMultipleCopyWithImpl<$Res>
    implements $ScannerStateMultipleCopyWith<$Res> {
  _$ScannerStateMultipleCopyWithImpl(this._self, this._then);

  final ScannerStateMultiple _self;
  final $Res Function(ScannerStateMultiple) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? total = null,}) {
  return _then(ScannerStateMultiple(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ScannerStateProcessing implements ScannerState {
  const ScannerStateProcessing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerStateProcessing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState.processing()';
}


}




/// @nodoc


class ScannerStateEmpty implements ScannerState {
  const ScannerStateEmpty({required this.total});
  

 final  int total;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerStateEmptyCopyWith<ScannerStateEmpty> get copyWith => _$ScannerStateEmptyCopyWithImpl<ScannerStateEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerStateEmpty&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'ScannerState.empty(total: $total)';
}


}

/// @nodoc
abstract mixin class $ScannerStateEmptyCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScannerStateEmptyCopyWith(ScannerStateEmpty value, $Res Function(ScannerStateEmpty) _then) = _$ScannerStateEmptyCopyWithImpl;
@useResult
$Res call({
 int total
});




}
/// @nodoc
class _$ScannerStateEmptyCopyWithImpl<$Res>
    implements $ScannerStateEmptyCopyWith<$Res> {
  _$ScannerStateEmptyCopyWithImpl(this._self, this._then);

  final ScannerStateEmpty _self;
  final $Res Function(ScannerStateEmpty) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? total = null,}) {
  return _then(ScannerStateEmpty(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
