// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_exchange_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewExchangeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String link, String pin, int womCount) data,
    required TResult Function() loading,
    required TResult Function() insufficientVouchers,
    required TResult Function(Object error, StackTrace st) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String link, String pin, int womCount)? data,
    TResult? Function()? loading,
    TResult? Function()? insufficientVouchers,
    TResult? Function(Object error, StackTrace st)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String link, String pin, int womCount)? data,
    TResult Function()? loading,
    TResult Function()? insufficientVouchers,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewExchangeStateData value) data,
    required TResult Function(NewExchangeStateLoading value) loading,
    required TResult Function(NewExchangeStateinsufficientVouchers value)
        insufficientVouchers,
    required TResult Function(NewExchangeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewExchangeStateData value)? data,
    TResult? Function(NewExchangeStateLoading value)? loading,
    TResult? Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult? Function(NewExchangeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewExchangeStateData value)? data,
    TResult Function(NewExchangeStateLoading value)? loading,
    TResult Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult Function(NewExchangeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewExchangeStateCopyWith<$Res> {
  factory $NewExchangeStateCopyWith(
          NewExchangeState value, $Res Function(NewExchangeState) then) =
      _$NewExchangeStateCopyWithImpl<$Res, NewExchangeState>;
}

/// @nodoc
class _$NewExchangeStateCopyWithImpl<$Res, $Val extends NewExchangeState>
    implements $NewExchangeStateCopyWith<$Res> {
  _$NewExchangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewExchangeStateDataCopyWith<$Res> {
  factory _$$NewExchangeStateDataCopyWith(_$NewExchangeStateData value,
          $Res Function(_$NewExchangeStateData) then) =
      __$$NewExchangeStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String link, String pin, int womCount});
}

