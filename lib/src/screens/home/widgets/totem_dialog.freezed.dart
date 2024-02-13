// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totem_dialog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TotemResponse _$TotemResponseFromJson(Map<String, dynamic> json) {
  return _TotemResponse.fromJson(json);
}

/// @nodoc
mixin _$TotemResponse {
  String get status => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotemResponseCopyWith<TotemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotemResponseCopyWith<$Res> {
  factory $TotemResponseCopyWith(
          TotemResponse value, $Res Function(TotemResponse) then) =
      _$TotemResponseCopyWithImpl<$Res, TotemResponse>;
  @useResult
  $Res call(
      {String status,
      String? sessionId,
      String? eventId,
      String? link,
      String? pin});
}

/// @nodoc
class _$TotemResponseCopyWithImpl<$Res, $Val extends TotemResponse>
    implements $TotemResponseCopyWith<$Res> {
  _$TotemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessionId = freezed,
    Object? eventId = freezed,
    Object? link = freezed,
    Object? pin = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotemResponseImplCopyWith<$Res>
    implements $TotemResponseCopyWith<$Res> {
  factory _$$TotemResponseImplCopyWith(
          _$TotemResponseImpl value, $Res Function(_$TotemResponseImpl) then) =
      __$$TotemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String? sessionId,
      String? eventId,
      String? link,
      String? pin});
}

