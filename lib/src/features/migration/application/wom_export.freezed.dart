// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wom_export.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WomExport _$WomExportFromJson(Map<String, dynamic> json) {
  return _WomExport.fromJson(json);
}

/// @nodoc
mixin _$WomExport {
  Voucher get wom => throw _privateConstructorUsedError;
  String get sourceId => throw _privateConstructorUsedError;
  String get sourceName => throw _privateConstructorUsedError;

  /// Serializes this WomExport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WomExport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WomExportCopyWith<WomExport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WomExportCopyWith<$Res> {
  factory $WomExportCopyWith(WomExport value, $Res Function(WomExport) then) =
      _$WomExportCopyWithImpl<$Res, WomExport>;
  @useResult
  $Res call({Voucher wom, String sourceId, String sourceName});

  $VoucherCopyWith<$Res> get wom;
}

/// @nodoc
class _$WomExportCopyWithImpl<$Res, $Val extends WomExport>
    implements $WomExportCopyWith<$Res> {
  _$WomExportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WomExport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wom = null,
    Object? sourceId = null,
    Object? sourceName = null,
  }) {
    return _then(_value.copyWith(
      wom: null == wom
          ? _value.wom
          : wom // ignore: cast_nullable_to_non_nullable
              as Voucher,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of WomExport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoucherCopyWith<$Res> get wom {
    return $VoucherCopyWith<$Res>(_value.wom, (value) {
      return _then(_value.copyWith(wom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WomExportImplCopyWith<$Res>
    implements $WomExportCopyWith<$Res> {
  factory _$$WomExportImplCopyWith(
          _$WomExportImpl value, $Res Function(_$WomExportImpl) then) =
      __$$WomExportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Voucher wom, String sourceId, String sourceName});

  @override
  $VoucherCopyWith<$Res> get wom;
}

/// @nodoc
class __$$WomExportImplCopyWithImpl<$Res>
    extends _$WomExportCopyWithImpl<$Res, _$WomExportImpl>
    implements _$$WomExportImplCopyWith<$Res> {
  __$$WomExportImplCopyWithImpl(
      _$WomExportImpl _value, $Res Function(_$WomExportImpl) _then)
      : super(_value, _then);

  /// Create a copy of WomExport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wom = null,
    Object? sourceId = null,
    Object? sourceName = null,
  }) {
    return _then(_$WomExportImpl(
      wom: null == wom
          ? _value.wom
          : wom // ignore: cast_nullable_to_non_nullable
              as Voucher,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WomExportImpl with DiagnosticableTreeMixin implements _WomExport {
  const _$WomExportImpl(
      {required this.wom, required this.sourceId, required this.sourceName});

  factory _$WomExportImpl.fromJson(Map<String, dynamic> json) =>
      _$$WomExportImplFromJson(json);

  @override
  final Voucher wom;
  @override
  final String sourceId;
  @override
  final String sourceName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WomExport(wom: $wom, sourceId: $sourceId, sourceName: $sourceName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WomExport'))
      ..add(DiagnosticsProperty('wom', wom))
      ..add(DiagnosticsProperty('sourceId', sourceId))
      ..add(DiagnosticsProperty('sourceName', sourceName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WomExportImpl &&
            (identical(other.wom, wom) || other.wom == wom) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wom, sourceId, sourceName);

  /// Create a copy of WomExport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WomExportImplCopyWith<_$WomExportImpl> get copyWith =>
      __$$WomExportImplCopyWithImpl<_$WomExportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WomExportImplToJson(
      this,
    );
  }
}

abstract class _WomExport implements WomExport {
  const factory _WomExport(
      {required final Voucher wom,
      required final String sourceId,
      required final String sourceName}) = _$WomExportImpl;

  factory _WomExport.fromJson(Map<String, dynamic> json) =
      _$WomExportImpl.fromJson;

  @override
  Voucher get wom;
  @override
  String get sourceId;
  @override
  String get sourceName;

  /// Create a copy of WomExport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WomExportImplCopyWith<_$WomExportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
