// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wom_export.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WomExport _$WomExportFromJson(Map<String, dynamic> json) {
  return _WomExport.fromJson(json);
}

/// @nodoc
mixin _$WomExport {
  Voucher get wom => throw _privateConstructorUsedError;
  String get sourceId => throw _privateConstructorUsedError;
  String get sourceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @override
  @pragma('vm:prefer-inline')
  $VoucherCopyWith<$Res> get wom {
    return $VoucherCopyWith<$Res>(_value.wom, (value) {
      return _then(_value.copyWith(wom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WomExportCopyWith<$Res> implements $WomExportCopyWith<$Res> {
  factory _$$_WomExportCopyWith(
          _$_WomExport value, $Res Function(_$_WomExport) then) =
      __$$_WomExportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Voucher wom, String sourceId, String sourceName});

  @override
  $VoucherCopyWith<$Res> get wom;
}

/// @nodoc
class __$$_WomExportCopyWithImpl<$Res>
    extends _$WomExportCopyWithImpl<$Res, _$_WomExport>
    implements _$$_WomExportCopyWith<$Res> {
  __$$_WomExportCopyWithImpl(
      _$_WomExport _value, $Res Function(_$_WomExport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wom = null,
    Object? sourceId = null,
    Object? sourceName = null,
  }) {
    return _then(_$_WomExport(
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
class _$_WomExport with DiagnosticableTreeMixin implements _WomExport {
  const _$_WomExport(
      {required this.wom, required this.sourceId, required this.sourceName});

  factory _$_WomExport.fromJson(Map<String, dynamic> json) =>
      _$$_WomExportFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WomExport &&
            (identical(other.wom, wom) || other.wom == wom) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wom, sourceId, sourceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WomExportCopyWith<_$_WomExport> get copyWith =>
      __$$_WomExportCopyWithImpl<_$_WomExport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WomExportToJson(
      this,
    );
  }
}

abstract class _WomExport implements WomExport {
  const factory _WomExport(
      {required final Voucher wom,
      required final String sourceId,
      required final String sourceName}) = _$_WomExport;

  factory _WomExport.fromJson(Map<String, dynamic> json) =
      _$_WomExport.fromJson;

  @override
  Voucher get wom;
  @override
  String get sourceId;
  @override
  String get sourceName;
  @override
  @JsonKey(ignore: true)
  _$$_WomExportCopyWith<_$_WomExport> get copyWith =>
      throw _privateConstructorUsedError;
}
