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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TotemData _$TotemDataFromJson(Map<String, dynamic> json) {
  return _TotemData.fromJson(json);
}

/// @nodoc
mixin _$TotemData {
  String get providerId => throw _privateConstructorUsedError;
  String get totemId => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Serializes this TotemData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TotemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TotemDataCopyWith<TotemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotemDataCopyWith<$Res> {
  factory $TotemDataCopyWith(TotemData value, $Res Function(TotemData) then) =
      _$TotemDataCopyWithImpl<$Res, TotemData>;
  @useResult
  $Res call(
      {String providerId, String totemId, String? eventId, String? requestId});
}

/// @nodoc
class _$TotemDataCopyWithImpl<$Res, $Val extends TotemData>
    implements $TotemDataCopyWith<$Res> {
  _$TotemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TotemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? totemId = null,
    Object? eventId = freezed,
    Object? requestId = freezed,
  }) {
    return _then(_value.copyWith(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String providerId, String totemId, String? eventId, String? requestId});
}

/// @nodoc
class __$$TotemDataImplCopyWithImpl<$Res>
    extends _$TotemDataCopyWithImpl<$Res, _$TotemDataImpl>
    implements _$$TotemDataImplCopyWith<$Res> {
  __$$TotemDataImplCopyWithImpl(
      _$TotemDataImpl _value, $Res Function(_$TotemDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TotemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? totemId = null,
    Object? eventId = freezed,
    Object? requestId = freezed,
  }) {
    return _then(_$TotemDataImpl(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      required this.totemId,
      this.eventId,
      this.requestId});

  factory _$TotemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotemDataImplFromJson(json);

  @override
  final String providerId;
  @override
  final String totemId;
  @override
  final String? eventId;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'TotemData(providerId: $providerId, totemId: $totemId, eventId: $eventId, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotemDataImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.totemId, totemId) || other.totemId == totemId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, providerId, totemId, eventId, requestId);

  /// Create a copy of TotemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final String totemId,
      final String? eventId,
      final String? requestId}) = _$TotemDataImpl;

  factory _TotemData.fromJson(Map<String, dynamic> json) =
      _$TotemDataImpl.fromJson;

  @override
  String get providerId;
  @override
  String get totemId;
  @override
  String? get eventId;
  @override
  String? get requestId;

  /// Create a copy of TotemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TotemDataImplCopyWith<_$TotemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConnectionTotemData {
  String get totemId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;

  /// Create a copy of ConnectionTotemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectionTotemDataCopyWith<ConnectionTotemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionTotemDataCopyWith<$Res> {
  factory $ConnectionTotemDataCopyWith(
          ConnectionTotemData value, $Res Function(ConnectionTotemData) then) =
      _$ConnectionTotemDataCopyWithImpl<$Res, ConnectionTotemData>;
  @useResult
  $Res call({String totemId, DateTime timestamp, double lat, double long});
}

/// @nodoc
class _$ConnectionTotemDataCopyWithImpl<$Res, $Val extends ConnectionTotemData>
    implements $ConnectionTotemDataCopyWith<$Res> {
  _$ConnectionTotemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionTotemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totemId = null,
    Object? timestamp = null,
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_value.copyWith(
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionTotemDataImplCopyWith<$Res>
    implements $ConnectionTotemDataCopyWith<$Res> {
  factory _$$ConnectionTotemDataImplCopyWith(_$ConnectionTotemDataImpl value,
          $Res Function(_$ConnectionTotemDataImpl) then) =
      __$$ConnectionTotemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String totemId, DateTime timestamp, double lat, double long});
}

/// @nodoc
class __$$ConnectionTotemDataImplCopyWithImpl<$Res>
    extends _$ConnectionTotemDataCopyWithImpl<$Res, _$ConnectionTotemDataImpl>
    implements _$$ConnectionTotemDataImplCopyWith<$Res> {
  __$$ConnectionTotemDataImplCopyWithImpl(_$ConnectionTotemDataImpl _value,
      $Res Function(_$ConnectionTotemDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionTotemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totemId = null,
    Object? timestamp = null,
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$ConnectionTotemDataImpl(
      totemId: null == totemId
          ? _value.totemId
          : totemId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ConnectionTotemDataImpl implements _ConnectionTotemData {
  const _$ConnectionTotemDataImpl(
      {required this.totemId,
      required this.timestamp,
      required this.lat,
      required this.long});

  @override
  final String totemId;
  @override
  final DateTime timestamp;
  @override
  final double lat;
  @override
  final double long;

  @override
  String toString() {
    return 'ConnectionTotemData(totemId: $totemId, timestamp: $timestamp, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionTotemDataImpl &&
            (identical(other.totemId, totemId) || other.totemId == totemId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totemId, timestamp, lat, long);

  /// Create a copy of ConnectionTotemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionTotemDataImplCopyWith<_$ConnectionTotemDataImpl> get copyWith =>
      __$$ConnectionTotemDataImplCopyWithImpl<_$ConnectionTotemDataImpl>(
          this, _$identity);
}

abstract class _ConnectionTotemData implements ConnectionTotemData {
  const factory _ConnectionTotemData(
      {required final String totemId,
      required final DateTime timestamp,
      required final double lat,
      required final double long}) = _$ConnectionTotemDataImpl;

  @override
  String get totemId;
  @override
  DateTime get timestamp;
  @override
  double get lat;
  @override
  double get long;

  /// Create a copy of ConnectionTotemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionTotemDataImplCopyWith<_$ConnectionTotemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
