// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'export_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExportStateTearOff {
  const _$ExportStateTearOff();

  ExportLoading loading() {
    return const ExportLoading();
  }

  ExportError error(Exception ex) {
    return ExportError(
      ex,
    );
  }

  ExportCompleted completed(MigrationData data) {
    return ExportCompleted(
      data,
    );
  }
}

/// @nodoc
const $ExportState = _$ExportStateTearOff();

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
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
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
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
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
      _$ExportStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExportStateCopyWithImpl<$Res> implements $ExportStateCopyWith<$Res> {
  _$ExportStateCopyWithImpl(this._value, this._then);

  final ExportState _value;
  // ignore: unused_field
  final $Res Function(ExportState) _then;
}

/// @nodoc
abstract class $ExportLoadingCopyWith<$Res> {
  factory $ExportLoadingCopyWith(
          ExportLoading value, $Res Function(ExportLoading) then) =
      _$ExportLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExportLoadingCopyWithImpl<$Res> extends _$ExportStateCopyWithImpl<$Res>
    implements $ExportLoadingCopyWith<$Res> {
  _$ExportLoadingCopyWithImpl(
      ExportLoading _value, $Res Function(ExportLoading) _then)
      : super(_value, (v) => _then(v as ExportLoading));

  @override
  ExportLoading get _value => super._value as ExportLoading;
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
    properties..add(DiagnosticsProperty('type', 'ExportState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ExportLoading);
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
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
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
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
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
abstract class $ExportErrorCopyWith<$Res> {
  factory $ExportErrorCopyWith(
          ExportError value, $Res Function(ExportError) then) =
      _$ExportErrorCopyWithImpl<$Res>;
  $Res call({Exception ex});
}

/// @nodoc
class _$ExportErrorCopyWithImpl<$Res> extends _$ExportStateCopyWithImpl<$Res>
    implements $ExportErrorCopyWith<$Res> {
  _$ExportErrorCopyWithImpl(
      ExportError _value, $Res Function(ExportError) _then)
      : super(_value, (v) => _then(v as ExportError));

  @override
  ExportError get _value => super._value as ExportError;

  @override
  $Res call({
    Object? ex = freezed,
  }) {
    return _then(ExportError(
      ex == freezed
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
        (other is ExportError &&
            (identical(other.ex, ex) ||
                const DeepCollectionEquality().equals(other.ex, ex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ex);

  @JsonKey(ignore: true)
  @override
  $ExportErrorCopyWith<ExportError> get copyWith =>
      _$ExportErrorCopyWithImpl<ExportError>(this, _$identity);

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
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
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
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
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
  const factory ExportError(Exception ex) = _$ExportError;

  Exception get ex => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExportErrorCopyWith<ExportError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportCompletedCopyWith<$Res> {
  factory $ExportCompletedCopyWith(
          ExportCompleted value, $Res Function(ExportCompleted) then) =
      _$ExportCompletedCopyWithImpl<$Res>;
  $Res call({MigrationData data});
}

/// @nodoc
class _$ExportCompletedCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res>
    implements $ExportCompletedCopyWith<$Res> {
  _$ExportCompletedCopyWithImpl(
      ExportCompleted _value, $Res Function(ExportCompleted) _then)
      : super(_value, (v) => _then(v as ExportCompleted));

  @override
  ExportCompleted get _value => super._value as ExportCompleted;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(ExportCompleted(
      data == freezed
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
        (other is ExportCompleted &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $ExportCompletedCopyWith<ExportCompleted> get copyWith =>
      _$ExportCompletedCopyWithImpl<ExportCompleted>(this, _$identity);

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
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function(MigrationData data)? completed,
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
    TResult Function(ExportLoading value)? loading,
    TResult Function(ExportError value)? error,
    TResult Function(ExportCompleted value)? completed,
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
  const factory ExportCompleted(MigrationData data) = _$ExportCompleted;

  MigrationData get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExportCompletedCopyWith<ExportCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}
