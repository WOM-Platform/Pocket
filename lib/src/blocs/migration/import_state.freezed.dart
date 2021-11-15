// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'import_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImportStateTearOff {
  const _$ImportStateTearOff();

  ImportLoading loading() {
    return const ImportLoading();
  }

  ImportError error(Exception ex) {
    return ImportError(
      ex,
    );
  }

  ImportCompleted completed() {
    return const ImportCompleted();
  }
}

/// @nodoc
const $ImportState = _$ImportStateTearOff();

/// @nodoc
mixin _$ImportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function() completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(ImportCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportStateCopyWith<$Res> {
  factory $ImportStateCopyWith(
          ImportState value, $Res Function(ImportState) then) =
      _$ImportStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImportStateCopyWithImpl<$Res> implements $ImportStateCopyWith<$Res> {
  _$ImportStateCopyWithImpl(this._value, this._then);

  final ImportState _value;
  // ignore: unused_field
  final $Res Function(ImportState) _then;
}

/// @nodoc
abstract class $ImportLoadingCopyWith<$Res> {
  factory $ImportLoadingCopyWith(
          ImportLoading value, $Res Function(ImportLoading) then) =
      _$ImportLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImportLoadingCopyWithImpl<$Res> extends _$ImportStateCopyWithImpl<$Res>
    implements $ImportLoadingCopyWith<$Res> {
  _$ImportLoadingCopyWithImpl(
      ImportLoading _value, $Res Function(ImportLoading) _then)
      : super(_value, (v) => _then(v as ImportLoading));

  @override
  ImportLoading get _value => super._value as ImportLoading;
}

/// @nodoc

class _$ImportLoading with DiagnosticableTreeMixin implements ImportLoading {
  const _$ImportLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ImportState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImportLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function() completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
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
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ImportLoading implements ImportState {
  const factory ImportLoading() = _$ImportLoading;
}

/// @nodoc
abstract class $ImportErrorCopyWith<$Res> {
  factory $ImportErrorCopyWith(
          ImportError value, $Res Function(ImportError) then) =
      _$ImportErrorCopyWithImpl<$Res>;
  $Res call({Exception ex});
}

/// @nodoc
class _$ImportErrorCopyWithImpl<$Res> extends _$ImportStateCopyWithImpl<$Res>
    implements $ImportErrorCopyWith<$Res> {
  _$ImportErrorCopyWithImpl(
      ImportError _value, $Res Function(ImportError) _then)
      : super(_value, (v) => _then(v as ImportError));

  @override
  ImportError get _value => super._value as ImportError;

  @override
  $Res call({
    Object? ex = freezed,
  }) {
    return _then(ImportError(
      ex == freezed
          ? _value.ex
          : ex // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ImportError with DiagnosticableTreeMixin implements ImportError {
  const _$ImportError(this.ex);

  @override
  final Exception ex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.error(ex: $ex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImportState.error'))
      ..add(DiagnosticsProperty('ex', ex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImportError &&
            (identical(other.ex, ex) ||
                const DeepCollectionEquality().equals(other.ex, ex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ex);

  @JsonKey(ignore: true)
  @override
  $ImportErrorCopyWith<ImportError> get copyWith =>
      _$ImportErrorCopyWithImpl<ImportError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function() completed,
  }) {
    return error(ex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
  }) {
    return error?.call(ex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
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
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImportError implements ImportState {
  const factory ImportError(Exception ex) = _$ImportError;

  Exception get ex => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportErrorCopyWith<ImportError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportCompletedCopyWith<$Res> {
  factory $ImportCompletedCopyWith(
          ImportCompleted value, $Res Function(ImportCompleted) then) =
      _$ImportCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImportCompletedCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res>
    implements $ImportCompletedCopyWith<$Res> {
  _$ImportCompletedCopyWithImpl(
      ImportCompleted _value, $Res Function(ImportCompleted) _then)
      : super(_value, (v) => _then(v as ImportCompleted));

  @override
  ImportCompleted get _value => super._value as ImportCompleted;
}

/// @nodoc

class _$ImportCompleted
    with DiagnosticableTreeMixin
    implements ImportCompleted {
  const _$ImportCompleted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.completed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ImportState.completed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImportCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception ex) error,
    required TResult Function() completed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception ex)? error,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class ImportCompleted implements ImportState {
  const factory ImportCompleted() = _$ImportCompleted;
}
