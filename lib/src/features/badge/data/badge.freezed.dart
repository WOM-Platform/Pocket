// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BadgeData _$BadgeDataFromJson(Map<String, dynamic> json) {
  return _BadgeData.fromJson(json);
}

/// @nodoc
mixin _$BadgeData {
  String get id => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  Map<String, String> get name => throw _privateConstructorUsedError;
  String? get challengeId => throw _privateConstructorUsedError;
  Map<String, String>? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  ImageData? get image => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;
  bool get achieved => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get achievedAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get lastUpdate => throw _privateConstructorUsedError;
  String? get informationUri => throw _privateConstructorUsedError;
  BadgeSimpleFilter? get simpleFilter => throw _privateConstructorUsedError;

  /// Serializes this BadgeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BadgeDataCopyWith<BadgeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeDataCopyWith<$Res> {
  factory $BadgeDataCopyWith(BadgeData value, $Res Function(BadgeData) then) =
      _$BadgeDataCopyWithImpl<$Res, BadgeData>;
  @useResult
  $Res call(
      {String id,
      bool isPublic,
      Map<String, String> name,
      String? challengeId,
      Map<String, String>? description,
      @JsonKey(name: 'image') ImageData? image,
      bool seen,
      bool achieved,
      @DateTimeConverter() DateTime? achievedAt,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? lastUpdate,
      String? informationUri,
      BadgeSimpleFilter? simpleFilter});

  $ImageDataCopyWith<$Res>? get image;
  $BadgeSimpleFilterCopyWith<$Res>? get simpleFilter;
}

