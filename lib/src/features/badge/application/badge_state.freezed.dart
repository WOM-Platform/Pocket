// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BadgeState {

 List<BadgeData> get badges; List<ChallengeData> get challenges;
/// Create a copy of BadgeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeStateCopyWith<BadgeState> get copyWith => _$BadgeStateCopyWithImpl<BadgeState>(this as BadgeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeState&&const DeepCollectionEquality().equals(other.badges, badges)&&const DeepCollectionEquality().equals(other.challenges, challenges));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(badges),const DeepCollectionEquality().hash(challenges));

@override
String toString() {
  return 'BadgeState(badges: $badges, challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class $BadgeStateCopyWith<$Res>  {
  factory $BadgeStateCopyWith(BadgeState value, $Res Function(BadgeState) _then) = _$BadgeStateCopyWithImpl;
@useResult
$Res call({
 List<BadgeData> badges, List<ChallengeData> challenges
});




}
/// @nodoc
class _$BadgeStateCopyWithImpl<$Res>
    implements $BadgeStateCopyWith<$Res> {
  _$BadgeStateCopyWithImpl(this._self, this._then);

  final BadgeState _self;
  final $Res Function(BadgeState) _then;

/// Create a copy of BadgeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? badges = null,Object? challenges = null,}) {
  return _then(_self.copyWith(
badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeData>,challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeData>,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeState].
extension BadgeStatePatterns on BadgeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeState value)  $default,){
final _that = this;
switch (_that) {
case _BadgeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeState value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BadgeData> badges,  List<ChallengeData> challenges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeState() when $default != null:
return $default(_that.badges,_that.challenges);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BadgeData> badges,  List<ChallengeData> challenges)  $default,) {final _that = this;
switch (_that) {
case _BadgeState():
return $default(_that.badges,_that.challenges);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BadgeData> badges,  List<ChallengeData> challenges)?  $default,) {final _that = this;
switch (_that) {
case _BadgeState() when $default != null:
return $default(_that.badges,_that.challenges);case _:
  return null;

}
}

}

/// @nodoc


class _BadgeState implements BadgeState {
  const _BadgeState({final  List<BadgeData> badges = const [], final  List<ChallengeData> challenges = const []}): _badges = badges,_challenges = challenges;
  

 final  List<BadgeData> _badges;
@override@JsonKey() List<BadgeData> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  List<ChallengeData> _challenges;
@override@JsonKey() List<ChallengeData> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}


/// Create a copy of BadgeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeStateCopyWith<_BadgeState> get copyWith => __$BadgeStateCopyWithImpl<_BadgeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeState&&const DeepCollectionEquality().equals(other._badges, _badges)&&const DeepCollectionEquality().equals(other._challenges, _challenges));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_challenges));

@override
String toString() {
  return 'BadgeState(badges: $badges, challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class _$BadgeStateCopyWith<$Res> implements $BadgeStateCopyWith<$Res> {
  factory _$BadgeStateCopyWith(_BadgeState value, $Res Function(_BadgeState) _then) = __$BadgeStateCopyWithImpl;
@override @useResult
$Res call({
 List<BadgeData> badges, List<ChallengeData> challenges
});




}
/// @nodoc
class __$BadgeStateCopyWithImpl<$Res>
    implements _$BadgeStateCopyWith<$Res> {
  __$BadgeStateCopyWithImpl(this._self, this._then);

  final _BadgeState _self;
  final $Res Function(_BadgeState) _then;

/// Create a copy of BadgeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? badges = null,Object? challenges = null,}) {
  return _then(_BadgeState(
badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeData>,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeData>,
  ));
}


}

// dart format on
