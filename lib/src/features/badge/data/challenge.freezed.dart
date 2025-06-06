// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeData _$ChallengeDataFromJson(Map<String, dynamic> json) {
  return _ChallengeData.fromJson(json);
}

/// @nodoc
mixin _$ChallengeData {
  String get id => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  List<BadgeData> get badges => throw _privateConstructorUsedError;
  Map<String, String> get name => throw _privateConstructorUsedError;
  Map<String, String>? get description => throw _privateConstructorUsedError;

  /// Serializes this ChallengeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeDataCopyWith<ChallengeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeDataCopyWith<$Res> {
  factory $ChallengeDataCopyWith(
          ChallengeData value, $Res Function(ChallengeData) then) =
      _$ChallengeDataCopyWithImpl<$Res, ChallengeData>;
  @useResult
  $Res call(
      {String id,
      bool isPublic,
      List<BadgeData> badges,
      Map<String, String> name,
      Map<String, String>? description});
}

/// @nodoc
class _$ChallengeDataCopyWithImpl<$Res, $Val extends ChallengeData>
    implements $ChallengeDataCopyWith<$Res> {
  _$ChallengeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPublic = null,
    Object? badges = null,
    Object? name = null,
    Object? description = freezed,
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
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeData>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeDataImplCopyWith<$Res>
    implements $ChallengeDataCopyWith<$Res> {
  factory _$$ChallengeDataImplCopyWith(
          _$ChallengeDataImpl value, $Res Function(_$ChallengeDataImpl) then) =
      __$$ChallengeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isPublic,
      List<BadgeData> badges,
      Map<String, String> name,
      Map<String, String>? description});
}

/// @nodoc
class __$$ChallengeDataImplCopyWithImpl<$Res>
    extends _$ChallengeDataCopyWithImpl<$Res, _$ChallengeDataImpl>
    implements _$$ChallengeDataImplCopyWith<$Res> {
  __$$ChallengeDataImplCopyWithImpl(
      _$ChallengeDataImpl _value, $Res Function(_$ChallengeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPublic = null,
    Object? badges = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$ChallengeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeData>,
      name: null == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: freezed == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeDataImpl implements _ChallengeData {
  const _$ChallengeDataImpl(
      {required this.id,
      required this.isPublic,
      required final List<BadgeData> badges,
      required final Map<String, String> name,
      final Map<String, String>? description})
      : _badges = badges,
        _name = name,
        _description = description;

  factory _$ChallengeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeDataImplFromJson(json);

  @override
  final String id;
  @override
  final bool isPublic;
  final List<BadgeData> _badges;
  @override
  List<BadgeData> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  final Map<String, String> _name;
  @override
  Map<String, String> get name {
    if (_name is EqualUnmodifiableMapView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_name);
  }

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
  String toString() {
    return 'ChallengeData(id: $id, isPublic: $isPublic, badges: $badges, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality()
                .equals(other._description, _description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isPublic,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_name),
      const DeepCollectionEquality().hash(_description));

  /// Create a copy of ChallengeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeDataImplCopyWith<_$ChallengeDataImpl> get copyWith =>
      __$$ChallengeDataImplCopyWithImpl<_$ChallengeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeDataImplToJson(
      this,
    );
  }
}

abstract class _ChallengeData implements ChallengeData {
  const factory _ChallengeData(
      {required final String id,
      required final bool isPublic,
      required final List<BadgeData> badges,
      required final Map<String, String> name,
      final Map<String, String>? description}) = _$ChallengeDataImpl;

  factory _ChallengeData.fromJson(Map<String, dynamic> json) =
      _$ChallengeDataImpl.fromJson;

  @override
  String get id;
  @override
  bool get isPublic;
  @override
  List<BadgeData> get badges;
  @override
  Map<String, String> get name;
  @override
  Map<String, String>? get description;

  /// Create a copy of ChallengeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeDataImplCopyWith<_$ChallengeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
