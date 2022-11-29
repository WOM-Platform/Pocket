// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'export_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function(MigrationData data) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function(MigrationData data)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExportLoading value) loading,
    required TResult Function(ExportError value) error,
    required TResult Function(ExportCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExportLoading value)? loading,
    TResult? Function(ExportError value)? error,
    TResult? Function(ExportCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportStateCopyWith<$Res> {
  factory $ExportStateCopyWith(
          ExportState value, $Res Function(ExportState) then) =
      _$ExportStateCopyWithImpl<$Res, ExportState>;
}

/// @nodoc
class _$ExportStateCopyWithImpl<$Res, $Val extends ExportState>
    implements $ExportStateCopyWith<$Res> {
  _$ExportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ExportLoadingCopyWith<$Res> {
  factory _$$ExportLoadingCopyWith(
          _$ExportLoading value, $Res Function(_$ExportLoading) then) =
      __$$ExportLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExportLoadingCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res, _$ExportLoading>
    implements _$$ExportLoadingCopyWith<$Res> {
  __$$ExportLoadingCopyWithImpl(
      _$ExportLoading _value, $Res Function(_$ExportLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExportLoading with DiagnosticableTreeMixin implements ExportLoading {
  const _$ExportLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExportState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ExportState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExportLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function(MigrationData data) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function(MigrationData data)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
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
    required TResult Function(ExportLoading value) loading,
    required TResult Function(ExportError value) error,
    required TResult Function(ExportCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExportLoading value)? loading,
    TResult? Function(ExportError value)? error,
    TResult? Function(ExportCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExportLoading implements ExportState {
  const factory ExportLoading() = _$ExportLoading;
}

/// @nodoc
abstract class _$$ExportErrorCopyWith<$Res> {
  factory _$$ExportErrorCopyWith(
          _$ExportError value, $Res Function(_$ExportError) then) =
      __$$ExportErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception ex});
}

/// @nodoc
class __$$ExportErrorCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res, _$ExportError>
    implements _$$ExportErrorCopyWith<$Res> {
  __$$ExportErrorCopyWithImpl(
      _$ExportError _value, $Res Function(_$ExportError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ex = null,
  }) {
    return _then(_$ExportError(
      null == ex
          ? _value.ex
          : ex // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ExportError with DiagnosticableTreeMixin implements ExportError {
  const _$ExportError(this.ex);

  @override
  final Exception ex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExportState.error(ex: $ex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExportState.error'))
      ..add(DiagnosticsProperty('ex', ex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportError &&
            (identical(other.ex, ex) || other.ex == ex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportErrorCopyWith<_$ExportError> get copyWith =>
      __$$ExportErrorCopyWithImpl<_$ExportError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function(MigrationData data) completed,
  }) {
    return error(ex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function(MigrationData data)? completed,
  }) {
    return error?.call(ex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(ex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExportLoading value) loading,
    required TResult Function(ExportError value) error,
    required TResult Function(ExportCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExportLoading value)? loading,
    TResult? Function(ExportError value)? error,
    TResult? Function(ExportCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ExportError implements ExportState {
  const factory ExportError(final Exception ex) = _$ExportError;

  Exception get ex;
  @JsonKey(ignore: true)
  _$$ExportErrorCopyWith<_$ExportError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExportCompletedCopyWith<$Res> {
  factory _$$ExportCompletedCopyWith(
          _$ExportCompleted value, $Res Function(_$ExportCompleted) then) =
      __$$ExportCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({MigrationData data});
}

/// @nodoc
class __$$ExportCompletedCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res, _$ExportCompleted>
    implements _$$ExportCompletedCopyWith<$Res> {
  __$$ExportCompletedCopyWithImpl(
      _$ExportCompleted _value, $Res Function(_$ExportCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ExportCompleted(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MigrationData,
    ));
  }
}

/// @nodoc

class _$ExportCompleted
    with DiagnosticableTreeMixin
    implements ExportCompleted {
  const _$ExportCompleted(this.data);

  @override
  final MigrationData data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExportState.completed(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExportState.completed'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportCompleted &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportCompletedCopyWith<_$ExportCompleted> get copyWith =>
      __$$ExportCompletedCopyWithImpl<_$ExportCompleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function(MigrationData data) completed,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function(MigrationData data)? completed,
  }) {
    return completed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExportLoading value) loading,
    required TResult Function(ExportError value) error,
    required TResult Function(ExportCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExportLoading value)? loading,
    TResult? Function(ExportError value)? error,
    TResult? Function(ExportCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class ExportCompleted implements ExportState {
  const factory ExportCompleted(final MigrationData data) = _$ExportCompleted;

  MigrationData get data;
  @JsonKey(ignore: true)
  _$$ExportCompletedCopyWith<_$ExportCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}
