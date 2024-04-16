// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyLocationException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() missingPermission,
    required TResult Function() serviceDisabled,
    required TResult Function(Object ex, StackTrace? stackTrace) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? missingPermission,
    TResult? Function()? serviceDisabled,
    TResult? Function(Object ex, StackTrace? stackTrace)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? missingPermission,
    TResult Function()? serviceDisabled,
    TResult Function(Object ex, StackTrace? stackTrace)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationTimeoutException value) timeout,
    required TResult Function(LocationPermissionException value)
        missingPermission,
    required TResult Function(LocationDisabledException value) serviceDisabled,
    required TResult Function(LocationUnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationTimeoutException value)? timeout,
    TResult? Function(LocationPermissionException value)? missingPermission,
    TResult? Function(LocationDisabledException value)? serviceDisabled,
    TResult? Function(LocationUnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationTimeoutException value)? timeout,
    TResult Function(LocationPermissionException value)? missingPermission,
    TResult Function(LocationDisabledException value)? serviceDisabled,
    TResult Function(LocationUnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyLocationExceptionCopyWith<$Res> {
  factory $MyLocationExceptionCopyWith(
          MyLocationException value, $Res Function(MyLocationException) then) =
      _$MyLocationExceptionCopyWithImpl<$Res, MyLocationException>;
}

/// @nodoc
class _$MyLocationExceptionCopyWithImpl<$Res, $Val extends MyLocationException>
    implements $MyLocationExceptionCopyWith<$Res> {
  _$MyLocationExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LocationTimeoutExceptionImplCopyWith<$Res> {
  factory _$$LocationTimeoutExceptionImplCopyWith(
          _$LocationTimeoutExceptionImpl value,
          $Res Function(_$LocationTimeoutExceptionImpl) then) =
      __$$LocationTimeoutExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationTimeoutExceptionImplCopyWithImpl<$Res>
    extends _$MyLocationExceptionCopyWithImpl<$Res,
        _$LocationTimeoutExceptionImpl>
    implements _$$LocationTimeoutExceptionImplCopyWith<$Res> {
  __$$LocationTimeoutExceptionImplCopyWithImpl(
      _$LocationTimeoutExceptionImpl _value,
      $Res Function(_$LocationTimeoutExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationTimeoutExceptionImpl implements LocationTimeoutException {
  const _$LocationTimeoutExceptionImpl();

  @override
  String toString() {
    return 'MyLocationException.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationTimeoutExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() missingPermission,
    required TResult Function() serviceDisabled,
    required TResult Function(Object ex, StackTrace? stackTrace) unknown,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? missingPermission,
    TResult? Function()? serviceDisabled,
    TResult? Function(Object ex, StackTrace? stackTrace)? unknown,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? missingPermission,
    TResult Function()? serviceDisabled,
    TResult Function(Object ex, StackTrace? stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationTimeoutException value) timeout,
    required TResult Function(LocationPermissionException value)
        missingPermission,
    required TResult Function(LocationDisabledException value) serviceDisabled,
    required TResult Function(LocationUnknownException value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationTimeoutException value)? timeout,
    TResult? Function(LocationPermissionException value)? missingPermission,
    TResult? Function(LocationDisabledException value)? serviceDisabled,
    TResult? Function(LocationUnknownException value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationTimeoutException value)? timeout,
    TResult Function(LocationPermissionException value)? missingPermission,
    TResult Function(LocationDisabledException value)? serviceDisabled,
    TResult Function(LocationUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class LocationTimeoutException implements MyLocationException {
  const factory LocationTimeoutException() = _$LocationTimeoutExceptionImpl;
}

/// @nodoc
abstract class _$$LocationPermissionExceptionImplCopyWith<$Res> {
  factory _$$LocationPermissionExceptionImplCopyWith(
          _$LocationPermissionExceptionImpl value,
          $Res Function(_$LocationPermissionExceptionImpl) then) =
      __$$LocationPermissionExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationPermissionExceptionImplCopyWithImpl<$Res>
    extends _$MyLocationExceptionCopyWithImpl<$Res,
        _$LocationPermissionExceptionImpl>
    implements _$$LocationPermissionExceptionImplCopyWith<$Res> {
  __$$LocationPermissionExceptionImplCopyWithImpl(
      _$LocationPermissionExceptionImpl _value,
      $Res Function(_$LocationPermissionExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationPermissionExceptionImpl implements LocationPermissionException {
  const _$LocationPermissionExceptionImpl();

  @override
  String toString() {
    return 'MyLocationException.missingPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() missingPermission,
    required TResult Function() serviceDisabled,
    required TResult Function(Object ex, StackTrace? stackTrace) unknown,
  }) {
    return missingPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? missingPermission,
    TResult? Function()? serviceDisabled,
    TResult? Function(Object ex, StackTrace? stackTrace)? unknown,
  }) {
    return missingPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? missingPermission,
    TResult Function()? serviceDisabled,
    TResult Function(Object ex, StackTrace? stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (missingPermission != null) {
      return missingPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationTimeoutException value) timeout,
    required TResult Function(LocationPermissionException value)
        missingPermission,
    required TResult Function(LocationDisabledException value) serviceDisabled,
    required TResult Function(LocationUnknownException value) unknown,
  }) {
    return missingPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationTimeoutException value)? timeout,
    TResult? Function(LocationPermissionException value)? missingPermission,
    TResult? Function(LocationDisabledException value)? serviceDisabled,
    TResult? Function(LocationUnknownException value)? unknown,
  }) {
    return missingPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationTimeoutException value)? timeout,
    TResult Function(LocationPermissionException value)? missingPermission,
    TResult Function(LocationDisabledException value)? serviceDisabled,
    TResult Function(LocationUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (missingPermission != null) {
      return missingPermission(this);
    }
    return orElse();
  }
}

abstract class LocationPermissionException implements MyLocationException {
  const factory LocationPermissionException() =
      _$LocationPermissionExceptionImpl;
}

/// @nodoc
abstract class _$$LocationDisabledExceptionImplCopyWith<$Res> {
  factory _$$LocationDisabledExceptionImplCopyWith(
          _$LocationDisabledExceptionImpl value,
          $Res Function(_$LocationDisabledExceptionImpl) then) =
      __$$LocationDisabledExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationDisabledExceptionImplCopyWithImpl<$Res>
    extends _$MyLocationExceptionCopyWithImpl<$Res,
        _$LocationDisabledExceptionImpl>
    implements _$$LocationDisabledExceptionImplCopyWith<$Res> {
  __$$LocationDisabledExceptionImplCopyWithImpl(
      _$LocationDisabledExceptionImpl _value,
      $Res Function(_$LocationDisabledExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationDisabledExceptionImpl implements LocationDisabledException {
  const _$LocationDisabledExceptionImpl();

  @override
  String toString() {
    return 'MyLocationException.serviceDisabled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDisabledExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() missingPermission,
    required TResult Function() serviceDisabled,
    required TResult Function(Object ex, StackTrace? stackTrace) unknown,
  }) {
    return serviceDisabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? missingPermission,
    TResult? Function()? serviceDisabled,
    TResult? Function(Object ex, StackTrace? stackTrace)? unknown,
  }) {
    return serviceDisabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? missingPermission,
    TResult Function()? serviceDisabled,
    TResult Function(Object ex, StackTrace? stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (serviceDisabled != null) {
      return serviceDisabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationTimeoutException value) timeout,
    required TResult Function(LocationPermissionException value)
        missingPermission,
    required TResult Function(LocationDisabledException value) serviceDisabled,
    required TResult Function(LocationUnknownException value) unknown,
  }) {
    return serviceDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationTimeoutException value)? timeout,
    TResult? Function(LocationPermissionException value)? missingPermission,
    TResult? Function(LocationDisabledException value)? serviceDisabled,
    TResult? Function(LocationUnknownException value)? unknown,
  }) {
    return serviceDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationTimeoutException value)? timeout,
    TResult Function(LocationPermissionException value)? missingPermission,
    TResult Function(LocationDisabledException value)? serviceDisabled,
    TResult Function(LocationUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (serviceDisabled != null) {
      return serviceDisabled(this);
    }
    return orElse();
  }
}

abstract class LocationDisabledException implements MyLocationException {
  const factory LocationDisabledException() = _$LocationDisabledExceptionImpl;
}

/// @nodoc
abstract class _$$LocationUnknownExceptionImplCopyWith<$Res> {
  factory _$$LocationUnknownExceptionImplCopyWith(
          _$LocationUnknownExceptionImpl value,
          $Res Function(_$LocationUnknownExceptionImpl) then) =
      __$$LocationUnknownExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object ex, StackTrace? stackTrace});
}

/// @nodoc
class __$$LocationUnknownExceptionImplCopyWithImpl<$Res>
    extends _$MyLocationExceptionCopyWithImpl<$Res,
        _$LocationUnknownExceptionImpl>
    implements _$$LocationUnknownExceptionImplCopyWith<$Res> {
  __$$LocationUnknownExceptionImplCopyWithImpl(
      _$LocationUnknownExceptionImpl _value,
      $Res Function(_$LocationUnknownExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ex = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$LocationUnknownExceptionImpl(
      ex: null == ex ? _value.ex : ex,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$LocationUnknownExceptionImpl implements LocationUnknownException {
  const _$LocationUnknownExceptionImpl({required this.ex, this.stackTrace});

  @override
  final Object ex;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'MyLocationException.unknown(ex: $ex, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUnknownExceptionImpl &&
            const DeepCollectionEquality().equals(other.ex, ex) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(ex), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUnknownExceptionImplCopyWith<_$LocationUnknownExceptionImpl>
      get copyWith => __$$LocationUnknownExceptionImplCopyWithImpl<
          _$LocationUnknownExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() missingPermission,
    required TResult Function() serviceDisabled,
    required TResult Function(Object ex, StackTrace? stackTrace) unknown,
  }) {
    return unknown(ex, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? missingPermission,
    TResult? Function()? serviceDisabled,
    TResult? Function(Object ex, StackTrace? stackTrace)? unknown,
  }) {
    return unknown?.call(ex, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? missingPermission,
    TResult Function()? serviceDisabled,
    TResult Function(Object ex, StackTrace? stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(ex, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationTimeoutException value) timeout,
    required TResult Function(LocationPermissionException value)
        missingPermission,
    required TResult Function(LocationDisabledException value) serviceDisabled,
    required TResult Function(LocationUnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationTimeoutException value)? timeout,
    TResult? Function(LocationPermissionException value)? missingPermission,
    TResult? Function(LocationDisabledException value)? serviceDisabled,
    TResult? Function(LocationUnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationTimeoutException value)? timeout,
    TResult Function(LocationPermissionException value)? missingPermission,
    TResult Function(LocationDisabledException value)? serviceDisabled,
    TResult Function(LocationUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class LocationUnknownException implements MyLocationException {
  const factory LocationUnknownException(
      {required final Object ex,
      final StackTrace? stackTrace}) = _$LocationUnknownExceptionImpl;

  Object get ex;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$LocationUnknownExceptionImplCopyWith<_$LocationUnknownExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