/// @nodoc
class __$$TotemResponseImplCopyWithImpl<$Res>
    extends _$TotemResponseCopyWithImpl<$Res, _$TotemResponseImpl>
    implements _$$TotemResponseImplCopyWith<$Res> {
  __$$TotemResponseImplCopyWithImpl(
      _$TotemResponseImpl _value, $Res Function(_$TotemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessionId = freezed,
    Object? eventId = freezed,
    Object? link = freezed,
    Object? pin = freezed,
  }) {
    return _then(_$TotemResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotemResponseImpl implements _TotemResponse {
  const _$TotemResponseImpl(
      {required this.status,
      this.sessionId,
      this.eventId,
      this.link,
      this.pin});

  factory _$TotemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotemResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String? sessionId;
  @override
  final String? eventId;
  @override
  final String? link;
  @override
  final String? pin;

  @override
  String toString() {
    return 'TotemResponse(status: $status, sessionId: $sessionId, eventId: $eventId, link: $link, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, sessionId, eventId, link, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotemResponseImplCopyWith<_$TotemResponseImpl> get copyWith =>
      __$$TotemResponseImplCopyWithImpl<_$TotemResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotemResponseImplToJson(
      this,
    );
  }
}

abstract class _TotemResponse implements TotemResponse {
  const factory _TotemResponse(
      {required final String status,
      final String? sessionId,
      final String? eventId,
      final String? link,
      final String? pin}) = _$TotemResponseImpl;

  factory _TotemResponse.fromJson(Map<String, dynamic> json) =
      _$TotemResponseImpl.fromJson;

  @override
  String get status;
  @override
  String? get sessionId;
  @override
  String? get eventId;
  @override
  String? get link;
  @override
  String? get pin;
  @override
  @JsonKey(ignore: true)
  _$$TotemResponseImplCopyWith<_$TotemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TotemDialogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeepLinkModel deepLinkModel, String password)
        complete,
    required TResult Function() retrievingGPS,
    required TResult Function() serverCommunication,
    required TResult Function() genderRequest,
    required TResult Function(
            TotemError totemError, Object error, StackTrace? st)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult? Function()? retrievingGPS,
    TResult? Function()? serverCommunication,
    TResult? Function()? genderRequest,
    TResult? Function(TotemError totemError, Object error, StackTrace? st)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult Function()? retrievingGPS,
    TResult Function()? serverCommunication,
    TResult Function()? genderRequest,
    TResult Function(TotemError totemError, Object error, StackTrace? st)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TotemDialogComplete value) complete,
    required TResult Function(TotemDialogRetrievingGPS value) retrievingGPS,
    required TResult Function(TotemDialogCommunicationWithServer value)
        serverCommunication,
    required TResult Function(TotemDialogGenderRequest value) genderRequest,
    required TResult Function(TotemDialogStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TotemDialogComplete value)? complete,
    TResult? Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult? Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult? Function(TotemDialogGenderRequest value)? genderRequest,
    TResult? Function(TotemDialogStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TotemDialogComplete value)? complete,
    TResult Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult Function(TotemDialogGenderRequest value)? genderRequest,
    TResult Function(TotemDialogStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotemDialogStateCopyWith<$Res> {
  factory $TotemDialogStateCopyWith(
          TotemDialogState value, $Res Function(TotemDialogState) then) =
      _$TotemDialogStateCopyWithImpl<$Res, TotemDialogState>;
}

/// @nodoc
class _$TotemDialogStateCopyWithImpl<$Res, $Val extends TotemDialogState>
    implements $TotemDialogStateCopyWith<$Res> {
  _$TotemDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TotemDialogCompleteImplCopyWith<$Res> {
  factory _$$TotemDialogCompleteImplCopyWith(_$TotemDialogCompleteImpl value,
          $Res Function(_$TotemDialogCompleteImpl) then) =
      __$$TotemDialogCompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeepLinkModel deepLinkModel, String password});
}

/// @nodoc
class __$$TotemDialogCompleteImplCopyWithImpl<$Res>
    extends _$TotemDialogStateCopyWithImpl<$Res, _$TotemDialogCompleteImpl>
    implements _$$TotemDialogCompleteImplCopyWith<$Res> {
  __$$TotemDialogCompleteImplCopyWithImpl(_$TotemDialogCompleteImpl _value,
      $Res Function(_$TotemDialogCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deepLinkModel = null,
    Object? password = null,
  }) {
    return _then(_$TotemDialogCompleteImpl(
      deepLinkModel: null == deepLinkModel
          ? _value.deepLinkModel
          : deepLinkModel // ignore: cast_nullable_to_non_nullable
              as DeepLinkModel,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TotemDialogCompleteImpl implements TotemDialogComplete {
  const _$TotemDialogCompleteImpl(
      {required this.deepLinkModel, required this.password});

  @override
  final DeepLinkModel deepLinkModel;
  @override
  final String password;

  @override
  String toString() {
    return 'TotemDialogState.complete(deepLinkModel: $deepLinkModel, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDialogCompleteImpl &&
            (identical(other.deepLinkModel, deepLinkModel) ||
                other.deepLinkModel == deepLinkModel) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deepLinkModel, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotemDialogCompleteImplCopyWith<_$TotemDialogCompleteImpl> get copyWith =>
      __$$TotemDialogCompleteImplCopyWithImpl<_$TotemDialogCompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeepLinkModel deepLinkModel, String password)
        complete,
    required TResult Function() retrievingGPS,
    required TResult Function() serverCommunication,
    required TResult Function() genderRequest,
    required TResult Function(
            TotemError totemError, Object error, StackTrace? st)
        error,
  }) {
    return complete(deepLinkModel, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult? Function()? retrievingGPS,
    TResult? Function()? serverCommunication,
    TResult? Function()? genderRequest,
    TResult? Function(TotemError totemError, Object error, StackTrace? st)?
        error,
  }) {
    return complete?.call(deepLinkModel, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult Function()? retrievingGPS,
    TResult Function()? serverCommunication,
    TResult Function()? genderRequest,
    TResult Function(TotemError totemError, Object error, StackTrace? st)?
        error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(deepLinkModel, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TotemDialogComplete value) complete,
    required TResult Function(TotemDialogRetrievingGPS value) retrievingGPS,
    required TResult Function(TotemDialogCommunicationWithServer value)
        serverCommunication,
    required TResult Function(TotemDialogGenderRequest value) genderRequest,
    required TResult Function(TotemDialogStateError value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TotemDialogComplete value)? complete,
    TResult? Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult? Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult? Function(TotemDialogGenderRequest value)? genderRequest,
    TResult? Function(TotemDialogStateError value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TotemDialogComplete value)? complete,
    TResult Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult Function(TotemDialogGenderRequest value)? genderRequest,
    TResult Function(TotemDialogStateError value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class TotemDialogComplete implements TotemDialogState {
  const factory TotemDialogComplete(
      {required final DeepLinkModel deepLinkModel,
      required final String password}) = _$TotemDialogCompleteImpl;

  DeepLinkModel get deepLinkModel;
  String get password;
  @JsonKey(ignore: true)
  _$$TotemDialogCompleteImplCopyWith<_$TotemDialogCompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TotemDialogRetrievingGPSImplCopyWith<$Res> {
  factory _$$TotemDialogRetrievingGPSImplCopyWith(
          _$TotemDialogRetrievingGPSImpl value,
          $Res Function(_$TotemDialogRetrievingGPSImpl) then) =
      __$$TotemDialogRetrievingGPSImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TotemDialogRetrievingGPSImplCopyWithImpl<$Res>
    extends _$TotemDialogStateCopyWithImpl<$Res, _$TotemDialogRetrievingGPSImpl>
    implements _$$TotemDialogRetrievingGPSImplCopyWith<$Res> {
  __$$TotemDialogRetrievingGPSImplCopyWithImpl(
      _$TotemDialogRetrievingGPSImpl _value,
      $Res Function(_$TotemDialogRetrievingGPSImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TotemDialogRetrievingGPSImpl implements TotemDialogRetrievingGPS {
  const _$TotemDialogRetrievingGPSImpl();

  @override
  String toString() {
    return 'TotemDialogState.retrievingGPS()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDialogRetrievingGPSImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeepLinkModel deepLinkModel, String password)
        complete,
    required TResult Function() retrievingGPS,
    required TResult Function() serverCommunication,
    required TResult Function() genderRequest,
    required TResult Function(
            TotemError totemError, Object error, StackTrace? st)
        error,
  }) {
    return retrievingGPS();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult? Function()? retrievingGPS,
    TResult? Function()? serverCommunication,
    TResult? Function()? genderRequest,
    TResult? Function(TotemError totemError, Object error, StackTrace? st)?
        error,
  }) {
    return retrievingGPS?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult Function()? retrievingGPS,
    TResult Function()? serverCommunication,
    TResult Function()? genderRequest,
    TResult Function(TotemError totemError, Object error, StackTrace? st)?
        error,
    required TResult orElse(),
  }) {
    if (retrievingGPS != null) {
      return retrievingGPS();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TotemDialogComplete value) complete,
    required TResult Function(TotemDialogRetrievingGPS value) retrievingGPS,
    required TResult Function(TotemDialogCommunicationWithServer value)
        serverCommunication,
    required TResult Function(TotemDialogGenderRequest value) genderRequest,
    required TResult Function(TotemDialogStateError value) error,
  }) {
    return retrievingGPS(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TotemDialogComplete value)? complete,
    TResult? Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult? Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult? Function(TotemDialogGenderRequest value)? genderRequest,
    TResult? Function(TotemDialogStateError value)? error,
  }) {
    return retrievingGPS?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TotemDialogComplete value)? complete,
    TResult Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult Function(TotemDialogGenderRequest value)? genderRequest,
    TResult Function(TotemDialogStateError value)? error,
    required TResult orElse(),
  }) {
    if (retrievingGPS != null) {
      return retrievingGPS(this);
    }
    return orElse();
  }
}

abstract class TotemDialogRetrievingGPS implements TotemDialogState {
  const factory TotemDialogRetrievingGPS() = _$TotemDialogRetrievingGPSImpl;
}

/// @nodoc
abstract class _$$TotemDialogCommunicationWithServerImplCopyWith<$Res> {
  factory _$$TotemDialogCommunicationWithServerImplCopyWith(
          _$TotemDialogCommunicationWithServerImpl value,
          $Res Function(_$TotemDialogCommunicationWithServerImpl) then) =
      __$$TotemDialogCommunicationWithServerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TotemDialogCommunicationWithServerImplCopyWithImpl<$Res>
    extends _$TotemDialogStateCopyWithImpl<$Res,
        _$TotemDialogCommunicationWithServerImpl>
    implements _$$TotemDialogCommunicationWithServerImplCopyWith<$Res> {
  __$$TotemDialogCommunicationWithServerImplCopyWithImpl(
      _$TotemDialogCommunicationWithServerImpl _value,
      $Res Function(_$TotemDialogCommunicationWithServerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TotemDialogCommunicationWithServerImpl
    implements TotemDialogCommunicationWithServer {
  const _$TotemDialogCommunicationWithServerImpl();

  @override
  String toString() {
    return 'TotemDialogState.serverCommunication()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDialogCommunicationWithServerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeepLinkModel deepLinkModel, String password)
        complete,
    required TResult Function() retrievingGPS,
    required TResult Function() serverCommunication,
    required TResult Function() genderRequest,
    required TResult Function(
            TotemError totemError, Object error, StackTrace? st)
        error,
  }) {
    return serverCommunication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult? Function()? retrievingGPS,
    TResult? Function()? serverCommunication,
    TResult? Function()? genderRequest,
    TResult? Function(TotemError totemError, Object error, StackTrace? st)?
        error,
  }) {
    return serverCommunication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult Function()? retrievingGPS,
    TResult Function()? serverCommunication,
    TResult Function()? genderRequest,
    TResult Function(TotemError totemError, Object error, StackTrace? st)?
        error,
    required TResult orElse(),
  }) {
    if (serverCommunication != null) {
      return serverCommunication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TotemDialogComplete value) complete,
    required TResult Function(TotemDialogRetrievingGPS value) retrievingGPS,
    required TResult Function(TotemDialogCommunicationWithServer value)
        serverCommunication,
    required TResult Function(TotemDialogGenderRequest value) genderRequest,
    required TResult Function(TotemDialogStateError value) error,
  }) {
    return serverCommunication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TotemDialogComplete value)? complete,
    TResult? Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult? Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult? Function(TotemDialogGenderRequest value)? genderRequest,
    TResult? Function(TotemDialogStateError value)? error,
  }) {
    return serverCommunication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TotemDialogComplete value)? complete,
    TResult Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult Function(TotemDialogGenderRequest value)? genderRequest,
    TResult Function(TotemDialogStateError value)? error,
    required TResult orElse(),
  }) {
    if (serverCommunication != null) {
      return serverCommunication(this);
    }
    return orElse();
  }
}

abstract class TotemDialogCommunicationWithServer implements TotemDialogState {
  const factory TotemDialogCommunicationWithServer() =
      _$TotemDialogCommunicationWithServerImpl;
}

/// @nodoc
abstract class _$$TotemDialogGenderRequestImplCopyWith<$Res> {
  factory _$$TotemDialogGenderRequestImplCopyWith(
          _$TotemDialogGenderRequestImpl value,
          $Res Function(_$TotemDialogGenderRequestImpl) then) =
      __$$TotemDialogGenderRequestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TotemDialogGenderRequestImplCopyWithImpl<$Res>
    extends _$TotemDialogStateCopyWithImpl<$Res, _$TotemDialogGenderRequestImpl>
    implements _$$TotemDialogGenderRequestImplCopyWith<$Res> {
  __$$TotemDialogGenderRequestImplCopyWithImpl(
      _$TotemDialogGenderRequestImpl _value,
      $Res Function(_$TotemDialogGenderRequestImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TotemDialogGenderRequestImpl implements TotemDialogGenderRequest {
  const _$TotemDialogGenderRequestImpl();

  @override
  String toString() {
    return 'TotemDialogState.genderRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDialogGenderRequestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeepLinkModel deepLinkModel, String password)
        complete,
    required TResult Function() retrievingGPS,
    required TResult Function() serverCommunication,
    required TResult Function() genderRequest,
    required TResult Function(
            TotemError totemError, Object error, StackTrace? st)
        error,
  }) {
    return genderRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult? Function()? retrievingGPS,
    TResult? Function()? serverCommunication,
    TResult? Function()? genderRequest,
    TResult? Function(TotemError totemError, Object error, StackTrace? st)?
        error,
  }) {
    return genderRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult Function()? retrievingGPS,
    TResult Function()? serverCommunication,
    TResult Function()? genderRequest,
    TResult Function(TotemError totemError, Object error, StackTrace? st)?
        error,
    required TResult orElse(),
  }) {
    if (genderRequest != null) {
      return genderRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TotemDialogComplete value) complete,
    required TResult Function(TotemDialogRetrievingGPS value) retrievingGPS,
    required TResult Function(TotemDialogCommunicationWithServer value)
        serverCommunication,
    required TResult Function(TotemDialogGenderRequest value) genderRequest,
    required TResult Function(TotemDialogStateError value) error,
  }) {
    return genderRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TotemDialogComplete value)? complete,
    TResult? Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult? Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult? Function(TotemDialogGenderRequest value)? genderRequest,
    TResult? Function(TotemDialogStateError value)? error,
  }) {
    return genderRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TotemDialogComplete value)? complete,
    TResult Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult Function(TotemDialogGenderRequest value)? genderRequest,
    TResult Function(TotemDialogStateError value)? error,
    required TResult orElse(),
  }) {
    if (genderRequest != null) {
      return genderRequest(this);
    }
    return orElse();
  }
}

