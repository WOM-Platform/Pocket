// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)
        single,
    required TResult Function(int total) multiple,
    required TResult Function() processing,
    required TResult Function(int total) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult? Function(int total)? multiple,
    TResult? Function()? processing,
    TResult? Function(int total)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult Function(int total)? multiple,
    TResult Function()? processing,
    TResult Function(int total)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerStateSingle value) single,
    required TResult Function(ScannerStateMultiple value) multiple,
    required TResult Function(ScannerStateProcessing value) processing,
    required TResult Function(ScannerStateEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerStateSingle value)? single,
    TResult? Function(ScannerStateMultiple value)? multiple,
    TResult? Function(ScannerStateProcessing value)? processing,
    TResult? Function(ScannerStateEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerStateSingle value)? single,
    TResult Function(ScannerStateMultiple value)? multiple,
    TResult Function(ScannerStateProcessing value)? processing,
    TResult Function(ScannerStateEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScannerStateCopyWith<$Res> {
  factory $ScannerStateCopyWith(
          ScannerState value, $Res Function(ScannerState) then) =
      _$ScannerStateCopyWithImpl<$Res, ScannerState>;
}

/// @nodoc
class _$ScannerStateCopyWithImpl<$Res, $Val extends ScannerState>
    implements $ScannerStateCopyWith<$Res> {
  _$ScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScannerStateSingleImplCopyWith<$Res> {
  factory _$$ScannerStateSingleImplCopyWith(_$ScannerStateSingleImpl value,
          $Res Function(_$ScannerStateSingleImpl) then) =
      __$$ScannerStateSingleImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String url, int total, TransactionType type, TotemData? totemData});

  $TotemDataCopyWith<$Res>? get totemData;
}

/// @nodoc
class __$$ScannerStateSingleImplCopyWithImpl<$Res>
    extends _$ScannerStateCopyWithImpl<$Res, _$ScannerStateSingleImpl>
    implements _$$ScannerStateSingleImplCopyWith<$Res> {
  __$$ScannerStateSingleImplCopyWithImpl(_$ScannerStateSingleImpl _value,
      $Res Function(_$ScannerStateSingleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? total = null,
    Object? type = null,
    Object? totemData = freezed,
  }) {
    return _then(_$ScannerStateSingleImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      totemData: freezed == totemData
          ? _value.totemData
          : totemData // ignore: cast_nullable_to_non_nullable
              as TotemData?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TotemDataCopyWith<$Res>? get totemData {
    if (_value.totemData == null) {
      return null;
    }

    return $TotemDataCopyWith<$Res>(_value.totemData!, (value) {
      return _then(_value.copyWith(totemData: value));
    });
  }
}

/// @nodoc

class _$ScannerStateSingleImpl implements ScannerStateSingle {
  const _$ScannerStateSingleImpl(
      {required this.url,
      required this.total,
      required this.type,
      this.totemData});

  @override
  final String url;
  @override
  final int total;
  @override
  final TransactionType type;
  @override
  final TotemData? totemData;

  @override
  String toString() {
    return 'ScannerState.single(url: $url, total: $total, type: $type, totemData: $totemData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerStateSingleImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.totemData, totemData) ||
                other.totemData == totemData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, total, type, totemData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannerStateSingleImplCopyWith<_$ScannerStateSingleImpl> get copyWith =>
      __$$ScannerStateSingleImplCopyWithImpl<_$ScannerStateSingleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)
        single,
    required TResult Function(int total) multiple,
    required TResult Function() processing,
    required TResult Function(int total) empty,
  }) {
    return single(url, total, type, totemData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult? Function(int total)? multiple,
    TResult? Function()? processing,
    TResult? Function(int total)? empty,
  }) {
    return single?.call(url, total, type, totemData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult Function(int total)? multiple,
    TResult Function()? processing,
    TResult Function(int total)? empty,
    required TResult orElse(),
  }) {
    if (single != null) {
      return single(url, total, type, totemData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerStateSingle value) single,
    required TResult Function(ScannerStateMultiple value) multiple,
    required TResult Function(ScannerStateProcessing value) processing,
    required TResult Function(ScannerStateEmpty value) empty,
  }) {
    return single(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerStateSingle value)? single,
    TResult? Function(ScannerStateMultiple value)? multiple,
    TResult? Function(ScannerStateProcessing value)? processing,
    TResult? Function(ScannerStateEmpty value)? empty,
  }) {
    return single?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerStateSingle value)? single,
    TResult Function(ScannerStateMultiple value)? multiple,
    TResult Function(ScannerStateProcessing value)? processing,
    TResult Function(ScannerStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (single != null) {
      return single(this);
    }
    return orElse();
  }
}

