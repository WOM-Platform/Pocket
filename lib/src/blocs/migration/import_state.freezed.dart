// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'import_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function()? completed,
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
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(ImportCompleted value)? completed,
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
      _$ImportStateCopyWithImpl<$Res, ImportState>;
}

/// @nodoc
class _$ImportStateCopyWithImpl<$Res, $Val extends ImportState>
    implements $ImportStateCopyWith<$Res> {
  _$ImportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImportLoadingCopyWith<$Res> {
  factory _$$ImportLoadingCopyWith(
          _$ImportLoading value, $Res Function(_$ImportLoading) then) =
      __$$ImportLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImportLoadingCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportLoading>
    implements _$$ImportLoadingCopyWith<$Res> {
  __$$ImportLoadingCopyWithImpl(
      _$ImportLoading _value, $Res Function(_$ImportLoading) _then)
      : super(_value, _then);
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
    properties.add(DiagnosticsProperty('type', 'ImportState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImportLoading);
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
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function()? completed,
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
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(ImportCompleted value)? completed,
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
abstract class _$$ImportErrorCopyWith<$Res> {
  factory _$$ImportErrorCopyWith(
          _$ImportError value, $Res Function(_$ImportError) then) =
      __$$ImportErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception ex});
}

/// @nodoc
class __$$ImportErrorCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportError>
    implements _$$ImportErrorCopyWith<$Res> {
  __$$ImportErrorCopyWithImpl(
      _$ImportError _value, $Res Function(_$ImportError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ex = null,
  }) {
    return _then(_$ImportError(
      null == ex
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
        (other.runtimeType == runtimeType &&
            other is _$ImportError &&
            (identical(other.ex, ex) || other.ex == ex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportErrorCopyWith<_$ImportError> get copyWith =>
      __$$ImportErrorCopyWithImpl<_$ImportError>(this, _$identity);

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
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function()? completed,
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
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(ImportCompleted value)? completed,
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
  const factory ImportError(final Exception ex) = _$ImportError;

  Exception get ex;
  @JsonKey(ignore: true)
  _$$ImportErrorCopyWith<_$ImportError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportCompletedCopyWith<$Res> {
  factory _$$ImportCompletedCopyWith(
          _$ImportCompleted value, $Res Function(_$ImportCompleted) then) =
      __$$ImportCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImportCompletedCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportCompleted>
    implements _$$ImportCompletedCopyWith<$Res> {
  __$$ImportCompletedCopyWithImpl(
      _$ImportCompleted _value, $Res Function(_$ImportCompleted) _then)
      : super(_value, _then);
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
    properties.add(DiagnosticsProperty('type', 'ImportState.completed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImportCompleted);
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
    TResult? Function()? loading,
    TResult? Function(Exception ex)? error,
    TResult? Function()? completed,
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
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(ImportCompleted value)? completed,
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
