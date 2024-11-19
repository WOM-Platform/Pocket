// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
    required TResult Function(int count) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
    TResult? Function(int count)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    required TResult Function(ImportSummary value) importSummary,
    required TResult Function(ImportCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportSummary value)? importSummary,
    TResult? Function(ImportCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
    TResult Function(ImportSummary value)? importSummary,
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

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ImportInitialImplCopyWith<$Res> {
  factory _$$ImportInitialImplCopyWith(
          _$ImportInitialImpl value, $Res Function(_$ImportInitialImpl) then) =
      __$$ImportInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImportInitialImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportInitialImpl>
    implements _$$ImportInitialImplCopyWith<$Res> {
  __$$ImportInitialImplCopyWithImpl(
      _$ImportInitialImpl _value, $Res Function(_$ImportInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ImportInitialImpl
    with DiagnosticableTreeMixin
    implements ImportInitial {
  const _$ImportInitialImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImportInitialImpl);
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
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
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
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    required TResult Function(ImportSummary value) importSummary,
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
    TResult? Function(ImportSummary value)? importSummary,
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
    TResult Function(ImportSummary value)? importSummary,
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
  const factory ImportInitial() = _$ImportInitialImpl;
}

/// @nodoc
abstract class _$$ImportLoadingImplCopyWith<$Res> {
  factory _$$ImportLoadingImplCopyWith(
          _$ImportLoadingImpl value, $Res Function(_$ImportLoadingImpl) then) =
      __$$ImportLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImportLoadingImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportLoadingImpl>
    implements _$$ImportLoadingImplCopyWith<$Res> {
  __$$ImportLoadingImplCopyWithImpl(
      _$ImportLoadingImpl _value, $Res Function(_$ImportLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ImportLoadingImpl
    with DiagnosticableTreeMixin
    implements ImportLoading {
  const _$ImportLoadingImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImportLoadingImpl);
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
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
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
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    required TResult Function(ImportSummary value) importSummary,
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
    TResult? Function(ImportSummary value)? importSummary,
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
    TResult Function(ImportSummary value)? importSummary,
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
  const factory ImportLoading() = _$ImportLoadingImpl;
}

/// @nodoc
abstract class _$$ImportErrorImplCopyWith<$Res> {
  factory _$$ImportErrorImplCopyWith(
          _$ImportErrorImpl value, $Res Function(_$ImportErrorImpl) then) =
      __$$ImportErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object ex, StackTrace st});
}

/// @nodoc
class __$$ImportErrorImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportErrorImpl>
    implements _$$ImportErrorImplCopyWith<$Res> {
  __$$ImportErrorImplCopyWithImpl(
      _$ImportErrorImpl _value, $Res Function(_$ImportErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ex = null,
    Object? st = null,
  }) {
    return _then(_$ImportErrorImpl(
      null == ex ? _value.ex : ex,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ImportErrorImpl with DiagnosticableTreeMixin implements ImportError {
  const _$ImportErrorImpl(this.ex, this.st);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportErrorImpl &&
            const DeepCollectionEquality().equals(other.ex, ex) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ex), st);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportErrorImplCopyWith<_$ImportErrorImpl> get copyWith =>
      __$$ImportErrorImplCopyWithImpl<_$ImportErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
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
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    required TResult Function(ImportSummary value) importSummary,
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
    TResult? Function(ImportSummary value)? importSummary,
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
    TResult Function(ImportSummary value)? importSummary,
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
      _$ImportErrorImpl;

  Object get ex;
  StackTrace get st;

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportErrorImplCopyWith<_$ImportErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JustImportedImplCopyWith<$Res> {
  factory _$$JustImportedImplCopyWith(
          _$JustImportedImpl value, $Res Function(_$JustImportedImpl) then) =
      __$$JustImportedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JustImportedImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$JustImportedImpl>
    implements _$$JustImportedImplCopyWith<$Res> {
  __$$JustImportedImplCopyWithImpl(
      _$JustImportedImpl _value, $Res Function(_$JustImportedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JustImportedImpl with DiagnosticableTreeMixin implements JustImported {
  const _$JustImportedImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JustImportedImpl);
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
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
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
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    required TResult Function(ImportSummary value) importSummary,
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
    TResult? Function(ImportSummary value)? importSummary,
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
    TResult Function(ImportSummary value)? importSummary,
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
  const factory JustImported() = _$JustImportedImpl;
}

/// @nodoc
abstract class _$$ImportSummaryImplCopyWith<$Res> {
  factory _$$ImportSummaryImplCopyWith(
          _$ImportSummaryImpl value, $Res Function(_$ImportSummaryImpl) then) =
      __$$ImportSummaryImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<TotemRow> totems,
      List<WomRow> woms,
      List<Aim> aims,
      String otc,
      String device,
      String password});
}

/// @nodoc
class __$$ImportSummaryImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportSummaryImpl>
    implements _$$ImportSummaryImplCopyWith<$Res> {
  __$$ImportSummaryImplCopyWithImpl(
      _$ImportSummaryImpl _value, $Res Function(_$ImportSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totems = null,
    Object? woms = null,
    Object? aims = null,
    Object? otc = null,
    Object? device = null,
    Object? password = null,
  }) {
    return _then(_$ImportSummaryImpl(
      totems: null == totems
          ? _value._totems
          : totems // ignore: cast_nullable_to_non_nullable
              as List<TotemRow>,
      woms: null == woms
          ? _value._woms
          : woms // ignore: cast_nullable_to_non_nullable
              as List<WomRow>,
      aims: null == aims
          ? _value._aims
          : aims // ignore: cast_nullable_to_non_nullable
              as List<Aim>,
      otc: null == otc
          ? _value.otc
          : otc // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImportSummaryImpl
    with DiagnosticableTreeMixin
    implements ImportSummary {
  const _$ImportSummaryImpl(
      {required final List<TotemRow> totems,
      required final List<WomRow> woms,
      required final List<Aim> aims,
      required this.otc,
      required this.device,
      required this.password})
      : _totems = totems,
        _woms = woms,
        _aims = aims;

  final List<TotemRow> _totems;
  @override
  List<TotemRow> get totems {
    if (_totems is EqualUnmodifiableListView) return _totems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totems);
  }

  final List<WomRow> _woms;
  @override
  List<WomRow> get woms {
    if (_woms is EqualUnmodifiableListView) return _woms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_woms);
  }

  final List<Aim> _aims;
  @override
  List<Aim> get aims {
    if (_aims is EqualUnmodifiableListView) return _aims;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aims);
  }

  @override
  final String otc;
  @override
  final String device;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImportState.importSummary(totems: $totems, woms: $woms, aims: $aims, otc: $otc, device: $device, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImportState.importSummary'))
      ..add(DiagnosticsProperty('totems', totems))
      ..add(DiagnosticsProperty('woms', woms))
      ..add(DiagnosticsProperty('aims', aims))
      ..add(DiagnosticsProperty('otc', otc))
      ..add(DiagnosticsProperty('device', device))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportSummaryImpl &&
            const DeepCollectionEquality().equals(other._totems, _totems) &&
            const DeepCollectionEquality().equals(other._woms, _woms) &&
            const DeepCollectionEquality().equals(other._aims, _aims) &&
            (identical(other.otc, otc) || other.otc == otc) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_totems),
      const DeepCollectionEquality().hash(_woms),
      const DeepCollectionEquality().hash(_aims),
      otc,
      device,
      password);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportSummaryImplCopyWith<_$ImportSummaryImpl> get copyWith =>
      __$$ImportSummaryImplCopyWithImpl<_$ImportSummaryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
    required TResult Function(int count) completed,
  }) {
    return importSummary(totems, woms, aims, otc, device, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object ex, StackTrace st)? error,
    TResult? Function()? justImported,
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
    TResult? Function(int count)? completed,
  }) {
    return importSummary?.call(totems, woms, aims, otc, device, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object ex, StackTrace st)? error,
    TResult Function()? justImported,
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
    TResult Function(int count)? completed,
    required TResult orElse(),
  }) {
    if (importSummary != null) {
      return importSummary(totems, woms, aims, otc, device, password);
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
    required TResult Function(ImportSummary value) importSummary,
    required TResult Function(ImportCompleted value) completed,
  }) {
    return importSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImportInitial value)? initial,
    TResult? Function(ImportLoading value)? loading,
    TResult? Function(ImportError value)? error,
    TResult? Function(JustImported value)? justImported,
    TResult? Function(ImportSummary value)? importSummary,
    TResult? Function(ImportCompleted value)? completed,
  }) {
    return importSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportInitial value)? initial,
    TResult Function(ImportLoading value)? loading,
    TResult Function(ImportError value)? error,
    TResult Function(JustImported value)? justImported,
    TResult Function(ImportSummary value)? importSummary,
    TResult Function(ImportCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (importSummary != null) {
      return importSummary(this);
    }
    return orElse();
  }
}

abstract class ImportSummary implements ImportState {
  const factory ImportSummary(
      {required final List<TotemRow> totems,
      required final List<WomRow> woms,
      required final List<Aim> aims,
      required final String otc,
      required final String device,
      required final String password}) = _$ImportSummaryImpl;

  List<TotemRow> get totems;
  List<WomRow> get woms;
  List<Aim> get aims;
  String get otc;
  String get device;
  String get password;

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportSummaryImplCopyWith<_$ImportSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportCompletedImplCopyWith<$Res> {
  factory _$$ImportCompletedImplCopyWith(_$ImportCompletedImpl value,
          $Res Function(_$ImportCompletedImpl) then) =
      __$$ImportCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$ImportCompletedImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportCompletedImpl>
    implements _$$ImportCompletedImplCopyWith<$Res> {
  __$$ImportCompletedImplCopyWithImpl(
      _$ImportCompletedImpl _value, $Res Function(_$ImportCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$ImportCompletedImpl(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ImportCompletedImpl
    with DiagnosticableTreeMixin
    implements ImportCompleted {
  const _$ImportCompletedImpl(this.count);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportCompletedImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportCompletedImplCopyWith<_$ImportCompletedImpl> get copyWith =>
      __$$ImportCompletedImplCopyWithImpl<_$ImportCompletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object ex, StackTrace st) error,
    required TResult Function() justImported,
    required TResult Function(List<TotemRow> totems, List<WomRow> woms,
            List<Aim> aims, String otc, String device, String password)
        importSummary,
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
    TResult? Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    TResult Function(List<TotemRow> totems, List<WomRow> woms, List<Aim> aims,
            String otc, String device, String password)?
        importSummary,
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
    required TResult Function(ImportSummary value) importSummary,
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
    TResult? Function(ImportSummary value)? importSummary,
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
    TResult Function(ImportSummary value)? importSummary,
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
  const factory ImportCompleted(final int count) = _$ImportCompletedImpl;

  int get count;

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportCompletedImplCopyWith<_$ImportCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
