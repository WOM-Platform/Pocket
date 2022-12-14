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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(int count) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(int count)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(int count)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportInitial value) initial,
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(JustImported value) justImported,
    required TResult Function(ImportCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
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
abstract class _$$ImportInitialCopyWith<$Res> {
  factory _$$ImportInitialCopyWith(
          _$ImportInitial value, $Res Function(_$ImportInitial) then) =
      __$$ImportInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImportInitialCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportInitial>
    implements _$$ImportInitialCopyWith<$Res> {
  __$$ImportInitialCopyWithImpl(
      _$ImportInitial _value, $Res Function(_$ImportInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImportInitial with DiagnosticableTreeMixin implements ImportInitial {
  const _$ImportInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ImportState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImportInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(int count) completed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(int count)? completed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(int count)? completed,
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
    required TResult Function(ImportInitial value) initial,
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(JustImported value) justImported,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportCompleted value)? completed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ImportInitial implements ImportState {
  const factory ImportInitial() = _$ImportInitial;
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(int count) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(int count)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(int count)? completed,
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
    required TResult Function(ImportInitial value) initial,
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(JustImported value) justImported,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
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
  $Res call({Object ex, StackTrace st});
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
    Object? st = null,
  }) {
    return _then(_$ImportError(
      null == ex ? _value.ex : ex,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ImportError with DiagnosticableTreeMixin implements ImportError {
  const _$ImportError(this.ex, this.st);

  @override
  final Object ex;
  @override
  final StackTrace st;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.error(ex: $ex, st: $st)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImportState.error'))
      ..add(DiagnosticsProperty('ex', ex))
      ..add(DiagnosticsProperty('st', st));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportError &&
            const DeepCollectionEquality().equals(other.ex, ex) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ex), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportErrorCopyWith<_$ImportError> get copyWith =>
      __$$ImportErrorCopyWithImpl<_$ImportError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(int count) completed,
  }) {
    return error(ex, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(int count)? completed,
  }) {
    return error?.call(ex, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(int count)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(ex, st);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportInitial value) initial,
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(JustImported value) justImported,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
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
  const factory ImportError(final Object ex, final StackTrace st) =
      _$ImportError;

  Object get ex;
  StackTrace get st;
  @JsonKey(ignore: true)
  _$$ImportErrorCopyWith<_$ImportError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JustImportedCopyWith<$Res> {
  factory _$$JustImportedCopyWith(
          _$JustImported value, $Res Function(_$JustImported) then) =
      __$$JustImportedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JustImportedCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$JustImported>
    implements _$$JustImportedCopyWith<$Res> {
  __$$JustImportedCopyWithImpl(
      _$JustImported _value, $Res Function(_$JustImported) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JustImported with DiagnosticableTreeMixin implements JustImported {
  const _$JustImported();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.justImported()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ImportState.justImported'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JustImported);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(int count) completed,
  }) {
    return justImported();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(int count)? completed,
  }) {
    return justImported?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(int count)? completed,
    required TResult orElse(),
  }) {
    if (justImported != null) {
      return justImported();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportInitial value) initial,
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(JustImported value) justImported,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return justImported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportCompleted value)? completed,
  }) {
    return justImported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (justImported != null) {
      return justImported(this);
    }
    return orElse();
  }
}

abstract class JustImported implements ImportState {
  const factory JustImported() = _$JustImported;
}

/// @nodoc
abstract class _$$ImportCompletedCopyWith<$Res> {
  factory _$$ImportCompletedCopyWith(
          _$ImportCompleted value, $Res Function(_$ImportCompleted) then) =
      __$$ImportCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$ImportCompletedCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportCompleted>
    implements _$$ImportCompletedCopyWith<$Res> {
  __$$ImportCompletedCopyWithImpl(
      _$ImportCompleted _value, $Res Function(_$ImportCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$ImportCompleted(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ImportCompleted
    with DiagnosticableTreeMixin
    implements ImportCompleted {
  const _$ImportCompleted(this.count);

  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.completed(count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImportState.completed'))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportCompleted &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportCompletedCopyWith<_$ImportCompleted> get copyWith =>
      __$$ImportCompletedCopyWithImpl<_$ImportCompleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(int count) completed,
  }) {
    return completed(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(int count)? completed,
  }) {
    return completed?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(int count)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportInitial value) initial,
    required TResult Function(ImportLoading value) loading,
    required TResult Function(ImportError value) error,
    required TResult Function(JustImported value) justImported,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
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
  const factory ImportCompleted(final int count) = _$ImportCompleted;

  int get count;
  @JsonKey(ignore: true)
  _$$ImportCompletedCopyWith<_$ImportCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}