abstract class TotemDialogGenderRequest implements TotemDialogState {
  const factory TotemDialogGenderRequest() = _$TotemDialogGenderRequestImpl;
}

/// @nodoc
abstract class _$$TotemDialogStateErrorImplCopyWith<$Res> {
  factory _$$TotemDialogStateErrorImplCopyWith(
          _$TotemDialogStateErrorImpl value,
          $Res Function(_$TotemDialogStateErrorImpl) then) =
      __$$TotemDialogStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TotemError totemError, Object error, StackTrace? st});
}

/// @nodoc
class __$$TotemDialogStateErrorImplCopyWithImpl<$Res>
    extends _$TotemDialogStateCopyWithImpl<$Res, _$TotemDialogStateErrorImpl>
    implements _$$TotemDialogStateErrorImplCopyWith<$Res> {
  __$$TotemDialogStateErrorImplCopyWithImpl(_$TotemDialogStateErrorImpl _value,
      $Res Function(_$TotemDialogStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totemError = null,
    Object? error = null,
    Object? st = freezed,
  }) {
    return _then(_$TotemDialogStateErrorImpl(
      null == totemError
          ? _value.totemError
          : totemError // ignore: cast_nullable_to_non_nullable
              as TotemError,
      null == error ? _value.error : error,
      st: freezed == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$TotemDialogStateErrorImpl implements TotemDialogStateError {
  const _$TotemDialogStateErrorImpl(this.totemError, this.error, {this.st});

  @override
  final TotemError totemError;
  @override
  final Object error;
  @override
  final StackTrace? st;

  @override
  String toString() {
    return 'TotemDialogState.error(totemError: $totemError, error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDialogStateErrorImpl &&
            (identical(other.totemError, totemError) ||
                other.totemError == totemError) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totemError, const DeepCollectionEquality().hash(error), st);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotemDialogStateErrorImplCopyWith<_$TotemDialogStateErrorImpl>
      get copyWith => __$$TotemDialogStateErrorImplCopyWithImpl<
          _$TotemDialogStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeepLinkModel deepLinkModel, String password)
        complete,
    required TResult Function() retrievingGPS,
    required TResult Function() serverCommunication,
    required TResult Function() genderRequest,
    required TResult Function(
            TotemError totemError, Object error, StackTrace? st)
        error,
  }) {
    return error(totemError, this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult? Function()? retrievingGPS,
    TResult? Function()? serverCommunication,
    TResult? Function()? genderRequest,
    TResult? Function(TotemError totemError, Object error, StackTrace? st)?
        error,
  }) {
    return error?.call(totemError, this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeepLinkModel deepLinkModel, String password)? complete,
    TResult Function()? retrievingGPS,
    TResult Function()? serverCommunication,
    TResult Function()? genderRequest,
    TResult Function(TotemError totemError, Object error, StackTrace? st)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(totemError, this.error, st);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TotemDialogComplete value) complete,
    required TResult Function(TotemDialogRetrievingGPS value) retrievingGPS,
    required TResult Function(TotemDialogCommunicationWithServer value)
        serverCommunication,
    required TResult Function(TotemDialogGenderRequest value) genderRequest,
    required TResult Function(TotemDialogStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TotemDialogComplete value)? complete,
    TResult? Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult? Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult? Function(TotemDialogGenderRequest value)? genderRequest,
    TResult? Function(TotemDialogStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TotemDialogComplete value)? complete,
    TResult Function(TotemDialogRetrievingGPS value)? retrievingGPS,
    TResult Function(TotemDialogCommunicationWithServer value)?
        serverCommunication,
    TResult Function(TotemDialogGenderRequest value)? genderRequest,
    TResult Function(TotemDialogStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TotemDialogStateError implements TotemDialogState {
  const factory TotemDialogStateError(
      final TotemError totemError, final Object error,
      {final StackTrace? st}) = _$TotemDialogStateErrorImpl;

  TotemError get totemError;
  Object get error;
  StackTrace? get st;
  @JsonKey(ignore: true)
  _$$TotemDialogStateErrorImplCopyWith<_$TotemDialogStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
