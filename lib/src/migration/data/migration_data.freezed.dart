// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MigrationData _$MigrationDataFromJson(Map<String, dynamic> json) {
  return _MigrationData.fromJson(json);
}

/// @nodoc
mixin _$MigrationData {
  String get code => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get importDeadline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MigrationDataCopyWith<MigrationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MigrationDataCopyWith<$Res> {
  factory $MigrationDataCopyWith(
          MigrationData value, $Res Function(MigrationData) then) =
      _$MigrationDataCopyWithImpl<$Res, MigrationData>;
  @useResult
  $Res call(
      {String code, String link, @DateTimeConverter() DateTime importDeadline});
}

/// @nodoc
class _$MigrationDataCopyWithImpl<$Res, $Val extends MigrationData>
    implements $MigrationDataCopyWith<$Res> {
  _$MigrationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? link = null,
    Object? importDeadline = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      importDeadline: null == importDeadline
          ? _value.importDeadline
          : importDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MigrationDataCopyWith<$Res>
    implements $MigrationDataCopyWith<$Res> {
  factory _$$_MigrationDataCopyWith(
          _$_MigrationData value, $Res Function(_$_MigrationData) then) =
      __$$_MigrationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String link, @DateTimeConverter() DateTime importDeadline});
}

/// @nodoc
class __$$_MigrationDataCopyWithImpl<$Res>
    extends _$MigrationDataCopyWithImpl<$Res, _$_MigrationData>
    implements _$$_MigrationDataCopyWith<$Res> {
  __$$_MigrationDataCopyWithImpl(
      _$_MigrationData _value, $Res Function(_$_MigrationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? link = null,
    Object? importDeadline = null,
  }) {
    return _then(_$_MigrationData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      importDeadline: null == importDeadline
          ? _value.importDeadline
          : importDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MigrationData implements _MigrationData {
  const _$_MigrationData(
      {required this.code,
      required this.link,
      @DateTimeConverter() required this.importDeadline});

  factory _$_MigrationData.fromJson(Map<String, dynamic> json) =>
      _$$_MigrationDataFromJson(json);

  @override
  final String code;
  @override
  final String link;
  @override
  @DateTimeConverter()
  final DateTime importDeadline;

  @override
  String toString() {
    return 'MigrationData(code: $code, link: $link, importDeadline: $importDeadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MigrationData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.importDeadline, importDeadline) ||
                other.importDeadline == importDeadline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, link, importDeadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MigrationDataCopyWith<_$_MigrationData> get copyWith =>
      __$$_MigrationDataCopyWithImpl<_$_MigrationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MigrationDataToJson(
      this,
    );
  }
}

abstract class _MigrationData implements MigrationData {
  const factory _MigrationData(
          {required final String code,
          required final String link,
          @DateTimeConverter() required final DateTime importDeadline}) =
      _$_MigrationData;

  factory _MigrationData.fromJson(Map<String, dynamic> json) =
      _$_MigrationData.fromJson;

  @override
  String get code;
  @override
  String get link;
  @override
  @DateTimeConverter()
  DateTime get importDeadline;
  @override
  @JsonKey(ignore: true)
  _$$_MigrationDataCopyWith<_$_MigrationData> get copyWith =>
      throw _privateConstructorUsedError;
}
