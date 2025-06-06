// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BadgeState {
  List<BadgeData> get badges => throw _privateConstructorUsedError;
  List<ChallengeData> get challenges => throw _privateConstructorUsedError;

  /// Create a copy of BadgeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BadgeStateCopyWith<BadgeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeStateCopyWith<$Res> {
  factory $BadgeStateCopyWith(
          BadgeState value, $Res Function(BadgeState) then) =
      _$BadgeStateCopyWithImpl<$Res, BadgeState>;
  @useResult
  $Res call({List<BadgeData> badges, List<ChallengeData> challenges});
}

/// @nodoc
class _$BadgeStateCopyWithImpl<$Res, $Val extends BadgeState>
    implements $BadgeStateCopyWith<$Res> {
  _$BadgeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BadgeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badges = null,
    Object? challenges = null,
  }) {
    return _then(_value.copyWith(
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeData>,
      challenges: null == challenges
          ? _value.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BadgeStateImplCopyWith<$Res>
    implements $BadgeStateCopyWith<$Res> {
  factory _$$BadgeStateImplCopyWith(
          _$BadgeStateImpl value, $Res Function(_$BadgeStateImpl) then) =
      __$$BadgeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BadgeData> badges, List<ChallengeData> challenges});
}

/// @nodoc
class __$$BadgeStateImplCopyWithImpl<$Res>
    extends _$BadgeStateCopyWithImpl<$Res, _$BadgeStateImpl>
    implements _$$BadgeStateImplCopyWith<$Res> {
  __$$BadgeStateImplCopyWithImpl(
      _$BadgeStateImpl _value, $Res Function(_$BadgeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badges = null,
    Object? challenges = null,
  }) {
    return _then(_$BadgeStateImpl(
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeData>,
      challenges: null == challenges
          ? _value._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeData>,
    ));
  }
}

/// @nodoc

class _$BadgeStateImpl implements _BadgeState {
  const _$BadgeStateImpl(
      {final List<BadgeData> badges = const [],
      final List<ChallengeData> challenges = const []})
      : _badges = badges,
        _challenges = challenges;

  final List<BadgeData> _badges;
  @override
  @JsonKey()
  List<BadgeData> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  final List<ChallengeData> _challenges;
  @override
  @JsonKey()
  List<ChallengeData> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  @override
  String toString() {
    return 'BadgeState(badges: $badges, challenges: $challenges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeStateImpl &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_challenges));

  /// Create a copy of BadgeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeStateImplCopyWith<_$BadgeStateImpl> get copyWith =>
      __$$BadgeStateImplCopyWithImpl<_$BadgeStateImpl>(this, _$identity);
}

abstract class _BadgeState implements BadgeState {
  const factory _BadgeState(
      {final List<BadgeData> badges,
      final List<ChallengeData> challenges}) = _$BadgeStateImpl;

  @override
  List<BadgeData> get badges;
  @override
  List<ChallengeData> get challenges;

  /// Create a copy of BadgeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadgeStateImplCopyWith<_$BadgeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
