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
abstract class _$$NewExchangeStateDataImplCopyWith<$Res> {
  factory _$$NewExchangeStateDataImplCopyWith(_$NewExchangeStateDataImpl value,
          $Res Function(_$NewExchangeStateDataImpl) then) =
      __$$NewExchangeStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String link, String pin, int womCount});
}

/// @nodoc
class __$$NewExchangeStateDataImplCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res, _$NewExchangeStateDataImpl>
    implements _$$NewExchangeStateDataImplCopyWith<$Res> {
  __$$NewExchangeStateDataImplCopyWithImpl(_$NewExchangeStateDataImpl _value,
      $Res Function(_$NewExchangeStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? pin = null,
    Object? womCount = null,
  }) {
    return _then(_$NewExchangeStateDataImpl(
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

class _$NewExchangeStateDataImpl implements NewExchangeStateData {
  const _$NewExchangeStateDataImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateDataImpl &&
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
  _$$NewExchangeStateDataImplCopyWith<_$NewExchangeStateDataImpl>
      get copyWith =>
          __$$NewExchangeStateDataImplCopyWithImpl<_$NewExchangeStateDataImpl>(
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
      required final int womCount}) = _$NewExchangeStateDataImpl;

  String get link;
  String get pin;
  int get womCount;
  @JsonKey(ignore: true)
  _$$NewExchangeStateDataImplCopyWith<_$NewExchangeStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewExchangeStateLoadingImplCopyWith<$Res> {
  factory _$$NewExchangeStateLoadingImplCopyWith(
          _$NewExchangeStateLoadingImpl value,
          $Res Function(_$NewExchangeStateLoadingImpl) then) =
      __$$NewExchangeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewExchangeStateLoadingImplCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res, _$NewExchangeStateLoadingImpl>
    implements _$$NewExchangeStateLoadingImplCopyWith<$Res> {
  __$$NewExchangeStateLoadingImplCopyWithImpl(
      _$NewExchangeStateLoadingImpl _value,
      $Res Function(_$NewExchangeStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewExchangeStateLoadingImpl implements NewExchangeStateLoading {
  const _$NewExchangeStateLoadingImpl();

  @override
  String toString() {
    return 'NewExchangeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateLoadingImpl);
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
  const factory NewExchangeStateLoading() = _$NewExchangeStateLoadingImpl;
}

/// @nodoc
abstract class _$$NewExchangeStateinsufficientVouchersImplCopyWith<$Res> {
  factory _$$NewExchangeStateinsufficientVouchersImplCopyWith(
          _$NewExchangeStateinsufficientVouchersImpl value,
          $Res Function(_$NewExchangeStateinsufficientVouchersImpl) then) =
      __$$NewExchangeStateinsufficientVouchersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewExchangeStateinsufficientVouchersImplCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res,
        _$NewExchangeStateinsufficientVouchersImpl>
    implements _$$NewExchangeStateinsufficientVouchersImplCopyWith<$Res> {
  __$$NewExchangeStateinsufficientVouchersImplCopyWithImpl(
      _$NewExchangeStateinsufficientVouchersImpl _value,
      $Res Function(_$NewExchangeStateinsufficientVouchersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewExchangeStateinsufficientVouchersImpl
    implements NewExchangeStateinsufficientVouchers {
  const _$NewExchangeStateinsufficientVouchersImpl();

  @override
  String toString() {
    return 'NewExchangeState.insufficientVouchers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateinsufficientVouchersImpl);
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
      _$NewExchangeStateinsufficientVouchersImpl;
}

/// @nodoc
abstract class _$$NewExchangeStateErrorImplCopyWith<$Res> {
  factory _$$NewExchangeStateErrorImplCopyWith(
          _$NewExchangeStateErrorImpl value,
          $Res Function(_$NewExchangeStateErrorImpl) then) =
      __$$NewExchangeStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$NewExchangeStateErrorImplCopyWithImpl<$Res>
    extends _$NewExchangeStateCopyWithImpl<$Res, _$NewExchangeStateErrorImpl>
    implements _$$NewExchangeStateErrorImplCopyWith<$Res> {
  __$$NewExchangeStateErrorImplCopyWithImpl(_$NewExchangeStateErrorImpl _value,
      $Res Function(_$NewExchangeStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$NewExchangeStateErrorImpl(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$NewExchangeStateErrorImpl implements NewExchangeStateError {
  const _$NewExchangeStateErrorImpl(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'NewExchangeState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewExchangeStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewExchangeStateErrorImplCopyWith<_$NewExchangeStateErrorImpl>
      get copyWith => __$$NewExchangeStateErrorImplCopyWithImpl<
          _$NewExchangeStateErrorImpl>(this, _$identity);

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
      _$NewExchangeStateErrorImpl;

  Object get error;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$NewExchangeStateErrorImplCopyWith<_$NewExchangeStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$ExchangeStateInitialImplCopyWith<$Res> {
  factory _$$ExchangeStateInitialImplCopyWith(_$ExchangeStateInitialImpl value,
          $Res Function(_$ExchangeStateInitialImpl) then) =
      __$$ExchangeStateInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dailyAvailableWom, int totalAvailableWom});
}

/// @nodoc
class __$$ExchangeStateInitialImplCopyWithImpl<$Res>
    extends _$ExchangeStateCopyWithImpl<$Res, _$ExchangeStateInitialImpl>
    implements _$$ExchangeStateInitialImplCopyWith<$Res> {
  __$$ExchangeStateInitialImplCopyWithImpl(_$ExchangeStateInitialImpl _value,
      $Res Function(_$ExchangeStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyAvailableWom = null,
    Object? totalAvailableWom = null,
  }) {
    return _then(_$ExchangeStateInitialImpl(
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

class _$ExchangeStateInitialImpl implements ExchangeStateInitial {
  const _$ExchangeStateInitialImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeStateInitialImpl &&
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
  _$$ExchangeStateInitialImplCopyWith<_$ExchangeStateInitialImpl>
      get copyWith =>
          __$$ExchangeStateInitialImplCopyWithImpl<_$ExchangeStateInitialImpl>(
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
      required final int totalAvailableWom}) = _$ExchangeStateInitialImpl;

  int get dailyAvailableWom;
  int get totalAvailableWom;
  @JsonKey(ignore: true)
  _$$ExchangeStateInitialImplCopyWith<_$ExchangeStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExchangeStateLoadingImplCopyWith<$Res> {
  factory _$$ExchangeStateLoadingImplCopyWith(_$ExchangeStateLoadingImpl value,
          $Res Function(_$ExchangeStateLoadingImpl) then) =
      __$$ExchangeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExchangeStateLoadingImplCopyWithImpl<$Res>
    extends _$ExchangeStateCopyWithImpl<$Res, _$ExchangeStateLoadingImpl>
    implements _$$ExchangeStateLoadingImplCopyWith<$Res> {
  __$$ExchangeStateLoadingImplCopyWithImpl(_$ExchangeStateLoadingImpl _value,
      $Res Function(_$ExchangeStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExchangeStateLoadingImpl implements ExchangeStateLoading {
  const _$ExchangeStateLoadingImpl();

  @override
  String toString() {
    return 'ExchangeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeStateLoadingImpl);
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
  const factory ExchangeStateLoading() = _$ExchangeStateLoadingImpl;
}

/// @nodoc
abstract class _$$ExchangeStateErrorImplCopyWith<$Res> {
  factory _$$ExchangeStateErrorImplCopyWith(_$ExchangeStateErrorImpl value,
          $Res Function(_$ExchangeStateErrorImpl) then) =
      __$$ExchangeStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$ExchangeStateErrorImplCopyWithImpl<$Res>
    extends _$ExchangeStateCopyWithImpl<$Res, _$ExchangeStateErrorImpl>
    implements _$$ExchangeStateErrorImplCopyWith<$Res> {
  __$$ExchangeStateErrorImplCopyWithImpl(_$ExchangeStateErrorImpl _value,
      $Res Function(_$ExchangeStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$ExchangeStateErrorImpl(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ExchangeStateErrorImpl implements ExchangeStateError {
  const _$ExchangeStateErrorImpl(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'ExchangeState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeStateErrorImplCopyWith<_$ExchangeStateErrorImpl> get copyWith =>
      __$$ExchangeStateErrorImplCopyWithImpl<_$ExchangeStateErrorImpl>(
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
      _$ExchangeStateErrorImpl;

  Object get error;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$ExchangeStateErrorImplCopyWith<_$ExchangeStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
