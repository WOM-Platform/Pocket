// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_map_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PosMapData {
  List<POSMap> get posList => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PosMapDataCopyWith<PosMapData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosMapDataCopyWith<$Res> {
  factory $PosMapDataCopyWith(
          PosMapData value, $Res Function(PosMapData) then) =
      _$PosMapDataCopyWithImpl<$Res, PosMapData>;
  @useResult
  $Res call({List<POSMap> posList, Set<Marker> markers, bool isLoading});
}

/// @nodoc
class _$PosMapDataCopyWithImpl<$Res, $Val extends PosMapData>
    implements $PosMapDataCopyWith<$Res> {
  _$PosMapDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posList = null,
    Object? markers = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      posList: null == posList
          ? _value.posList
          : posList // ignore: cast_nullable_to_non_nullable
              as List<POSMap>,
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
abstract class _$$PosMapDataImplCopyWith<$Res>
    implements $PosMapDataCopyWith<$Res> {
  factory _$$PosMapDataImplCopyWith(
          _$PosMapDataImpl value, $Res Function(_$PosMapDataImpl) then) =
      __$$PosMapDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<POSMap> posList, Set<Marker> markers, bool isLoading});
}

/// @nodoc
class __$$PosMapDataImplCopyWithImpl<$Res>
    extends _$PosMapDataCopyWithImpl<$Res, _$PosMapDataImpl>
    implements _$$PosMapDataImplCopyWith<$Res> {
  __$$PosMapDataImplCopyWithImpl(
      _$PosMapDataImpl _value, $Res Function(_$PosMapDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posList = null,
    Object? markers = null,
    Object? isLoading = null,
  }) {
    return _then(_$PosMapDataImpl(
      posList: null == posList
          ? _value._posList
          : posList // ignore: cast_nullable_to_non_nullable
              as List<POSMap>,
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

class _$PosMapDataImpl implements _PosMapData {
  const _$PosMapDataImpl(
      {required final List<POSMap> posList,
      required final Set<Marker> markers,
      this.isLoading = false})
      : _posList = posList,
        _markers = markers;

  final List<POSMap> _posList;
  @override
  List<POSMap> get posList {
    if (_posList is EqualUnmodifiableListView) return _posList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posList);
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
    return 'PosMapData(posList: $posList, markers: $markers, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosMapDataImpl &&
            const DeepCollectionEquality().equals(other._posList, _posList) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posList),
      const DeepCollectionEquality().hash(_markers),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosMapDataImplCopyWith<_$PosMapDataImpl> get copyWith =>
      __$$PosMapDataImplCopyWithImpl<_$PosMapDataImpl>(this, _$identity);
}

abstract class _PosMapData implements PosMapData {
  const factory _PosMapData(
      {required final List<POSMap> posList,
      required final Set<Marker> markers,
      final bool isLoading}) = _$PosMapDataImpl;

  @override
  List<POSMap> get posList;
  @override
  Set<Marker> get markers;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$PosMapDataImplCopyWith<_$PosMapDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
