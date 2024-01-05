// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totem_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TotemData _$TotemDataFromJson(Map<String, dynamic> json) {
  return _TotemData.fromJson(json);
}

/// @nodoc
mixin _$TotemData {
  String get providerId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get totemId => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotemDataCopyWith<TotemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotemDataCopyWith<$Res> {
  factory $TotemDataCopyWith(TotemData value, $Res Function(TotemData) then) =
      _$TotemDataCopyWithImpl<$Res, TotemData>;
  @useResult
  $Res call(
      {String providerId, String eventId, String totemId, String? requestId});
}

/// @nodoc
class _$TotemDataCopyWithImpl<$Res, $Val extends TotemData>
    implements $TotemDataCopyWith<$Res> {
  _$TotemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? eventId = null,
    Object? totemId = null,
    Object? requestId = freezed,
  }) {
    return _then(_value.copyWith(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotemDataImplCopyWith<$Res>
    implements $TotemDataCopyWith<$Res> {
  factory _$$TotemDataImplCopyWith(
          _$TotemDataImpl value, $Res Function(_$TotemDataImpl) then) =
      __$$TotemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String providerId, String eventId, String totemId, String? requestId});
}

/// @nodoc
class __$$TotemDataImplCopyWithImpl<$Res>
    extends _$TotemDataCopyWithImpl<$Res, _$TotemDataImpl>
    implements _$$TotemDataImplCopyWith<$Res> {
  __$$TotemDataImplCopyWithImpl(
      _$TotemDataImpl _value, $Res Function(_$TotemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? eventId = null,
    Object? totemId = null,
    Object? requestId = freezed,
  }) {
    return _then(_$TotemDataImpl(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotemDataImpl implements _TotemData {
  const _$TotemDataImpl(
      {required this.providerId,
      required this.eventId,
      required this.totemId,
      this.requestId});

  factory _$TotemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotemDataImplFromJson(json);

  @override
  final String providerId;
  @override
  final String eventId;
  @override
  final String totemId;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'TotemData(providerId: $providerId, eventId: $eventId, totemId: $totemId, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDataImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.totemId, totemId) || other.totemId == totemId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, providerId, eventId, totemId, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotemDataImplCopyWith<_$TotemDataImpl> get copyWith =>
      __$$TotemDataImplCopyWithImpl<_$TotemDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotemDataImplToJson(
      this,
    );
  }
}

abstract class _TotemData implements TotemData {
  const factory _TotemData(
      {required final String providerId,
      required final String eventId,
      required final String totemId,
      final String? requestId}) = _$TotemDataImpl;

  factory _TotemData.fromJson(Map<String, dynamic> json) =
      _$TotemDataImpl.fromJson;

  @override
  String get providerId;
  @override
  String get eventId;
  @override
  String get totemId;
  @override
  String? get requestId;
  @override
  @JsonKey(ignore: true)
  _$$TotemDataImplCopyWith<_$TotemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
