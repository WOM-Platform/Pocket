// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  @TransactionTypeConverter()
  TransactionType get type => throw _privateConstructorUsedError;
  String get source =>
      throw _privateConstructorUsedError; // required String country,
  @JsonKey(name: 'Aim')
  String get aimCode => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'Timestamp')
  DateTime get date =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'Aim') required Aim aim,
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  String? get ackUrl => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {@TransactionTypeConverter() TransactionType type,
      String source,
      @JsonKey(name: 'Aim') String aimCode,
      @DateTimeConverter() @JsonKey(name: 'Timestamp') DateTime date,
      @JsonKey(name: 'Id') int id,
      String? ackUrl,
      int size});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? source = null,
    Object? aimCode = null,
    Object? date = null,
    Object? id = null,
    Object? ackUrl = freezed,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      aimCode: null == aimCode
          ? _value.aimCode
          : aimCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ackUrl: freezed == ackUrl
          ? _value.ackUrl
          : ackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionModelCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$_TransactionModelCopyWith(
          _$_TransactionModel value, $Res Function(_$_TransactionModel) then) =
      __$$_TransactionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TransactionTypeConverter() TransactionType type,
      String source,
      @JsonKey(name: 'Aim') String aimCode,
      @DateTimeConverter() @JsonKey(name: 'Timestamp') DateTime date,
      @JsonKey(name: 'Id') int id,
      String? ackUrl,
      int size});
}

/// @nodoc
class __$$_TransactionModelCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$_TransactionModel>
    implements _$$_TransactionModelCopyWith<$Res> {
  __$$_TransactionModelCopyWithImpl(
      _$_TransactionModel _value, $Res Function(_$_TransactionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? source = null,
    Object? aimCode = null,
    Object? date = null,
    Object? id = null,
    Object? ackUrl = freezed,
    Object? size = null,
  }) {
    return _then(_$_TransactionModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      aimCode: null == aimCode
          ? _value.aimCode
          : aimCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ackUrl: freezed == ackUrl
          ? _value.ackUrl
          : ackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionModel
    with DiagnosticableTreeMixin
    implements _TransactionModel {
  const _$_TransactionModel(
      {@TransactionTypeConverter() required this.type,
      required this.source,
      @JsonKey(name: 'Aim') required this.aimCode,
      @DateTimeConverter() @JsonKey(name: 'Timestamp') required this.date,
      @JsonKey(name: 'Id') required this.id,
      this.ackUrl,
      required this.size});

  factory _$_TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionModelFromJson(json);

  @override
  @TransactionTypeConverter()
  final TransactionType type;
  @override
  final String source;
// required String country,
  @override
  @JsonKey(name: 'Aim')
  final String aimCode;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'Timestamp')
  final DateTime date;
// @JsonKey(name: 'Aim') required Aim aim,
  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  final String? ackUrl;
  @override
  final int size;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionModel(type: $type, source: $source, aimCode: $aimCode, date: $date, id: $id, ackUrl: $ackUrl, size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionModel'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('aimCode', aimCode))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('ackUrl', ackUrl))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.aimCode, aimCode) || other.aimCode == aimCode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ackUrl, ackUrl) || other.ackUrl == ackUrl) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, source, aimCode, date, id, ackUrl, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionModelCopyWith<_$_TransactionModel> get copyWith =>
      __$$_TransactionModelCopyWithImpl<_$_TransactionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionModelToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
      {@TransactionTypeConverter()
          required final TransactionType type,
      required final String source,
      @JsonKey(name: 'Aim')
          required final String aimCode,
      @DateTimeConverter()
      @JsonKey(name: 'Timestamp')
          required final DateTime date,
      @JsonKey(name: 'Id')
          required final int id,
      final String? ackUrl,
      required final int size}) = _$_TransactionModel;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionModel.fromJson;

  @override
  @TransactionTypeConverter()
  TransactionType get type;
  @override
  String get source;
  @override // required String country,
  @JsonKey(name: 'Aim')
  String get aimCode;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'Timestamp')
  DateTime get date;
  @override // @JsonKey(name: 'Aim') required Aim aim,
  @JsonKey(name: 'Id')
  int get id;
  @override
  String? get ackUrl;
  @override
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionModelCopyWith<_$_TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
