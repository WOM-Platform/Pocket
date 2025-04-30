// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encrypted_totem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EncryptedTotemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() invalid,
    required TResult Function(PersonalTotemFailure failure) failure,
    required TResult Function(TotemData totemData) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? invalid,
    TResult? Function(PersonalTotemFailure failure)? failure,
    TResult? Function(TotemData totemData)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? invalid,
    TResult Function(PersonalTotemFailure failure)? failure,
    TResult Function(TotemData totemData)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncryptedTotemStateLoading value) loading,
    required TResult Function(EncryptedTotemStateInvalid value) invalid,
    required TResult Function(EncryptedTotemStateFailure value) failure,
    required TResult Function(EncryptedTotemStateCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncryptedTotemStateLoading value)? loading,
    TResult? Function(EncryptedTotemStateInvalid value)? invalid,
    TResult? Function(EncryptedTotemStateFailure value)? failure,
    TResult? Function(EncryptedTotemStateCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncryptedTotemStateLoading value)? loading,
    TResult Function(EncryptedTotemStateInvalid value)? invalid,
    TResult Function(EncryptedTotemStateFailure value)? failure,
    TResult Function(EncryptedTotemStateCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EncryptedTotemStateCopyWith<$Res> {
  factory $EncryptedTotemStateCopyWith(
          EncryptedTotemState value, $Res Function(EncryptedTotemState) then) =
      _$EncryptedTotemStateCopyWithImpl<$Res, EncryptedTotemState>;
}

/// @nodoc
class _$EncryptedTotemStateCopyWithImpl<$Res, $Val extends EncryptedTotemState>
    implements $EncryptedTotemStateCopyWith<$Res> {
  _$EncryptedTotemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EncryptedTotemStateLoadingImplCopyWith<$Res> {
  factory _$$EncryptedTotemStateLoadingImplCopyWith(
          _$EncryptedTotemStateLoadingImpl value,
          $Res Function(_$EncryptedTotemStateLoadingImpl) then) =
      __$$EncryptedTotemStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EncryptedTotemStateLoadingImplCopyWithImpl<$Res>
    extends _$EncryptedTotemStateCopyWithImpl<$Res,
        _$EncryptedTotemStateLoadingImpl>
    implements _$$EncryptedTotemStateLoadingImplCopyWith<$Res> {
  __$$EncryptedTotemStateLoadingImplCopyWithImpl(
      _$EncryptedTotemStateLoadingImpl _value,
      $Res Function(_$EncryptedTotemStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EncryptedTotemStateLoadingImpl implements EncryptedTotemStateLoading {
  const _$EncryptedTotemStateLoadingImpl();

  @override
  String toString() {
    return 'EncryptedTotemState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncryptedTotemStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() invalid,
    required TResult Function(PersonalTotemFailure failure) failure,
    required TResult Function(TotemData totemData) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? invalid,
    TResult? Function(PersonalTotemFailure failure)? failure,
    TResult? Function(TotemData totemData)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? invalid,
    TResult Function(PersonalTotemFailure failure)? failure,
    TResult Function(TotemData totemData)? completed,
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
    required TResult Function(EncryptedTotemStateLoading value) loading,
    required TResult Function(EncryptedTotemStateInvalid value) invalid,
    required TResult Function(EncryptedTotemStateFailure value) failure,
    required TResult Function(EncryptedTotemStateCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncryptedTotemStateLoading value)? loading,
    TResult? Function(EncryptedTotemStateInvalid value)? invalid,
    TResult? Function(EncryptedTotemStateFailure value)? failure,
    TResult? Function(EncryptedTotemStateCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncryptedTotemStateLoading value)? loading,
    TResult Function(EncryptedTotemStateInvalid value)? invalid,
    TResult Function(EncryptedTotemStateFailure value)? failure,
    TResult Function(EncryptedTotemStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EncryptedTotemStateLoading implements EncryptedTotemState {
  const factory EncryptedTotemStateLoading() = _$EncryptedTotemStateLoadingImpl;
}

/// @nodoc
abstract class _$$EncryptedTotemStateInvalidImplCopyWith<$Res> {
  factory _$$EncryptedTotemStateInvalidImplCopyWith(
          _$EncryptedTotemStateInvalidImpl value,
          $Res Function(_$EncryptedTotemStateInvalidImpl) then) =
      __$$EncryptedTotemStateInvalidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EncryptedTotemStateInvalidImplCopyWithImpl<$Res>
    extends _$EncryptedTotemStateCopyWithImpl<$Res,
        _$EncryptedTotemStateInvalidImpl>
    implements _$$EncryptedTotemStateInvalidImplCopyWith<$Res> {
  __$$EncryptedTotemStateInvalidImplCopyWithImpl(
      _$EncryptedTotemStateInvalidImpl _value,
      $Res Function(_$EncryptedTotemStateInvalidImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EncryptedTotemStateInvalidImpl implements EncryptedTotemStateInvalid {
  const _$EncryptedTotemStateInvalidImpl();

  @override
  String toString() {
    return 'EncryptedTotemState.invalid()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncryptedTotemStateInvalidImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() invalid,
    required TResult Function(PersonalTotemFailure failure) failure,
    required TResult Function(TotemData totemData) completed,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? invalid,
    TResult? Function(PersonalTotemFailure failure)? failure,
    TResult? Function(TotemData totemData)? completed,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? invalid,
    TResult Function(PersonalTotemFailure failure)? failure,
    TResult Function(TotemData totemData)? completed,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncryptedTotemStateLoading value) loading,
    required TResult Function(EncryptedTotemStateInvalid value) invalid,
    required TResult Function(EncryptedTotemStateFailure value) failure,
    required TResult Function(EncryptedTotemStateCompleted value) completed,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncryptedTotemStateLoading value)? loading,
    TResult? Function(EncryptedTotemStateInvalid value)? invalid,
    TResult? Function(EncryptedTotemStateFailure value)? failure,
    TResult? Function(EncryptedTotemStateCompleted value)? completed,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncryptedTotemStateLoading value)? loading,
    TResult Function(EncryptedTotemStateInvalid value)? invalid,
    TResult Function(EncryptedTotemStateFailure value)? failure,
    TResult Function(EncryptedTotemStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class EncryptedTotemStateInvalid implements EncryptedTotemState {
  const factory EncryptedTotemStateInvalid() = _$EncryptedTotemStateInvalidImpl;
}

/// @nodoc
abstract class _$$EncryptedTotemStateFailureImplCopyWith<$Res> {
  factory _$$EncryptedTotemStateFailureImplCopyWith(
          _$EncryptedTotemStateFailureImpl value,
          $Res Function(_$EncryptedTotemStateFailureImpl) then) =
      __$$EncryptedTotemStateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PersonalTotemFailure failure});
}

/// @nodoc
class __$$EncryptedTotemStateFailureImplCopyWithImpl<$Res>
    extends _$EncryptedTotemStateCopyWithImpl<$Res,
        _$EncryptedTotemStateFailureImpl>
    implements _$$EncryptedTotemStateFailureImplCopyWith<$Res> {
  __$$EncryptedTotemStateFailureImplCopyWithImpl(
      _$EncryptedTotemStateFailureImpl _value,
      $Res Function(_$EncryptedTotemStateFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$EncryptedTotemStateFailureImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PersonalTotemFailure,
    ));
  }
}

/// @nodoc

class _$EncryptedTotemStateFailureImpl implements EncryptedTotemStateFailure {
  const _$EncryptedTotemStateFailureImpl({required this.failure});

  @override
  final PersonalTotemFailure failure;

  @override
  String toString() {
    return 'EncryptedTotemState.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncryptedTotemStateFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncryptedTotemStateFailureImplCopyWith<_$EncryptedTotemStateFailureImpl>
      get copyWith => __$$EncryptedTotemStateFailureImplCopyWithImpl<
          _$EncryptedTotemStateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() invalid,
    required TResult Function(PersonalTotemFailure failure) failure,
    required TResult Function(TotemData totemData) completed,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? invalid,
    TResult? Function(PersonalTotemFailure failure)? failure,
    TResult? Function(TotemData totemData)? completed,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? invalid,
    TResult Function(PersonalTotemFailure failure)? failure,
    TResult Function(TotemData totemData)? completed,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncryptedTotemStateLoading value) loading,
    required TResult Function(EncryptedTotemStateInvalid value) invalid,
    required TResult Function(EncryptedTotemStateFailure value) failure,
    required TResult Function(EncryptedTotemStateCompleted value) completed,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncryptedTotemStateLoading value)? loading,
    TResult? Function(EncryptedTotemStateInvalid value)? invalid,
    TResult? Function(EncryptedTotemStateFailure value)? failure,
    TResult? Function(EncryptedTotemStateCompleted value)? completed,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncryptedTotemStateLoading value)? loading,
    TResult Function(EncryptedTotemStateInvalid value)? invalid,
    TResult Function(EncryptedTotemStateFailure value)? failure,
    TResult Function(EncryptedTotemStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class EncryptedTotemStateFailure implements EncryptedTotemState {
  const factory EncryptedTotemStateFailure(
          {required final PersonalTotemFailure failure}) =
      _$EncryptedTotemStateFailureImpl;

  PersonalTotemFailure get failure;

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncryptedTotemStateFailureImplCopyWith<_$EncryptedTotemStateFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EncryptedTotemStateCompletedImplCopyWith<$Res> {
  factory _$$EncryptedTotemStateCompletedImplCopyWith(
          _$EncryptedTotemStateCompletedImpl value,
          $Res Function(_$EncryptedTotemStateCompletedImpl) then) =
      __$$EncryptedTotemStateCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TotemData totemData});

  $TotemDataCopyWith<$Res> get totemData;
}

/// @nodoc
class __$$EncryptedTotemStateCompletedImplCopyWithImpl<$Res>
    extends _$EncryptedTotemStateCopyWithImpl<$Res,
        _$EncryptedTotemStateCompletedImpl>
    implements _$$EncryptedTotemStateCompletedImplCopyWith<$Res> {
  __$$EncryptedTotemStateCompletedImplCopyWithImpl(
      _$EncryptedTotemStateCompletedImpl _value,
      $Res Function(_$EncryptedTotemStateCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totemData = null,
  }) {
    return _then(_$EncryptedTotemStateCompletedImpl(
      totemData: null == totemData
          ? _value.totemData
          : totemData // ignore: cast_nullable_to_non_nullable
              as TotemData,
    ));
  }

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotemDataCopyWith<$Res> get totemData {
    return $TotemDataCopyWith<$Res>(_value.totemData, (value) {
      return _then(_value.copyWith(totemData: value));
    });
  }
}

/// @nodoc

class _$EncryptedTotemStateCompletedImpl
    implements EncryptedTotemStateCompleted {
  const _$EncryptedTotemStateCompletedImpl({required this.totemData});

  @override
  final TotemData totemData;

  @override
  String toString() {
    return 'EncryptedTotemState.completed(totemData: $totemData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncryptedTotemStateCompletedImpl &&
            (identical(other.totemData, totemData) ||
                other.totemData == totemData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totemData);

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncryptedTotemStateCompletedImplCopyWith<
          _$EncryptedTotemStateCompletedImpl>
      get copyWith => __$$EncryptedTotemStateCompletedImplCopyWithImpl<
          _$EncryptedTotemStateCompletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() invalid,
    required TResult Function(PersonalTotemFailure failure) failure,
    required TResult Function(TotemData totemData) completed,
  }) {
    return completed(totemData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? invalid,
    TResult? Function(PersonalTotemFailure failure)? failure,
    TResult? Function(TotemData totemData)? completed,
  }) {
    return completed?.call(totemData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? invalid,
    TResult Function(PersonalTotemFailure failure)? failure,
    TResult Function(TotemData totemData)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(totemData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncryptedTotemStateLoading value) loading,
    required TResult Function(EncryptedTotemStateInvalid value) invalid,
    required TResult Function(EncryptedTotemStateFailure value) failure,
    required TResult Function(EncryptedTotemStateCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncryptedTotemStateLoading value)? loading,
    TResult? Function(EncryptedTotemStateInvalid value)? invalid,
    TResult? Function(EncryptedTotemStateFailure value)? failure,
    TResult? Function(EncryptedTotemStateCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncryptedTotemStateLoading value)? loading,
    TResult Function(EncryptedTotemStateInvalid value)? invalid,
    TResult Function(EncryptedTotemStateFailure value)? failure,
    TResult Function(EncryptedTotemStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class EncryptedTotemStateCompleted implements EncryptedTotemState {
  const factory EncryptedTotemStateCompleted(
          {required final TotemData totemData}) =
      _$EncryptedTotemStateCompletedImpl;

  TotemData get totemData;

  /// Create a copy of EncryptedTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncryptedTotemStateCompletedImplCopyWith<
          _$EncryptedTotemStateCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
