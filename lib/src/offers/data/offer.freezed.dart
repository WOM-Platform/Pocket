// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OffersMapData {
  List<OfferPOS> get offers => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OffersMapDataCopyWith<OffersMapData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersMapDataCopyWith<$Res> {
  factory $OffersMapDataCopyWith(
          OffersMapData value, $Res Function(OffersMapData) then) =
      _$OffersMapDataCopyWithImpl<$Res, OffersMapData>;
  @useResult
  $Res call({List<OfferPOS> offers, Set<Marker> markers, bool isLoading});
}

/// @nodoc
class _$OffersMapDataCopyWithImpl<$Res, $Val extends OffersMapData>
    implements $OffersMapDataCopyWith<$Res> {
  _$OffersMapDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
    Object? markers = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      offers: null == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferPOS>,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OffersMapDataImplCopyWith<$Res>
    implements $OffersMapDataCopyWith<$Res> {
  factory _$$OffersMapDataImplCopyWith(
          _$OffersMapDataImpl value, $Res Function(_$OffersMapDataImpl) then) =
      __$$OffersMapDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OfferPOS> offers, Set<Marker> markers, bool isLoading});
}

/// @nodoc
class __$$OffersMapDataImplCopyWithImpl<$Res>
    extends _$OffersMapDataCopyWithImpl<$Res, _$OffersMapDataImpl>
    implements _$$OffersMapDataImplCopyWith<$Res> {
  __$$OffersMapDataImplCopyWithImpl(
      _$OffersMapDataImpl _value, $Res Function(_$OffersMapDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
    Object? markers = null,
    Object? isLoading = null,
  }) {
    return _then(_$OffersMapDataImpl(
      offers: null == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferPOS>,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OffersMapDataImpl implements _OffersMapData {
  const _$OffersMapDataImpl(
      {required final List<OfferPOS> offers,
      required final Set<Marker> markers,
      this.isLoading = false})
      : _offers = offers,
        _markers = markers;

  final List<OfferPOS> _offers;
  @override
  List<OfferPOS> get offers {
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offers);
  }

  final Set<Marker> _markers;
  @override
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'OffersMapData(offers: $offers, markers: $markers, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersMapDataImpl &&
            const DeepCollectionEquality().equals(other._offers, _offers) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_offers),
      const DeepCollectionEquality().hash(_markers),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersMapDataImplCopyWith<_$OffersMapDataImpl> get copyWith =>
      __$$OffersMapDataImplCopyWithImpl<_$OffersMapDataImpl>(this, _$identity);
}

abstract class _OffersMapData implements OffersMapData {
  const factory _OffersMapData(
      {required final List<OfferPOS> offers,
      required final Set<Marker> markers,
      final bool isLoading}) = _$OffersMapDataImpl;

  @override
  List<OfferPOS> get offers;
  @override
  Set<Marker> get markers;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$OffersMapDataImplCopyWith<_$OffersMapDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
