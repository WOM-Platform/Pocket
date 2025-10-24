// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OffersMapData {

 List<OfferPOS> get offers; Set<Marker> get markers; bool get isLoading;
/// Create a copy of OffersMapData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OffersMapDataCopyWith<OffersMapData> get copyWith => _$OffersMapDataCopyWithImpl<OffersMapData>(this as OffersMapData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersMapData&&const DeepCollectionEquality().equals(other.offers, offers)&&const DeepCollectionEquality().equals(other.markers, markers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(offers),const DeepCollectionEquality().hash(markers),isLoading);

@override
String toString() {
  return 'OffersMapData(offers: $offers, markers: $markers, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $OffersMapDataCopyWith<$Res>  {
  factory $OffersMapDataCopyWith(OffersMapData value, $Res Function(OffersMapData) _then) = _$OffersMapDataCopyWithImpl;
@useResult
$Res call({
 List<OfferPOS> offers, Set<Marker> markers, bool isLoading
});




}
/// @nodoc
class _$OffersMapDataCopyWithImpl<$Res>
    implements $OffersMapDataCopyWith<$Res> {
  _$OffersMapDataCopyWithImpl(this._self, this._then);

  final OffersMapData _self;
  final $Res Function(OffersMapData) _then;

/// Create a copy of OffersMapData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offers = null,Object? markers = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferPOS>,markers: null == markers ? _self.markers : markers // ignore: cast_nullable_to_non_nullable
as Set<Marker>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OffersMapData].
extension OffersMapDataPatterns on OffersMapData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OffersMapData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OffersMapData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OffersMapData value)  $default,){
final _that = this;
switch (_that) {
case _OffersMapData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OffersMapData value)?  $default,){
final _that = this;
switch (_that) {
case _OffersMapData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OfferPOS> offers,  Set<Marker> markers,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OffersMapData() when $default != null:
return $default(_that.offers,_that.markers,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OfferPOS> offers,  Set<Marker> markers,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _OffersMapData():
return $default(_that.offers,_that.markers,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OfferPOS> offers,  Set<Marker> markers,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _OffersMapData() when $default != null:
return $default(_that.offers,_that.markers,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _OffersMapData implements OffersMapData {
  const _OffersMapData({required final  List<OfferPOS> offers, required final  Set<Marker> markers, this.isLoading = false}): _offers = offers,_markers = markers;
  

 final  List<OfferPOS> _offers;
@override List<OfferPOS> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  Set<Marker> _markers;
@override Set<Marker> get markers {
  if (_markers is EqualUnmodifiableSetView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_markers);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of OffersMapData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OffersMapDataCopyWith<_OffersMapData> get copyWith => __$OffersMapDataCopyWithImpl<_OffersMapData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OffersMapData&&const DeepCollectionEquality().equals(other._offers, _offers)&&const DeepCollectionEquality().equals(other._markers, _markers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_markers),isLoading);

@override
String toString() {
  return 'OffersMapData(offers: $offers, markers: $markers, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$OffersMapDataCopyWith<$Res> implements $OffersMapDataCopyWith<$Res> {
  factory _$OffersMapDataCopyWith(_OffersMapData value, $Res Function(_OffersMapData) _then) = __$OffersMapDataCopyWithImpl;
@override @useResult
$Res call({
 List<OfferPOS> offers, Set<Marker> markers, bool isLoading
});




}
/// @nodoc
class __$OffersMapDataCopyWithImpl<$Res>
    implements _$OffersMapDataCopyWith<$Res> {
  __$OffersMapDataCopyWithImpl(this._self, this._then);

  final _OffersMapData _self;
  final $Res Function(_OffersMapData) _then;

/// Create a copy of OffersMapData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offers = null,Object? markers = null,Object? isLoading = null,}) {
  return _then(_OffersMapData(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferPOS>,markers: null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as Set<Marker>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
