// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NFCState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFCStateCopyWith<$Res> {
  factory $NFCStateCopyWith(NFCState value, $Res Function(NFCState) then) =
      _$NFCStateCopyWithImpl<$Res, NFCState>;
}

/// @nodoc
class _$NFCStateCopyWithImpl<$Res, $Val extends NFCState>
    implements $NFCStateCopyWith<$Res> {
  _$NFCStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NFCStateDataImplCopyWith<$Res> {
  factory _$$NFCStateDataImplCopyWith(
          _$NFCStateDataImpl value, $Res Function(_$NFCStateDataImpl) then) =
      __$$NFCStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TotemData totemData});

  $TotemDataCopyWith<$Res> get totemData;
}

/// @nodoc
class __$$NFCStateDataImplCopyWithImpl<$Res>
    extends _$NFCStateCopyWithImpl<$Res, _$NFCStateDataImpl>
    implements _$$NFCStateDataImplCopyWith<$Res> {
  __$$NFCStateDataImplCopyWithImpl(
      _$NFCStateDataImpl _value, $Res Function(_$NFCStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totemData = null,
  }) {
    return _then(_$NFCStateDataImpl(
      totemData: null == totemData
          ? _value.totemData
          : totemData // ignore: cast_nullable_to_non_nullable
              as TotemData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TotemDataCopyWith<$Res> get totemData {
    return $TotemDataCopyWith<$Res>(_value.totemData, (value) {
      return _then(_value.copyWith(totemData: value));
    });
  }
}

/// @nodoc

class _$NFCStateDataImpl implements NFCStateData {
  const _$NFCStateDataImpl({required this.totemData});

  @override
  final TotemData totemData;

  @override
  String toString() {
    return 'NFCState.data(totemData: $totemData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCStateDataImpl &&
            (identical(other.totemData, totemData) ||
                other.totemData == totemData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totemData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCStateDataImplCopyWith<_$NFCStateDataImpl> get copyWith =>
      __$$NFCStateDataImplCopyWithImpl<_$NFCStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return data(totemData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return data?.call(totemData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(totemData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class NFCStateData implements NFCState {
  const factory NFCStateData({required final TotemData totemData}) =
      _$NFCStateDataImpl;

  TotemData get totemData;
  @JsonKey(ignore: true)
  _$$NFCStateDataImplCopyWith<_$NFCStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NFCStateListeningImplCopyWith<$Res> {
  factory _$$NFCStateListeningImplCopyWith(_$NFCStateListeningImpl value,
          $Res Function(_$NFCStateListeningImpl) then) =
      __$$NFCStateListeningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NFCStateListeningImplCopyWithImpl<$Res>
    extends _$NFCStateCopyWithImpl<$Res, _$NFCStateListeningImpl>
    implements _$$NFCStateListeningImplCopyWith<$Res> {
  __$$NFCStateListeningImplCopyWithImpl(_$NFCStateListeningImpl _value,
      $Res Function(_$NFCStateListeningImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NFCStateListeningImpl implements NFCStateListening {
  const _$NFCStateListeningImpl();

  @override
  String toString() {
    return 'NFCState.listening()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NFCStateListeningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return listening();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return listening?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) {
    return listening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class NFCStateListening implements NFCState {
  const factory NFCStateListening() = _$NFCStateListeningImpl;
}

/// @nodoc
abstract class _$$NFCStateUnavailableImplCopyWith<$Res> {
  factory _$$NFCStateUnavailableImplCopyWith(_$NFCStateUnavailableImpl value,
          $Res Function(_$NFCStateUnavailableImpl) then) =
      __$$NFCStateUnavailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NFCStateUnavailableImplCopyWithImpl<$Res>
    extends _$NFCStateCopyWithImpl<$Res, _$NFCStateUnavailableImpl>
    implements _$$NFCStateUnavailableImplCopyWith<$Res> {
  __$$NFCStateUnavailableImplCopyWithImpl(_$NFCStateUnavailableImpl _value,
      $Res Function(_$NFCStateUnavailableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NFCStateUnavailableImpl implements NFCStateUnavailable {
  const _$NFCStateUnavailableImpl();

  @override
  String toString() {
    return 'NFCState.unavailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCStateUnavailableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return unavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return unavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) {
    return unavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class NFCStateUnavailable implements NFCState {
  const factory NFCStateUnavailable() = _$NFCStateUnavailableImpl;
}

/// @nodoc
abstract class _$$NFCStateLoadingImplCopyWith<$Res> {
  factory _$$NFCStateLoadingImplCopyWith(_$NFCStateLoadingImpl value,
          $Res Function(_$NFCStateLoadingImpl) then) =
      __$$NFCStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NFCStateLoadingImplCopyWithImpl<$Res>
    extends _$NFCStateCopyWithImpl<$Res, _$NFCStateLoadingImpl>
    implements _$$NFCStateLoadingImplCopyWith<$Res> {
  __$$NFCStateLoadingImplCopyWithImpl(
      _$NFCStateLoadingImpl _value, $Res Function(_$NFCStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NFCStateLoadingImpl implements NFCStateLoading {
  const _$NFCStateLoadingImpl();

  @override
  String toString() {
    return 'NFCState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NFCStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
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
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NFCStateLoading implements NFCState {
  const factory NFCStateLoading() = _$NFCStateLoadingImpl;
}

/// @nodoc
abstract class _$$NFCStateInvalidDataImplCopyWith<$Res> {
  factory _$$NFCStateInvalidDataImplCopyWith(_$NFCStateInvalidDataImpl value,
          $Res Function(_$NFCStateInvalidDataImpl) then) =
      __$$NFCStateInvalidDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NFCStateInvalidDataImplCopyWithImpl<$Res>
    extends _$NFCStateCopyWithImpl<$Res, _$NFCStateInvalidDataImpl>
    implements _$$NFCStateInvalidDataImplCopyWith<$Res> {
  __$$NFCStateInvalidDataImplCopyWithImpl(_$NFCStateInvalidDataImpl _value,
      $Res Function(_$NFCStateInvalidDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NFCStateInvalidDataImpl implements NFCStateInvalidData {
  const _$NFCStateInvalidDataImpl();

  @override
  String toString() {
    return 'NFCState.invalidData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCStateInvalidDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return invalidData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return invalidData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) {
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) {
    return invalidData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class NFCStateInvalidData implements NFCState {
  const factory NFCStateInvalidData() = _$NFCStateInvalidDataImpl;
}

/// @nodoc
abstract class _$$NFCStateErrorImplCopyWith<$Res> {
  factory _$$NFCStateErrorImplCopyWith(
          _$NFCStateErrorImpl value, $Res Function(_$NFCStateErrorImpl) then) =
      __$$NFCStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$NFCStateErrorImplCopyWithImpl<$Res>
    extends _$NFCStateCopyWithImpl<$Res, _$NFCStateErrorImpl>
    implements _$$NFCStateErrorImplCopyWith<$Res> {
  __$$NFCStateErrorImplCopyWithImpl(
      _$NFCStateErrorImpl _value, $Res Function(_$NFCStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$NFCStateErrorImpl(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$NFCStateErrorImpl implements NFCStateError {
  const _$NFCStateErrorImpl(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'NFCState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCStateErrorImplCopyWith<_$NFCStateErrorImpl> get copyWith =>
      __$$NFCStateErrorImplCopyWithImpl<_$NFCStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TotemData totemData) data,
    required TResult Function() listening,
    required TResult Function() unavailable,
    required TResult Function() loading,
    required TResult Function() invalidData,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return error(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TotemData totemData)? data,
    TResult? Function()? listening,
    TResult? Function()? unavailable,
    TResult? Function()? loading,
    TResult? Function()? invalidData,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return error?.call(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TotemData totemData)? data,
    TResult Function()? listening,
    TResult Function()? unavailable,
    TResult Function()? loading,
    TResult Function()? invalidData,
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
    required TResult Function(NFCStateData value) data,
    required TResult Function(NFCStateListening value) listening,
    required TResult Function(NFCStateUnavailable value) unavailable,
    required TResult Function(NFCStateLoading value) loading,
    required TResult Function(NFCStateInvalidData value) invalidData,
    required TResult Function(NFCStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NFCStateData value)? data,
    TResult? Function(NFCStateListening value)? listening,
    TResult? Function(NFCStateUnavailable value)? unavailable,
    TResult? Function(NFCStateLoading value)? loading,
    TResult? Function(NFCStateInvalidData value)? invalidData,
    TResult? Function(NFCStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NFCStateData value)? data,
    TResult Function(NFCStateListening value)? listening,
    TResult Function(NFCStateUnavailable value)? unavailable,
    TResult Function(NFCStateLoading value)? loading,
    TResult Function(NFCStateInvalidData value)? invalidData,
    TResult Function(NFCStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NFCStateError implements NFCState {
  const factory NFCStateError(final Object error, final StackTrace st) =
      _$NFCStateErrorImpl;

  Object get error;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$NFCStateErrorImplCopyWith<_$NFCStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
