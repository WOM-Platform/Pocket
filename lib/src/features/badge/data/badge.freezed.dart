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
      String? informationUri});

  $ImageDataCopyWith<$Res>? get image;
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
      String? informationUri});

  @override
  $ImageDataCopyWith<$Res>? get image;
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
      this.informationUri})
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
  String toString() {
    return 'BadgeData(id: $id, isPublic: $isPublic, name: $name, challengeId: $challengeId, description: $description, image: $image, seen: $seen, achieved: $achieved, achievedAt: $achievedAt, createdAt: $createdAt, lastUpdate: $lastUpdate, informationUri: $informationUri)';
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
                other.informationUri == informationUri));
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
      informationUri);

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
      final String? informationUri}) = _$BadgeDataImpl;

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

  /// Create a copy of BadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadgeDataImplCopyWith<_$BadgeDataImpl> get copyWith =>
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
