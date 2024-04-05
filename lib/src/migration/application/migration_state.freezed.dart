// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MigrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin, List<WomRow> woms) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(MigrationData data) complete,
    required TResult Function(Object error, StackTrace st) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin, List<WomRow> woms)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(MigrationData data)? complete,
    TResult? Function(Object error, StackTrace st)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin, List<WomRow> woms)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(MigrationData data)? complete,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigrationStateData value) data,
    required TResult Function(MigrationStateLoading value) loading,
    required TResult Function(MigrationStateInitial value) initial,
    required TResult Function(MigrationStateComplete value) complete,
    required TResult Function(MigrationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MigrationStateData value)? data,
    TResult? Function(MigrationStateLoading value)? loading,
    TResult? Function(MigrationStateInitial value)? initial,
    TResult? Function(MigrationStateComplete value)? complete,
    TResult? Function(MigrationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigrationStateData value)? data,
    TResult Function(MigrationStateLoading value)? loading,
    TResult Function(MigrationStateInitial value)? initial,
    TResult Function(MigrationStateComplete value)? complete,
    TResult Function(MigrationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MigrationStateCopyWith<$Res> {
  factory $MigrationStateCopyWith(
          MigrationState value, $Res Function(MigrationState) then) =
      _$MigrationStateCopyWithImpl<$Res, MigrationState>;
}

/// @nodoc
class _$MigrationStateCopyWithImpl<$Res, $Val extends MigrationState>
    implements $MigrationStateCopyWith<$Res> {
  _$MigrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MigrationStateDataImplCopyWith<$Res> {
  factory _$$MigrationStateDataImplCopyWith(_$MigrationStateDataImpl value,
          $Res Function(_$MigrationStateDataImpl) then) =
      __$$MigrationStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin, List<WomRow> woms});
}

/// @nodoc
class __$$MigrationStateDataImplCopyWithImpl<$Res>
    extends _$MigrationStateCopyWithImpl<$Res, _$MigrationStateDataImpl>
    implements _$$MigrationStateDataImplCopyWith<$Res> {
  __$$MigrationStateDataImplCopyWithImpl(_$MigrationStateDataImpl _value,
      $Res Function(_$MigrationStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? woms = null,
  }) {
    return _then(_$MigrationStateDataImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      woms: null == woms
          ? _value._woms
          : woms // ignore: cast_nullable_to_non_nullable
              as List<WomRow>,
    ));
  }
}

/// @nodoc

class _$MigrationStateDataImpl implements MigrationStateData {
  const _$MigrationStateDataImpl(
      {required this.pin, required final List<WomRow> woms})
      : _woms = woms;