abstract class ScannerStateSingle implements ScannerState {
  const factory ScannerStateSingle(
      {required final String url,
      required final int total,
      required final TransactionType type,
      final TotemData? totemData}) = _$ScannerStateSingleImpl;

  String get url;
  int get total;
  TransactionType get type;
  TotemData? get totemData;
  @JsonKey(ignore: true)
  _$$ScannerStateSingleImplCopyWith<_$ScannerStateSingleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScannerStateMultipleImplCopyWith<$Res> {
  factory _$$ScannerStateMultipleImplCopyWith(_$ScannerStateMultipleImpl value,
          $Res Function(_$ScannerStateMultipleImpl) then) =
      __$$ScannerStateMultipleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$$ScannerStateMultipleImplCopyWithImpl<$Res>
    extends _$ScannerStateCopyWithImpl<$Res, _$ScannerStateMultipleImpl>
    implements _$$ScannerStateMultipleImplCopyWith<$Res> {
  __$$ScannerStateMultipleImplCopyWithImpl(_$ScannerStateMultipleImpl _value,
      $Res Function(_$ScannerStateMultipleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$ScannerStateMultipleImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ScannerStateMultipleImpl implements ScannerStateMultiple {
  const _$ScannerStateMultipleImpl({required this.total});

  @override
  final int total;

  @override
  String toString() {
    return 'ScannerState.multiple(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerStateMultipleImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannerStateMultipleImplCopyWith<_$ScannerStateMultipleImpl>
      get copyWith =>
          __$$ScannerStateMultipleImplCopyWithImpl<_$ScannerStateMultipleImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)
        single,
    required TResult Function(int total) multiple,
    required TResult Function() processing,
    required TResult Function(int total) empty,
  }) {
    return multiple(total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult? Function(int total)? multiple,
    TResult? Function()? processing,
    TResult? Function(int total)? empty,
  }) {
    return multiple?.call(total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult Function(int total)? multiple,
    TResult Function()? processing,
    TResult Function(int total)? empty,
    required TResult orElse(),
  }) {
    if (multiple != null) {
      return multiple(total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerStateSingle value) single,
    required TResult Function(ScannerStateMultiple value) multiple,
    required TResult Function(ScannerStateProcessing value) processing,
    required TResult Function(ScannerStateEmpty value) empty,
  }) {
    return multiple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerStateSingle value)? single,
    TResult? Function(ScannerStateMultiple value)? multiple,
    TResult? Function(ScannerStateProcessing value)? processing,
    TResult? Function(ScannerStateEmpty value)? empty,
  }) {
    return multiple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerStateSingle value)? single,
    TResult Function(ScannerStateMultiple value)? multiple,
    TResult Function(ScannerStateProcessing value)? processing,
    TResult Function(ScannerStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (multiple != null) {
      return multiple(this);
    }
    return orElse();
  }
}

abstract class ScannerStateMultiple implements ScannerState {
  const factory ScannerStateMultiple({required final int total}) =
      _$ScannerStateMultipleImpl;