/// @nodoc
class _$BadgeDataCopyWithImpl<$Res, $Val extends BadgeData>
    implements $BadgeDataCopyWith<$Res> {
  _$BadgeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPublic = null,
    Object? name = null,
    Object? challengeId = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? seen = null,
    Object? achieved = null,
    Object? achievedAt = freezed,
    Object? createdAt = freezed,
    Object? lastUpdate = freezed,
    Object? informationUri = freezed,
    Object? simpleFilter = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageData?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool,
      achievedAt: freezed == achievedAt
          ? _value.achievedAt
          : achievedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      informationUri: freezed == informationUri
          ? _value.informationUri
          : informationUri // ignore: cast_nullable_to_non_nullable
              as String?,
      simpleFilter: freezed == simpleFilter
          ? _value.simpleFilter
          : simpleFilter // ignore: cast_nullable_to_non_nullable
              as BadgeSimpleFilter?,
    ) as $Val);
  }

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageDataCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BadgeSimpleFilterCopyWith<$Res>? get simpleFilter {
    if (_value.simpleFilter == null) {
      return null;
    }

    return $BadgeSimpleFilterCopyWith<$Res>(_value.simpleFilter!, (value) {
      return _then(_value.copyWith(simpleFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BadgeDataImplCopyWith<$Res>
    implements $BadgeDataCopyWith<$Res> {
  factory _$$BadgeDataImplCopyWith(
          _$BadgeDataImpl value, $Res Function(_$BadgeDataImpl) then) =
      __$$BadgeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isPublic,
      Map<String, String> name,
      String? challengeId,
      Map<String, String>? description,
      @JsonKey(name: 'image') ImageData? image,
      bool seen,
      bool achieved,
      @DateTimeConverter() DateTime? achievedAt,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? lastUpdate,
      String? informationUri,
      BadgeSimpleFilter? simpleFilter});

  @override
  $ImageDataCopyWith<$Res>? get image;
  @override
  $BadgeSimpleFilterCopyWith<$Res>? get simpleFilter;
}

/// @nodoc
class __$$BadgeDataImplCopyWithImpl<$Res>
    extends _$BadgeDataCopyWithImpl<$Res, _$BadgeDataImpl>
    implements _$$BadgeDataImplCopyWith<$Res> {
  __$$BadgeDataImplCopyWithImpl(
      _$BadgeDataImpl _value, $Res Function(_$BadgeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPublic = null,
    Object? name = null,
    Object? challengeId = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? seen = null,
    Object? achieved = null,
    Object? achievedAt = freezed,
    Object? createdAt = freezed,
    Object? lastUpdate = freezed,
    Object? informationUri = freezed,
    Object? simpleFilter = freezed,
  }) {
    return _then(_$BadgeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageData?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool,
      achievedAt: freezed == achievedAt
          ? _value.achievedAt
          : achievedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      informationUri: freezed == informationUri
          ? _value.informationUri
          : informationUri // ignore: cast_nullable_to_non_nullable
              as String?,
      simpleFilter: freezed == simpleFilter
          ? _value.simpleFilter
          : simpleFilter // ignore: cast_nullable_to_non_nullable
              as BadgeSimpleFilter?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeDataImpl implements _BadgeData {
  const _$BadgeDataImpl(
      {required this.id,
      required this.isPublic,
      required final Map<String, String> name,
      this.challengeId,
      final Map<String, String>? description,
      @JsonKey(name: 'image') this.image,
      this.seen = false,
      this.achieved = false,
      @DateTimeConverter() this.achievedAt,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.lastUpdate,
      this.informationUri,
      this.simpleFilter})
      : _name = name,
        _description = description;

  factory _$BadgeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeDataImplFromJson(json);

  @override
  final String id;
  @override
  final bool isPublic;
  final Map<String, String> _name;
  @override
  Map<String, String> get name {
    if (_name is EqualUnmodifiableMapView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_name);
  }

  @override
  final String? challengeId;
  final Map<String, String>? _description;
  @override
  Map<String, String>? get description {
    final value = _description;
    if (value == null) return null;
    if (_description is EqualUnmodifiableMapView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'image')
  final ImageData? image;
  @override
  @JsonKey()
  final bool seen;
  @override
  @JsonKey()
  final bool achieved;
  @override
  @DateTimeConverter()
  final DateTime? achievedAt;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? lastUpdate;
  @override
  final String? informationUri;
  @override
  final BadgeSimpleFilter? simpleFilter;

  @override
  String toString() {
    return 'BadgeData(id: $id, isPublic: $isPublic, name: $name, challengeId: $challengeId, description: $description, image: $image, seen: $seen, achieved: $achieved, achievedAt: $achievedAt, createdAt: $createdAt, lastUpdate: $lastUpdate, informationUri: $informationUri, simpleFilter: $simpleFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved) &&
            (identical(other.achievedAt, achievedAt) ||
                other.achievedAt == achievedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.informationUri, informationUri) ||
                other.informationUri == informationUri) &&
            (identical(other.simpleFilter, simpleFilter) ||
                other.simpleFilter == simpleFilter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isPublic,
      const DeepCollectionEquality().hash(_name),
      challengeId,
      const DeepCollectionEquality().hash(_description),
      image,
      seen,
      achieved,
      achievedAt,
      createdAt,
      lastUpdate,
      informationUri,
      simpleFilter);

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeDataImplCopyWith<_$BadgeDataImpl> get copyWith =>
      __$$BadgeDataImplCopyWithImpl<_$BadgeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeDataImplToJson(
      this,
    );
  }
}

abstract class _BadgeData implements BadgeData {
  const factory _BadgeData(
      {required final String id,
      required final bool isPublic,
      required final Map<String, String> name,
      final String? challengeId,
      final Map<String, String>? description,
      @JsonKey(name: 'image') final ImageData? image,
      final bool seen,
      final bool achieved,
      @DateTimeConverter() final DateTime? achievedAt,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? lastUpdate,
      final String? informationUri,
      final BadgeSimpleFilter? simpleFilter}) = _$BadgeDataImpl;

  factory _BadgeData.fromJson(Map<String, dynamic> json) =
      _$BadgeDataImpl.fromJson;

  @override
  String get id;
  @override
  bool get isPublic;
  @override
  Map<String, String> get name;
  @override
  String? get challengeId;
  @override
  Map<String, String>? get description;
  @override
  @JsonKey(name: 'image')
  ImageData? get image;
  @override
  bool get seen;
  @override
  bool get achieved;
  @override
  @DateTimeConverter()
  DateTime? get achievedAt;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get lastUpdate;
  @override
  String? get informationUri;
  @override
  BadgeSimpleFilter? get simpleFilter;

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadgeDataImplCopyWith<_$BadgeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BadgeSimpleFilter _$BadgeSimpleFilterFromJson(Map<String, dynamic> json) {
  return _BadgeSimpleFilter.fromJson(json);
}

/// @nodoc
mixin _$BadgeSimpleFilter {
  int get count => throw _privateConstructorUsedError;
  String? get aim => throw _privateConstructorUsedError;
  String? get sourceId => throw _privateConstructorUsedError;
  Bounds? get bounds => throw _privateConstructorUsedError;
  Interval? get interval => throw _privateConstructorUsedError;

  /// Serializes this BadgeSimpleFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BadgeSimpleFilterCopyWith<BadgeSimpleFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeSimpleFilterCopyWith<$Res> {
  factory $BadgeSimpleFilterCopyWith(
          BadgeSimpleFilter value, $Res Function(BadgeSimpleFilter) then) =
      _$BadgeSimpleFilterCopyWithImpl<$Res, BadgeSimpleFilter>;
  @useResult
  $Res call(
      {int count,
      String? aim,
      String? sourceId,
      Bounds? bounds,
      Interval? interval});

  $BoundsCopyWith<$Res>? get bounds;
  $IntervalCopyWith<$Res>? get interval;
}

/// @nodoc
class _$BadgeSimpleFilterCopyWithImpl<$Res, $Val extends BadgeSimpleFilter>
    implements $BadgeSimpleFilterCopyWith<$Res> {
  _$BadgeSimpleFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? aim = freezed,
    Object? sourceId = freezed,
    Object? bounds = freezed,
    Object? interval = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      aim: freezed == aim
          ? _value.aim
          : aim // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Interval?,
    ) as $Val);
  }

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res>? get bounds {
    if (_value.bounds == null) {
      return null;
    }

    return $BoundsCopyWith<$Res>(_value.bounds!, (value) {
      return _then(_value.copyWith(bounds: value) as $Val);
    });
  }

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IntervalCopyWith<$Res>? get interval {
    if (_value.interval == null) {
      return null;
    }

    return $IntervalCopyWith<$Res>(_value.interval!, (value) {
      return _then(_value.copyWith(interval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BadgeSimpleFilterImplCopyWith<$Res>
    implements $BadgeSimpleFilterCopyWith<$Res> {
  factory _$$BadgeSimpleFilterImplCopyWith(_$BadgeSimpleFilterImpl value,
          $Res Function(_$BadgeSimpleFilterImpl) then) =
      __$$BadgeSimpleFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? aim,
      String? sourceId,
      Bounds? bounds,
      Interval? interval});

  @override
  $BoundsCopyWith<$Res>? get bounds;
  @override
  $IntervalCopyWith<$Res>? get interval;
}

/// @nodoc
class __$$BadgeSimpleFilterImplCopyWithImpl<$Res>
    extends _$BadgeSimpleFilterCopyWithImpl<$Res, _$BadgeSimpleFilterImpl>
    implements _$$BadgeSimpleFilterImplCopyWith<$Res> {
  __$$BadgeSimpleFilterImplCopyWithImpl(_$BadgeSimpleFilterImpl _value,
      $Res Function(_$BadgeSimpleFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? aim = freezed,
    Object? sourceId = freezed,
    Object? bounds = freezed,
    Object? interval = freezed,
  }) {
    return _then(_$BadgeSimpleFilterImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      aim: freezed == aim
          ? _value.aim
          : aim // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Interval?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeSimpleFilterImpl implements _BadgeSimpleFilter {
  const _$BadgeSimpleFilterImpl(
      {required this.count,
      this.aim,
      this.sourceId,
      this.bounds,
      this.interval});

  factory _$BadgeSimpleFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeSimpleFilterImplFromJson(json);

  @override
  final int count;
  @override
  final String? aim;
  @override
  final String? sourceId;
  @override
  final Bounds? bounds;
  @override
  final Interval? interval;

  @override
  String toString() {
    return 'BadgeSimpleFilter(count: $count, aim: $aim, sourceId: $sourceId, bounds: $bounds, interval: $interval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeSimpleFilterImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.aim, aim) || other.aim == aim) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.interval, interval) ||
                other.interval == interval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, count, aim, sourceId, bounds, interval);

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeSimpleFilterImplCopyWith<_$BadgeSimpleFilterImpl> get copyWith =>
      __$$BadgeSimpleFilterImplCopyWithImpl<_$BadgeSimpleFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeSimpleFilterImplToJson(
      this,
    );
  }
}

abstract class _BadgeSimpleFilter implements BadgeSimpleFilter {
  const factory _BadgeSimpleFilter(
      {required final int count,
      final String? aim,
      final String? sourceId,
      final Bounds? bounds,
      final Interval? interval}) = _$BadgeSimpleFilterImpl;

  factory _BadgeSimpleFilter.fromJson(Map<String, dynamic> json) =
      _$BadgeSimpleFilterImpl.fromJson;

  @override
  int get count;
  @override
  String? get aim;
  @override
  String? get sourceId;
  @override
  Bounds? get bounds;
  @override
  Interval? get interval;

  /// Create a copy of BadgeSimpleFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadgeSimpleFilterImplCopyWith<_$BadgeSimpleFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Interval _$IntervalFromJson(Map<String, dynamic> json) {
  return _Interval.fromJson(json);
}

/// @nodoc
mixin _$Interval {
  @DateTimeConverter()
  DateTime get start => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get end => throw _privateConstructorUsedError;

  /// Serializes this Interval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Interval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntervalCopyWith<Interval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntervalCopyWith<$Res> {
  factory $IntervalCopyWith(Interval value, $Res Function(Interval) then) =
      _$IntervalCopyWithImpl<$Res, Interval>;
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime start, @DateTimeConverter() DateTime end});
}

/// @nodoc
class _$IntervalCopyWithImpl<$Res, $Val extends Interval>
    implements $IntervalCopyWith<$Res> {
  _$IntervalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Interval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntervalImplCopyWith<$Res>
    implements $IntervalCopyWith<$Res> {
  factory _$$IntervalImplCopyWith(
          _$IntervalImpl value, $Res Function(_$IntervalImpl) then) =
      __$$IntervalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime start, @DateTimeConverter() DateTime end});
}

/// @nodoc
class __$$IntervalImplCopyWithImpl<$Res>
    extends _$IntervalCopyWithImpl<$Res, _$IntervalImpl>
    implements _$$IntervalImplCopyWith<$Res> {
  __$$IntervalImplCopyWithImpl(
      _$IntervalImpl _value, $Res Function(_$IntervalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Interval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$IntervalImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntervalImpl implements _Interval {
  const _$IntervalImpl(
      {@DateTimeConverter() required this.start,
      @DateTimeConverter() required this.end});

  factory _$IntervalImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntervalImplFromJson(json);

  @override
  @DateTimeConverter()
  final DateTime start;
  @override
  @DateTimeConverter()
  final DateTime end;

  @override
  String toString() {
    return 'Interval(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntervalImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of Interval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntervalImplCopyWith<_$IntervalImpl> get copyWith =>
      __$$IntervalImplCopyWithImpl<_$IntervalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntervalImplToJson(
      this,
    );
  }
}

abstract class _Interval implements Interval {
  const factory _Interval(
      {@DateTimeConverter() required final DateTime start,
      @DateTimeConverter() required final DateTime end}) = _$IntervalImpl;

  factory _Interval.fromJson(Map<String, dynamic> json) =
      _$IntervalImpl.fromJson;

  @override
  @DateTimeConverter()
  DateTime get start;
  @override
  @DateTimeConverter()
  DateTime get end;

  /// Create a copy of Interval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntervalImplCopyWith<_$IntervalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageData _$ImageDataFromJson(Map<String, dynamic> json) {
  return _ImageData.fromJson(json);
}

/// @nodoc
mixin _$ImageData {
  String get fullSizeUrl => throw _privateConstructorUsedError;
  String get midDensityFullWidthUrl => throw _privateConstructorUsedError;
  String get highDensityFullWidthUrl => throw _privateConstructorUsedError;
  String get squareThumbnailUrl => throw _privateConstructorUsedError;
  String get blurHash => throw _privateConstructorUsedError;

  /// Serializes this ImageData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageDataCopyWith<ImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDataCopyWith<$Res> {
  factory $ImageDataCopyWith(ImageData value, $Res Function(ImageData) then) =
      _$ImageDataCopyWithImpl<$Res, ImageData>;
  @useResult
  $Res call(
      {String fullSizeUrl,
      String midDensityFullWidthUrl,
      String highDensityFullWidthUrl,
      String squareThumbnailUrl,
      String blurHash});
}

/// @nodoc
class _$ImageDataCopyWithImpl<$Res, $Val extends ImageData>
    implements $ImageDataCopyWith<$Res> {
  _$ImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSizeUrl = null,
    Object? midDensityFullWidthUrl = null,
    Object? highDensityFullWidthUrl = null,
    Object? squareThumbnailUrl = null,
    Object? blurHash = null,
  }) {
    return _then(_value.copyWith(
      fullSizeUrl: null == fullSizeUrl
          ? _value.fullSizeUrl
          : fullSizeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      midDensityFullWidthUrl: null == midDensityFullWidthUrl
          ? _value.midDensityFullWidthUrl
          : midDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
              as String,
      highDensityFullWidthUrl: null == highDensityFullWidthUrl
          ? _value.highDensityFullWidthUrl
          : highDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
              as String,
      squareThumbnailUrl: null == squareThumbnailUrl
          ? _value.squareThumbnailUrl
          : squareThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      blurHash: null == blurHash
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageDataImplCopyWith<$Res>
    implements $ImageDataCopyWith<$Res> {
  factory _$$ImageDataImplCopyWith(
          _$ImageDataImpl value, $Res Function(_$ImageDataImpl) then) =
      __$$ImageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullSizeUrl,
      String midDensityFullWidthUrl,
      String highDensityFullWidthUrl,
      String squareThumbnailUrl,
      String blurHash});
}

/// @nodoc
class __$$ImageDataImplCopyWithImpl<$Res>
    extends _$ImageDataCopyWithImpl<$Res, _$ImageDataImpl>
    implements _$$ImageDataImplCopyWith<$Res> {
  __$$ImageDataImplCopyWithImpl(
      _$ImageDataImpl _value, $Res Function(_$ImageDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSizeUrl = null,
    Object? midDensityFullWidthUrl = null,
    Object? highDensityFullWidthUrl = null,
    Object? squareThumbnailUrl = null,
    Object? blurHash = null,
  }) {
    return _then(_$ImageDataImpl(
      fullSizeUrl: null == fullSizeUrl
          ? _value.fullSizeUrl
          : fullSizeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      midDensityFullWidthUrl: null == midDensityFullWidthUrl
          ? _value.midDensityFullWidthUrl
          : midDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
              as String,
      highDensityFullWidthUrl: null == highDensityFullWidthUrl
          ? _value.highDensityFullWidthUrl
          : highDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
              as String,
      squareThumbnailUrl: null == squareThumbnailUrl
          ? _value.squareThumbnailUrl
          : squareThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      blurHash: null == blurHash
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageDataImpl implements _ImageData {
  const _$ImageDataImpl(
      {required this.fullSizeUrl,
      required this.midDensityFullWidthUrl,
      required this.highDensityFullWidthUrl,
      required this.squareThumbnailUrl,
      required this.blurHash});

  factory _$ImageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageDataImplFromJson(json);

  @override
  final String fullSizeUrl;
  @override
  final String midDensityFullWidthUrl;
  @override
  final String highDensityFullWidthUrl;
  @override
  final String squareThumbnailUrl;
  @override
  final String blurHash;

  @override
  String toString() {
    return 'ImageData(fullSizeUrl: $fullSizeUrl, midDensityFullWidthUrl: $midDensityFullWidthUrl, highDensityFullWidthUrl: $highDensityFullWidthUrl, squareThumbnailUrl: $squareThumbnailUrl, blurHash: $blurHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDataImpl &&
            (identical(other.fullSizeUrl, fullSizeUrl) ||
                other.fullSizeUrl == fullSizeUrl) &&
            (identical(other.midDensityFullWidthUrl, midDensityFullWidthUrl) ||
                other.midDensityFullWidthUrl == midDensityFullWidthUrl) &&
            (identical(
                    other.highDensityFullWidthUrl, highDensityFullWidthUrl) ||
                other.highDensityFullWidthUrl == highDensityFullWidthUrl) &&
            (identical(other.squareThumbnailUrl, squareThumbnailUrl) ||
                other.squareThumbnailUrl == squareThumbnailUrl) &&
            (identical(other.blurHash, blurHash) ||
                other.blurHash == blurHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullSizeUrl,
      midDensityFullWidthUrl,
      highDensityFullWidthUrl,
      squareThumbnailUrl,
      blurHash);

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDataImplCopyWith<_$ImageDataImpl> get copyWith =>
      __$$ImageDataImplCopyWithImpl<_$ImageDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageDataImplToJson(
      this,
    );
  }
}

abstract class _ImageData implements ImageData {
  const factory _ImageData(
      {required final String fullSizeUrl,
      required final String midDensityFullWidthUrl,
      required final String highDensityFullWidthUrl,
      required final String squareThumbnailUrl,
      required final String blurHash}) = _$ImageDataImpl;

  factory _ImageData.fromJson(Map<String, dynamic> json) =
      _$ImageDataImpl.fromJson;

  @override
  String get fullSizeUrl;
  @override
  String get midDensityFullWidthUrl;
  @override
  String get highDensityFullWidthUrl;
  @override
  String get squareThumbnailUrl;
  @override
  String get blurHash;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageDataImplCopyWith<_$ImageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