  @override
  final String pin;
  final List<WomRow> _woms;
  @override
  List<WomRow> get woms {
    if (_woms is EqualUnmodifiableListView) return _woms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_woms);
  }

  @override
  String toString() {
    return 'MigrationState.data(pin: $pin, woms: $woms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationStateDataImpl &&
            (identical(other.pin, pin) || other.pin == pin) &&
            const DeepCollectionEquality().equals(other._woms, _woms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pin, const DeepCollectionEquality().hash(_woms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationStateDataImplCopyWith<_$MigrationStateDataImpl> get copyWith =>
      __$$MigrationStateDataImplCopyWithImpl<_$MigrationStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin, List<WomRow> woms) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(MigrationData data) complete,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return data(pin, woms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin, List<WomRow> woms)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(MigrationData data)? complete,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return data?.call(pin, woms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin, List<WomRow> woms)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(MigrationData data)? complete,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(pin, woms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigrationStateData value) data,
    required TResult Function(MigrationStateLoading value) loading,
    required TResult Function(MigrationStateInitial value) initial,
    required TResult Function(MigrationStateComplete value) complete,
    required TResult Function(MigrationStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MigrationStateData value)? data,
    TResult? Function(MigrationStateLoading value)? loading,
    TResult? Function(MigrationStateInitial value)? initial,
    TResult? Function(MigrationStateComplete value)? complete,
    TResult? Function(MigrationStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigrationStateData value)? data,
    TResult Function(MigrationStateLoading value)? loading,
    TResult Function(MigrationStateInitial value)? initial,
    TResult Function(MigrationStateComplete value)? complete,
    TResult Function(MigrationStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class MigrationStateData implements MigrationState {
  const factory MigrationStateData(
      {required final String pin,
      required final List<WomRow> woms}) = _$MigrationStateDataImpl;

  String get pin;
  List<WomRow> get woms;
  @JsonKey(ignore: true)
  _$$MigrationStateDataImplCopyWith<_$MigrationStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MigrationStateLoadingImplCopyWith<$Res> {
  factory _$$MigrationStateLoadingImplCopyWith(
          _$MigrationStateLoadingImpl value,
          $Res Function(_$MigrationStateLoadingImpl) then) =
      __$$MigrationStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MigrationStateLoadingImplCopyWithImpl<$Res>
    extends _$MigrationStateCopyWithImpl<$Res, _$MigrationStateLoadingImpl>
    implements _$$MigrationStateLoadingImplCopyWith<$Res> {
  __$$MigrationStateLoadingImplCopyWithImpl(_$MigrationStateLoadingImpl _value,
      $Res Function(_$MigrationStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MigrationStateLoadingImpl implements MigrationStateLoading {
  const _$MigrationStateLoadingImpl();

  @override
  String toString() {
    return 'MigrationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin, List<WomRow> woms) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(MigrationData data) complete,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin, List<WomRow> woms)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(MigrationData data)? complete,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin, List<WomRow> woms)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(MigrationData data)? complete,
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
    required TResult Function(MigrationStateData value) data,
    required TResult Function(MigrationStateLoading value) loading,
    required TResult Function(MigrationStateInitial value) initial,
    required TResult Function(MigrationStateComplete value) complete,
    required TResult Function(MigrationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MigrationStateData value)? data,
    TResult? Function(MigrationStateLoading value)? loading,
    TResult? Function(MigrationStateInitial value)? initial,
    TResult? Function(MigrationStateComplete value)? complete,
    TResult? Function(MigrationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigrationStateData value)? data,
    TResult Function(MigrationStateLoading value)? loading,
    TResult Function(MigrationStateInitial value)? initial,
    TResult Function(MigrationStateComplete value)? complete,
    TResult Function(MigrationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MigrationStateLoading implements MigrationState {
  const factory MigrationStateLoading() = _$MigrationStateLoadingImpl;
}

/// @nodoc
abstract class _$$MigrationStateInitialImplCopyWith<$Res> {
  factory _$$MigrationStateInitialImplCopyWith(
          _$MigrationStateInitialImpl value,
          $Res Function(_$MigrationStateInitialImpl) then) =
      __$$MigrationStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MigrationStateInitialImplCopyWithImpl<$Res>
    extends _$MigrationStateCopyWithImpl<$Res, _$MigrationStateInitialImpl>
    implements _$$MigrationStateInitialImplCopyWith<$Res> {
  __$$MigrationStateInitialImplCopyWithImpl(_$MigrationStateInitialImpl _value,
      $Res Function(_$MigrationStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MigrationStateInitialImpl implements MigrationStateInitial {
  const _$MigrationStateInitialImpl();

  @override
  String toString() {
    return 'MigrationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin, List<WomRow> woms) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(MigrationData data) complete,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin, List<WomRow> woms)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(MigrationData data)? complete,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin, List<WomRow> woms)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(MigrationData data)? complete,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigrationStateData value) data,
    required TResult Function(MigrationStateLoading value) loading,
    required TResult Function(MigrationStateInitial value) initial,
    required TResult Function(MigrationStateComplete value) complete,
    required TResult Function(MigrationStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MigrationStateData value)? data,
    TResult? Function(MigrationStateLoading value)? loading,
    TResult? Function(MigrationStateInitial value)? initial,
    TResult? Function(MigrationStateComplete value)? complete,
    TResult? Function(MigrationStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigrationStateData value)? data,
    TResult Function(MigrationStateLoading value)? loading,
    TResult Function(MigrationStateInitial value)? initial,
    TResult Function(MigrationStateComplete value)? complete,
    TResult Function(MigrationStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MigrationStateInitial implements MigrationState {
  const factory MigrationStateInitial() = _$MigrationStateInitialImpl;
}

/// @nodoc
abstract class _$$MigrationStateCompleteImplCopyWith<$Res> {
  factory _$$MigrationStateCompleteImplCopyWith(
          _$MigrationStateCompleteImpl value,
          $Res Function(_$MigrationStateCompleteImpl) then) =
      __$$MigrationStateCompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MigrationData data});

  $MigrationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$MigrationStateCompleteImplCopyWithImpl<$Res>
    extends _$MigrationStateCopyWithImpl<$Res, _$MigrationStateCompleteImpl>
    implements _$$MigrationStateCompleteImplCopyWith<$Res> {
  __$$MigrationStateCompleteImplCopyWithImpl(
      _$MigrationStateCompleteImpl _value,
      $Res Function(_$MigrationStateCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MigrationStateCompleteImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MigrationData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MigrationDataCopyWith<$Res> get data {
    return $MigrationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$MigrationStateCompleteImpl implements MigrationStateComplete {
  const _$MigrationStateCompleteImpl({required this.data});

  @override
  final MigrationData data;

  @override
  String toString() {
    return 'MigrationState.complete(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationStateCompleteImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationStateCompleteImplCopyWith<_$MigrationStateCompleteImpl>
      get copyWith => __$$MigrationStateCompleteImplCopyWithImpl<
          _$MigrationStateCompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin, List<WomRow> woms) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(MigrationData data) complete,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return complete(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin, List<WomRow> woms)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(MigrationData data)? complete,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return complete?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin, List<WomRow> woms)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(MigrationData data)? complete,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigrationStateData value) data,
    required TResult Function(MigrationStateLoading value) loading,
    required TResult Function(MigrationStateInitial value) initial,
    required TResult Function(MigrationStateComplete value) complete,
    required TResult Function(MigrationStateError value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MigrationStateData value)? data,
    TResult? Function(MigrationStateLoading value)? loading,
    TResult? Function(MigrationStateInitial value)? initial,
    TResult? Function(MigrationStateComplete value)? complete,
    TResult? Function(MigrationStateError value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigrationStateData value)? data,
    TResult Function(MigrationStateLoading value)? loading,
    TResult Function(MigrationStateInitial value)? initial,
    TResult Function(MigrationStateComplete value)? complete,
    TResult Function(MigrationStateError value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class MigrationStateComplete implements MigrationState {
  const factory MigrationStateComplete({required final MigrationData data}) =
      _$MigrationStateCompleteImpl;

  MigrationData get data;
  @JsonKey(ignore: true)
  _$$MigrationStateCompleteImplCopyWith<_$MigrationStateCompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MigrationStateErrorImplCopyWith<$Res> {
  factory _$$MigrationStateErrorImplCopyWith(_$MigrationStateErrorImpl value,
          $Res Function(_$MigrationStateErrorImpl) then) =
      __$$MigrationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$MigrationStateErrorImplCopyWithImpl<$Res>
    extends _$MigrationStateCopyWithImpl<$Res, _$MigrationStateErrorImpl>
    implements _$$MigrationStateErrorImplCopyWith<$Res> {
  __$$MigrationStateErrorImplCopyWithImpl(_$MigrationStateErrorImpl _value,
      $Res Function(_$MigrationStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$MigrationStateErrorImpl(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$MigrationStateErrorImpl implements MigrationStateError {
  const _$MigrationStateErrorImpl(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'MigrationState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationStateErrorImplCopyWith<_$MigrationStateErrorImpl> get copyWith =>
      __$$MigrationStateErrorImplCopyWithImpl<_$MigrationStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin, List<WomRow> woms) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(MigrationData data) complete,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return error(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin, List<WomRow> woms)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(MigrationData data)? complete,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return error?.call(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin, List<WomRow> woms)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(MigrationData data)? complete,
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
    required TResult Function(MigrationStateData value) data,
    required TResult Function(MigrationStateLoading value) loading,
    required TResult Function(MigrationStateInitial value) initial,
    required TResult Function(MigrationStateComplete value) complete,
    required TResult Function(MigrationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MigrationStateData value)? data,
    TResult? Function(MigrationStateLoading value)? loading,
    TResult? Function(MigrationStateInitial value)? initial,
    TResult? Function(MigrationStateComplete value)? complete,
    TResult? Function(MigrationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigrationStateData value)? data,
    TResult Function(MigrationStateLoading value)? loading,
    TResult Function(MigrationStateInitial value)? initial,
    TResult Function(MigrationStateComplete value)? complete,
    TResult Function(MigrationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MigrationStateError implements MigrationState {
  const factory MigrationStateError(final Object error, final StackTrace st) =
      _$MigrationStateErrorImpl;

  Object get error;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$MigrationStateErrorImplCopyWith<_$MigrationStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