/// @nodoc
class __$$NewExchangeStateDataCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res, _$NewExchangeStateData>
    implements _$$NewExchangeStateDataCopyWith<$Res> {
  __$$NewExchangeStateDataCopyWithImpl(_$NewExchangeStateData _value,
      $Res Function(_$NewExchangeStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? pin = null,
    Object? womCount = null,
  }) {
    return _then(_$NewExchangeStateData(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      womCount: null == womCount
          ? _value.womCount
          : womCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewExchangeStateData implements NewExchangeStateData {
  const _$NewExchangeStateData(
      {required this.link, required this.pin, required this.womCount});

  @override
  final String link;
  @override
  final String pin;
  @override
  final int womCount;

  @override
  String toString() {
    return 'NewExchangeState.data(link: $link, pin: $pin, womCount: $womCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateData &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.womCount, womCount) ||
                other.womCount == womCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link, pin, womCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewExchangeStateDataCopyWith<_$NewExchangeStateData> get copyWith =>
      __$$NewExchangeStateDataCopyWithImpl<_$NewExchangeStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String link, String pin, int womCount) data,
    required TResult Function() loading,
    required TResult Function() insufficientVouchers,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return data(link, pin, womCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String link, String pin, int womCount)? data,
    TResult? Function()? loading,
    TResult? Function()? insufficientVouchers,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return data?.call(link, pin, womCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String link, String pin, int womCount)? data,
    TResult Function()? loading,
    TResult Function()? insufficientVouchers,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(link, pin, womCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewExchangeStateData value) data,
    required TResult Function(NewExchangeStateLoading value) loading,
    required TResult Function(NewExchangeStateinsufficientVouchers value)
        insufficientVouchers,
    required TResult Function(NewExchangeStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewExchangeStateData value)? data,
    TResult? Function(NewExchangeStateLoading value)? loading,
    TResult? Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult? Function(NewExchangeStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewExchangeStateData value)? data,
    TResult Function(NewExchangeStateLoading value)? loading,
    TResult Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult Function(NewExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class NewExchangeStateData implements NewExchangeState {
  const factory NewExchangeStateData(
      {required final String link,
      required final String pin,
      required final int womCount}) = _$NewExchangeStateData;

  String get link;
  String get pin;
  int get womCount;
  @JsonKey(ignore: true)
  _$$NewExchangeStateDataCopyWith<_$NewExchangeStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewExchangeStateLoadingCopyWith<$Res> {
  factory _$$NewExchangeStateLoadingCopyWith(_$NewExchangeStateLoading value,
          $Res Function(_$NewExchangeStateLoading) then) =
      __$$NewExchangeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewExchangeStateLoadingCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res, _$NewExchangeStateLoading>
    implements _$$NewExchangeStateLoadingCopyWith<$Res> {
  __$$NewExchangeStateLoadingCopyWithImpl(_$NewExchangeStateLoading _value,
      $Res Function(_$NewExchangeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewExchangeStateLoading implements NewExchangeStateLoading {
  const _$NewExchangeStateLoading();

  @override
  String toString() {
    return 'NewExchangeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String link, String pin, int womCount) data,
    required TResult Function() loading,
    required TResult Function() insufficientVouchers,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String link, String pin, int womCount)? data,
    TResult? Function()? loading,
    TResult? Function()? insufficientVouchers,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String link, String pin, int womCount)? data,
    TResult Function()? loading,
    TResult Function()? insufficientVouchers,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewExchangeStateData value) data,
    required TResult Function(NewExchangeStateLoading value) loading,
    required TResult Function(NewExchangeStateinsufficientVouchers value)
        insufficientVouchers,
    required TResult Function(NewExchangeStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewExchangeStateData value)? data,
    TResult? Function(NewExchangeStateLoading value)? loading,
    TResult? Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult? Function(NewExchangeStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewExchangeStateData value)? data,
    TResult Function(NewExchangeStateLoading value)? loading,
    TResult Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult Function(NewExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NewExchangeStateLoading implements NewExchangeState {
  const factory NewExchangeStateLoading() = _$NewExchangeStateLoading;
}

/// @nodoc
abstract class _$$NewExchangeStateinsufficientVouchersCopyWith<$Res> {
  factory _$$NewExchangeStateinsufficientVouchersCopyWith(
          _$NewExchangeStateinsufficientVouchers value,
          $Res Function(_$NewExchangeStateinsufficientVouchers) then) =
      __$$NewExchangeStateinsufficientVouchersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewExchangeStateinsufficientVouchersCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res,
        _$NewExchangeStateinsufficientVouchers>
    implements _$$NewExchangeStateinsufficientVouchersCopyWith<$Res> {
  __$$NewExchangeStateinsufficientVouchersCopyWithImpl(
      _$NewExchangeStateinsufficientVouchers _value,
      $Res Function(_$NewExchangeStateinsufficientVouchers) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewExchangeStateinsufficientVouchers
    implements NewExchangeStateinsufficientVouchers {
  const _$NewExchangeStateinsufficientVouchers();

  @override
  String toString() {
    return 'NewExchangeState.insufficientVouchers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateinsufficientVouchers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String link, String pin, int womCount) data,
    required TResult Function() loading,
    required TResult Function() insufficientVouchers,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return insufficientVouchers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String link, String pin, int womCount)? data,
    TResult? Function()? loading,
    TResult? Function()? insufficientVouchers,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return insufficientVouchers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String link, String pin, int womCount)? data,
    TResult Function()? loading,
    TResult Function()? insufficientVouchers,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (insufficientVouchers != null) {
      return insufficientVouchers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewExchangeStateData value) data,
    required TResult Function(NewExchangeStateLoading value) loading,
    required TResult Function(NewExchangeStateinsufficientVouchers value)
        insufficientVouchers,
    required TResult Function(NewExchangeStateError value) error,
  }) {
    return insufficientVouchers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewExchangeStateData value)? data,
    TResult? Function(NewExchangeStateLoading value)? loading,
    TResult? Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult? Function(NewExchangeStateError value)? error,
  }) {
    return insufficientVouchers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewExchangeStateData value)? data,
    TResult Function(NewExchangeStateLoading value)? loading,
    TResult Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult Function(NewExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (insufficientVouchers != null) {
      return insufficientVouchers(this);
    }
    return orElse();
  }
}

abstract class NewExchangeStateinsufficientVouchers
    implements NewExchangeState {
  const factory NewExchangeStateinsufficientVouchers() =
      _$NewExchangeStateinsufficientVouchers;
}

/// @nodoc
abstract class _$$NewExchangeStateErrorCopyWith<$Res> {
  factory _$$NewExchangeStateErrorCopyWith(_$NewExchangeStateError value,
          $Res Function(_$NewExchangeStateError) then) =
      __$$NewExchangeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$NewExchangeStateErrorCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res, _$NewExchangeStateError>
    implements _$$NewExchangeStateErrorCopyWith<$Res> {
  __$$NewExchangeStateErrorCopyWithImpl(_$NewExchangeStateError _value,
      $Res Function(_$NewExchangeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$NewExchangeStateError(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$NewExchangeStateError implements NewExchangeStateError {
  const _$NewExchangeStateError(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'NewExchangeState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewExchangeStateErrorCopyWith<_$NewExchangeStateError> get copyWith =>
      __$$NewExchangeStateErrorCopyWithImpl<_$NewExchangeStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String link, String pin, int womCount) data,
    required TResult Function() loading,
    required TResult Function() insufficientVouchers,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return error(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String link, String pin, int womCount)? data,
    TResult? Function()? loading,
    TResult? Function()? insufficientVouchers,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return error?.call(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String link, String pin, int womCount)? data,
    TResult Function()? loading,
    TResult Function()? insufficientVouchers,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, st);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewExchangeStateData value) data,
    required TResult Function(NewExchangeStateLoading value) loading,
    required TResult Function(NewExchangeStateinsufficientVouchers value)
        insufficientVouchers,
    required TResult Function(NewExchangeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewExchangeStateData value)? data,
    TResult? Function(NewExchangeStateLoading value)? loading,
    TResult? Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult? Function(NewExchangeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewExchangeStateData value)? data,
    TResult Function(NewExchangeStateLoading value)? loading,
    TResult Function(NewExchangeStateinsufficientVouchers value)?
        insufficientVouchers,
    TResult Function(NewExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NewExchangeStateError implements NewExchangeState {
  const factory NewExchangeStateError(final Object error, final StackTrace st) =
      _$NewExchangeStateError;

  Object get error;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$NewExchangeStateErrorCopyWith<_$NewExchangeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExchangeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dailyAvailableWom, int totalAvailableWom)
        initial,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace st) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace st)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExchangeStateInitial value) initial,
    required TResult Function(ExchangeStateLoading value) loading,
    required TResult Function(ExchangeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExchangeStateInitial value)? initial,
    TResult? Function(ExchangeStateLoading value)? loading,
    TResult? Function(ExchangeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExchangeStateInitial value)? initial,
    TResult Function(ExchangeStateLoading value)? loading,
    TResult Function(ExchangeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeStateCopyWith<$Res> {
  factory $ExchangeStateCopyWith(
          ExchangeState value, $Res Function(ExchangeState) then) =
      _$ExchangeStateCopyWithImpl<$Res, ExchangeState>;
}

/// @nodoc
class _$ExchangeStateCopyWithImpl<$Res, $Val extends ExchangeState>
    implements $ExchangeStateCopyWith<$Res> {
  _$ExchangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ExchangeStateInitialCopyWith<$Res> {
  factory _$$ExchangeStateInitialCopyWith(_$ExchangeStateInitial value,
          $Res Function(_$ExchangeStateInitial) then) =
      __$$ExchangeStateInitialCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyAvailableWom, int totalAvailableWom});
}

/// @nodoc
class __$$ExchangeStateInitialCopyWithImpl<$Res>
    extends _$ExchangeStateCopyWithImpl<$Res, _$ExchangeStateInitial>
    implements _$$ExchangeStateInitialCopyWith<$Res> {
  __$$ExchangeStateInitialCopyWithImpl(_$ExchangeStateInitial _value,
      $Res Function(_$ExchangeStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyAvailableWom = null,
    Object? totalAvailableWom = null,
  }) {
    return _then(_$ExchangeStateInitial(
      dailyAvailableWom: null == dailyAvailableWom
          ? _value.dailyAvailableWom
          : dailyAvailableWom // ignore: cast_nullable_to_non_nullable
              as int,
      totalAvailableWom: null == totalAvailableWom
          ? _value.totalAvailableWom
          : totalAvailableWom // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExchangeStateInitial implements ExchangeStateInitial {
  const _$ExchangeStateInitial(
      {required this.dailyAvailableWom, required this.totalAvailableWom});

  @override
  final int dailyAvailableWom;
  @override
  final int totalAvailableWom;

  @override
  String toString() {
    return 'ExchangeState.initial(dailyAvailableWom: $dailyAvailableWom, totalAvailableWom: $totalAvailableWom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeStateInitial &&
            (identical(other.dailyAvailableWom, dailyAvailableWom) ||
                other.dailyAvailableWom == dailyAvailableWom) &&
            (identical(other.totalAvailableWom, totalAvailableWom) ||
                other.totalAvailableWom == totalAvailableWom));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dailyAvailableWom, totalAvailableWom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeStateInitialCopyWith<_$ExchangeStateInitial> get copyWith =>
      __$$ExchangeStateInitialCopyWithImpl<_$ExchangeStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dailyAvailableWom, int totalAvailableWom)
        initial,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return initial(dailyAvailableWom, totalAvailableWom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return initial?.call(dailyAvailableWom, totalAvailableWom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(dailyAvailableWom, totalAvailableWom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExchangeStateInitial value) initial,
    required TResult Function(ExchangeStateLoading value) loading,
    required TResult Function(ExchangeStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExchangeStateInitial value)? initial,
    TResult? Function(ExchangeStateLoading value)? loading,
    TResult? Function(ExchangeStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExchangeStateInitial value)? initial,
    TResult Function(ExchangeStateLoading value)? loading,
    TResult Function(ExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ExchangeStateInitial implements ExchangeState {
  const factory ExchangeStateInitial(
      {required final int dailyAvailableWom,
      required final int totalAvailableWom}) = _$ExchangeStateInitial;

  int get dailyAvailableWom;
  int get totalAvailableWom;
  @JsonKey(ignore: true)
  _$$ExchangeStateInitialCopyWith<_$ExchangeStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExchangeStateLoadingCopyWith<$Res> {
  factory _$$ExchangeStateLoadingCopyWith(_$ExchangeStateLoading value,
          $Res Function(_$ExchangeStateLoading) then) =
      __$$ExchangeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExchangeStateLoadingCopyWithImpl<$Res>
    extends _$ExchangeStateCopyWithImpl<$Res, _$ExchangeStateLoading>
    implements _$$ExchangeStateLoadingCopyWith<$Res> {
  __$$ExchangeStateLoadingCopyWithImpl(_$ExchangeStateLoading _value,
      $Res Function(_$ExchangeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExchangeStateLoading implements ExchangeStateLoading {
  const _$ExchangeStateLoading();

  @override
  String toString() {
    return 'ExchangeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExchangeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dailyAvailableWom, int totalAvailableWom)
        initial,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExchangeStateInitial value) initial,
    required TResult Function(ExchangeStateLoading value) loading,
    required TResult Function(ExchangeStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExchangeStateInitial value)? initial,
    TResult? Function(ExchangeStateLoading value)? loading,
    TResult? Function(ExchangeStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExchangeStateInitial value)? initial,
    TResult Function(ExchangeStateLoading value)? loading,
    TResult Function(ExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExchangeStateLoading implements ExchangeState {
  const factory ExchangeStateLoading() = _$ExchangeStateLoading;
}

/// @nodoc
abstract class _$$ExchangeStateErrorCopyWith<$Res> {
  factory _$$ExchangeStateErrorCopyWith(_$ExchangeStateError value,
          $Res Function(_$ExchangeStateError) then) =
      __$$ExchangeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$ExchangeStateErrorCopyWithImpl<$Res>
    extends _$ExchangeStateCopyWithImpl<$Res, _$ExchangeStateError>
    implements _$$ExchangeStateErrorCopyWith<$Res> {
  __$$ExchangeStateErrorCopyWithImpl(
      _$ExchangeStateError _value, $Res Function(_$ExchangeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$ExchangeStateError(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ExchangeStateError implements ExchangeStateError {
  const _$ExchangeStateError(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'ExchangeState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeStateError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeStateErrorCopyWith<_$ExchangeStateError> get copyWith =>
      __$$ExchangeStateErrorCopyWithImpl<_$ExchangeStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int dailyAvailableWom, int totalAvailableWom)
        initial,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return error(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return error?.call(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int dailyAvailableWom, int totalAvailableWom)? initial,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, st);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExchangeStateInitial value) initial,
    required TResult Function(ExchangeStateLoading value) loading,
    required TResult Function(ExchangeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExchangeStateInitial value)? initial,
    TResult? Function(ExchangeStateLoading value)? loading,
    TResult? Function(ExchangeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExchangeStateInitial value)? initial,
    TResult Function(ExchangeStateLoading value)? loading,
    TResult Function(ExchangeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ExchangeStateError implements ExchangeState {
  const factory ExchangeStateError(final Object error, final StackTrace st) =
      _$ExchangeStateError;

  Object get error;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$ExchangeStateErrorCopyWith<_$ExchangeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
