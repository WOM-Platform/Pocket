// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_totem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyTotemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)
        loaded,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(MyTotemError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(MyTotemError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(MyTotemError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyTotemStateLoaded value) loaded,
    required TResult Function(MyTotemStateLoading value) loading,
    required TResult Function(MyTotemStateEmpty value) empty,
    required TResult Function(MyTotemStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyTotemStateLoaded value)? loaded,
    TResult? Function(MyTotemStateLoading value)? loading,
    TResult? Function(MyTotemStateEmpty value)? empty,
    TResult? Function(MyTotemStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyTotemStateLoaded value)? loaded,
    TResult Function(MyTotemStateLoading value)? loading,
    TResult Function(MyTotemStateEmpty value)? empty,
    TResult Function(MyTotemStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTotemStateCopyWith<$Res> {
  factory $MyTotemStateCopyWith(
          MyTotemState value, $Res Function(MyTotemState) then) =
      _$MyTotemStateCopyWithImpl<$Res, MyTotemState>;
}

/// @nodoc
class _$MyTotemStateCopyWithImpl<$Res, $Val extends MyTotemState>
    implements $MyTotemStateCopyWith<$Res> {
  _$MyTotemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MyTotemStateLoadedImplCopyWith<$Res> {
  factory _$$MyTotemStateLoadedImplCopyWith(_$MyTotemStateLoadedImpl value,
          $Res Function(_$MyTotemStateLoadedImpl) then) =
      __$$MyTotemStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      String totemId,
      String totemLink,
      bool isRefreshing,
      String? email,
      String? phone,
      String? website});
}

/// @nodoc
class __$$MyTotemStateLoadedImplCopyWithImpl<$Res>
    extends _$MyTotemStateCopyWithImpl<$Res, _$MyTotemStateLoadedImpl>
    implements _$$MyTotemStateLoadedImplCopyWith<$Res> {
  __$$MyTotemStateLoadedImplCopyWithImpl(_$MyTotemStateLoadedImpl _value,
      $Res Function(_$MyTotemStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totemId = null,
    Object? totemLink = null,
    Object? isRefreshing = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? website = freezed,
  }) {
    return _then(_$MyTotemStateLoadedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      totemLink: null == totemLink
          ? _value.totemLink
          : totemLink // ignore: cast_nullable_to_non_nullable
              as String,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyTotemStateLoadedImpl implements MyTotemStateLoaded {
  const _$MyTotemStateLoadedImpl(
      {required this.name,
      required this.totemId,
      required this.totemLink,
      this.isRefreshing = false,
      this.email,
      this.phone,
      this.website});

  @override
  final String name;
  @override
  final String totemId;
  @override
  final String totemLink;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? website;

  @override
  String toString() {
    return 'MyTotemState.loaded(name: $name, totemId: $totemId, totemLink: $totemLink, isRefreshing: $isRefreshing, email: $email, phone: $phone, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTotemStateLoadedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totemId, totemId) || other.totemId == totemId) &&
            (identical(other.totemLink, totemLink) ||
                other.totemLink == totemLink) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.website, website) || other.website == website));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, totemId, totemLink,
      isRefreshing, email, phone, website);

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTotemStateLoadedImplCopyWith<_$MyTotemStateLoadedImpl> get copyWith =>
      __$$MyTotemStateLoadedImplCopyWithImpl<_$MyTotemStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)
        loaded,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(MyTotemError error) error,
  }) {
    return loaded(
        name, totemId, totemLink, isRefreshing, email, phone, website);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(MyTotemError error)? error,
  }) {
    return loaded?.call(
        name, totemId, totemLink, isRefreshing, email, phone, website);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(MyTotemError error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          name, totemId, totemLink, isRefreshing, email, phone, website);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyTotemStateLoaded value) loaded,
    required TResult Function(MyTotemStateLoading value) loading,
    required TResult Function(MyTotemStateEmpty value) empty,
    required TResult Function(MyTotemStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyTotemStateLoaded value)? loaded,
    TResult? Function(MyTotemStateLoading value)? loading,
    TResult? Function(MyTotemStateEmpty value)? empty,
    TResult? Function(MyTotemStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyTotemStateLoaded value)? loaded,
    TResult Function(MyTotemStateLoading value)? loading,
    TResult Function(MyTotemStateEmpty value)? empty,
    TResult Function(MyTotemStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MyTotemStateLoaded implements MyTotemState {
  const factory MyTotemStateLoaded(
      {required final String name,
      required final String totemId,
      required final String totemLink,
      final bool isRefreshing,
      final String? email,
      final String? phone,
      final String? website}) = _$MyTotemStateLoadedImpl;

  String get name;
  String get totemId;
  String get totemLink;
  bool get isRefreshing;
  String? get email;
  String? get phone;
  String? get website;

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTotemStateLoadedImplCopyWith<_$MyTotemStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyTotemStateLoadingImplCopyWith<$Res> {
  factory _$$MyTotemStateLoadingImplCopyWith(_$MyTotemStateLoadingImpl value,
          $Res Function(_$MyTotemStateLoadingImpl) then) =
      __$$MyTotemStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyTotemStateLoadingImplCopyWithImpl<$Res>
    extends _$MyTotemStateCopyWithImpl<$Res, _$MyTotemStateLoadingImpl>
    implements _$$MyTotemStateLoadingImplCopyWith<$Res> {
  __$$MyTotemStateLoadingImplCopyWithImpl(_$MyTotemStateLoadingImpl _value,
      $Res Function(_$MyTotemStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyTotemStateLoadingImpl implements MyTotemStateLoading {
  const _$MyTotemStateLoadingImpl();

  @override
  String toString() {
    return 'MyTotemState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTotemStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)
        loaded,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(MyTotemError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(MyTotemError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(MyTotemError error)? error,
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
    required TResult Function(MyTotemStateLoaded value) loaded,
    required TResult Function(MyTotemStateLoading value) loading,
    required TResult Function(MyTotemStateEmpty value) empty,
    required TResult Function(MyTotemStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyTotemStateLoaded value)? loaded,
    TResult? Function(MyTotemStateLoading value)? loading,
    TResult? Function(MyTotemStateEmpty value)? empty,
    TResult? Function(MyTotemStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyTotemStateLoaded value)? loaded,
    TResult Function(MyTotemStateLoading value)? loading,
    TResult Function(MyTotemStateEmpty value)? empty,
    TResult Function(MyTotemStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyTotemStateLoading implements MyTotemState {
  const factory MyTotemStateLoading() = _$MyTotemStateLoadingImpl;
}

/// @nodoc
abstract class _$$MyTotemStateEmptyImplCopyWith<$Res> {
  factory _$$MyTotemStateEmptyImplCopyWith(_$MyTotemStateEmptyImpl value,
          $Res Function(_$MyTotemStateEmptyImpl) then) =
      __$$MyTotemStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyTotemStateEmptyImplCopyWithImpl<$Res>
    extends _$MyTotemStateCopyWithImpl<$Res, _$MyTotemStateEmptyImpl>
    implements _$$MyTotemStateEmptyImplCopyWith<$Res> {
  __$$MyTotemStateEmptyImplCopyWithImpl(_$MyTotemStateEmptyImpl _value,
      $Res Function(_$MyTotemStateEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyTotemStateEmptyImpl implements MyTotemStateEmpty {
  const _$MyTotemStateEmptyImpl();

  @override
  String toString() {
    return 'MyTotemState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyTotemStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)
        loaded,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(MyTotemError error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(MyTotemError error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(MyTotemError error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyTotemStateLoaded value) loaded,
    required TResult Function(MyTotemStateLoading value) loading,
    required TResult Function(MyTotemStateEmpty value) empty,
    required TResult Function(MyTotemStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyTotemStateLoaded value)? loaded,
    TResult? Function(MyTotemStateLoading value)? loading,
    TResult? Function(MyTotemStateEmpty value)? empty,
    TResult? Function(MyTotemStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyTotemStateLoaded value)? loaded,
    TResult Function(MyTotemStateLoading value)? loading,
    TResult Function(MyTotemStateEmpty value)? empty,
    TResult Function(MyTotemStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class MyTotemStateEmpty implements MyTotemState {
  const factory MyTotemStateEmpty() = _$MyTotemStateEmptyImpl;
}

/// @nodoc
abstract class _$$MyTotemStateErrorImplCopyWith<$Res> {
  factory _$$MyTotemStateErrorImplCopyWith(_$MyTotemStateErrorImpl value,
          $Res Function(_$MyTotemStateErrorImpl) then) =
      __$$MyTotemStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyTotemError error});
}

/// @nodoc
class __$$MyTotemStateErrorImplCopyWithImpl<$Res>
    extends _$MyTotemStateCopyWithImpl<$Res, _$MyTotemStateErrorImpl>
    implements _$$MyTotemStateErrorImplCopyWith<$Res> {
  __$$MyTotemStateErrorImplCopyWithImpl(_$MyTotemStateErrorImpl _value,
      $Res Function(_$MyTotemStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MyTotemStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as MyTotemError,
    ));
  }
}

/// @nodoc

class _$MyTotemStateErrorImpl implements MyTotemStateError {
  const _$MyTotemStateErrorImpl(this.error);

  @override
  final MyTotemError error;

  @override
  String toString() {
    return 'MyTotemState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTotemStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTotemStateErrorImplCopyWith<_$MyTotemStateErrorImpl> get copyWith =>
      __$$MyTotemStateErrorImplCopyWithImpl<_$MyTotemStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)
        loaded,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(MyTotemError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(MyTotemError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String totemId, String totemLink,
            bool isRefreshing, String? email, String? phone, String? website)?
        loaded,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(MyTotemError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyTotemStateLoaded value) loaded,
    required TResult Function(MyTotemStateLoading value) loading,
    required TResult Function(MyTotemStateEmpty value) empty,
    required TResult Function(MyTotemStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyTotemStateLoaded value)? loaded,
    TResult? Function(MyTotemStateLoading value)? loading,
    TResult? Function(MyTotemStateEmpty value)? empty,
    TResult? Function(MyTotemStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyTotemStateLoaded value)? loaded,
    TResult Function(MyTotemStateLoading value)? loading,
    TResult Function(MyTotemStateEmpty value)? empty,
    TResult Function(MyTotemStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MyTotemStateError implements MyTotemState {
  const factory MyTotemStateError(final MyTotemError error) =
      _$MyTotemStateErrorImpl;

  MyTotemError get error;

  /// Create a copy of MyTotemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTotemStateErrorImplCopyWith<_$MyTotemStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