  int get total;
  @JsonKey(ignore: true)
  _$$ScannerStateMultipleImplCopyWith<_$ScannerStateMultipleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScannerStateProcessingImplCopyWith<$Res> {
  factory _$$ScannerStateProcessingImplCopyWith(
          _$ScannerStateProcessingImpl value,
          $Res Function(_$ScannerStateProcessingImpl) then) =
      __$$ScannerStateProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScannerStateProcessingImplCopyWithImpl<$Res>
    extends _$ScannerStateCopyWithImpl<$Res, _$ScannerStateProcessingImpl>
    implements _$$ScannerStateProcessingImplCopyWith<$Res> {
  __$$ScannerStateProcessingImplCopyWithImpl(
      _$ScannerStateProcessingImpl _value,
      $Res Function(_$ScannerStateProcessingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScannerStateProcessingImpl implements ScannerStateProcessing {
  const _$ScannerStateProcessingImpl();

  @override
  String toString() {
    return 'ScannerState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerStateProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)
        single,
    required TResult Function(int total) multiple,
    required TResult Function() processing,
    required TResult Function(int total) empty,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult? Function(int total)? multiple,
    TResult? Function()? processing,
    TResult? Function(int total)? empty,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult Function(int total)? multiple,
    TResult Function()? processing,
    TResult Function(int total)? empty,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerStateSingle value) single,
    required TResult Function(ScannerStateMultiple value) multiple,
    required TResult Function(ScannerStateProcessing value) processing,
    required TResult Function(ScannerStateEmpty value) empty,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerStateSingle value)? single,
    TResult? Function(ScannerStateMultiple value)? multiple,
    TResult? Function(ScannerStateProcessing value)? processing,
    TResult? Function(ScannerStateEmpty value)? empty,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerStateSingle value)? single,
    TResult Function(ScannerStateMultiple value)? multiple,
    TResult Function(ScannerStateProcessing value)? processing,
    TResult Function(ScannerStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class ScannerStateProcessing implements ScannerState {
  const factory ScannerStateProcessing() = _$ScannerStateProcessingImpl;
}

/// @nodoc
abstract class _$$ScannerStateEmptyImplCopyWith<$Res> {
  factory _$$ScannerStateEmptyImplCopyWith(_$ScannerStateEmptyImpl value,
          $Res Function(_$ScannerStateEmptyImpl) then) =
      __$$ScannerStateEmptyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$$ScannerStateEmptyImplCopyWithImpl<$Res>
    extends _$ScannerStateCopyWithImpl<$Res, _$ScannerStateEmptyImpl>
    implements _$$ScannerStateEmptyImplCopyWith<$Res> {
  __$$ScannerStateEmptyImplCopyWithImpl(_$ScannerStateEmptyImpl _value,
      $Res Function(_$ScannerStateEmptyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$ScannerStateEmptyImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ScannerStateEmptyImpl implements ScannerStateEmpty {
  const _$ScannerStateEmptyImpl({required this.total});

  @override
  final int total;

  @override
  String toString() {
    return 'ScannerState.empty(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerStateEmptyImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannerStateEmptyImplCopyWith<_$ScannerStateEmptyImpl> get copyWith =>
      __$$ScannerStateEmptyImplCopyWithImpl<_$ScannerStateEmptyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)
        single,
    required TResult Function(int total) multiple,
    required TResult Function() processing,
    required TResult Function(int total) empty,
  }) {
    return empty(total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult? Function(int total)? multiple,
    TResult? Function()? processing,
    TResult? Function(int total)? empty,
  }) {
    return empty?.call(total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String url, int total, TransactionType type, TotemData? totemData)?
        single,
    TResult Function(int total)? multiple,
    TResult Function()? processing,
    TResult Function(int total)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerStateSingle value) single,
    required TResult Function(ScannerStateMultiple value) multiple,
    required TResult Function(ScannerStateProcessing value) processing,
    required TResult Function(ScannerStateEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerStateSingle value)? single,
    TResult? Function(ScannerStateMultiple value)? multiple,
    TResult? Function(ScannerStateProcessing value)? processing,
    TResult? Function(ScannerStateEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerStateSingle value)? single,
    TResult Function(ScannerStateMultiple value)? multiple,
    TResult Function(ScannerStateProcessing value)? processing,
    TResult Function(ScannerStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ScannerStateEmpty implements ScannerState {
  const factory ScannerStateEmpty({required final int total}) =
      _$ScannerStateEmptyImpl;

  int get total;
  @JsonKey(ignore: true)
  _$$ScannerStateEmptyImplCopyWith<_$ScannerStateEmptyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
