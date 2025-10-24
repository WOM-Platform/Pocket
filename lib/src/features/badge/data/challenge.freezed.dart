// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeData {

 String get id; bool get isPublic; List<BadgeData> get badges; Map<String, String> get name; Map<String, String>? get description;
/// Create a copy of ChallengeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeDataCopyWith<ChallengeData> get copyWith => _$ChallengeDataCopyWithImpl<ChallengeData>(this as ChallengeData, _$identity);

  /// Serializes this ChallengeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeData&&(identical(other.id, id) || other.id == id)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.badges, badges)&&const DeepCollectionEquality().equals(other.name, name)&&const DeepCollectionEquality().equals(other.description, description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isPublic,const DeepCollectionEquality().hash(badges),const DeepCollectionEquality().hash(name),const DeepCollectionEquality().hash(description));

@override
String toString() {
  return 'ChallengeData(id: $id, isPublic: $isPublic, badges: $badges, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ChallengeDataCopyWith<$Res>  {
  factory $ChallengeDataCopyWith(ChallengeData value, $Res Function(ChallengeData) _then) = _$ChallengeDataCopyWithImpl;
@useResult
$Res call({
 String id, bool isPublic, List<BadgeData> badges, Map<String, String> name, Map<String, String>? description
});




}
/// @nodoc
class _$ChallengeDataCopyWithImpl<$Res>
    implements $ChallengeDataCopyWith<$Res> {
  _$ChallengeDataCopyWithImpl(this._self, this._then);

  final ChallengeData _self;
  final $Res Function(ChallengeData) _then;

/// Create a copy of ChallengeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isPublic = null,Object? badges = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeData>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeData].
extension ChallengeDataPatterns on ChallengeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeData value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeData value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isPublic,  List<BadgeData> badges,  Map<String, String> name,  Map<String, String>? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeData() when $default != null:
return $default(_that.id,_that.isPublic,_that.badges,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isPublic,  List<BadgeData> badges,  Map<String, String> name,  Map<String, String>? description)  $default,) {final _that = this;
switch (_that) {
case _ChallengeData():
return $default(_that.id,_that.isPublic,_that.badges,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isPublic,  List<BadgeData> badges,  Map<String, String> name,  Map<String, String>? description)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeData() when $default != null:
return $default(_that.id,_that.isPublic,_that.badges,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengeData implements ChallengeData {
  const _ChallengeData({required this.id, required this.isPublic, required final  List<BadgeData> badges, required final  Map<String, String> name, final  Map<String, String>? description}): _badges = badges,_name = name,_description = description;
  factory _ChallengeData.fromJson(Map<String, dynamic> json) => _$ChallengeDataFromJson(json);

@override final  String id;
@override final  bool isPublic;
 final  List<BadgeData> _badges;
@override List<BadgeData> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  Map<String, String> _name;
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

 final  Map<String, String>? _description;
@override Map<String, String>? get description {
  final value = _description;
  if (value == null) return null;
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ChallengeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeDataCopyWith<_ChallengeData> get copyWith => __$ChallengeDataCopyWithImpl<_ChallengeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeData&&(identical(other.id, id) || other.id == id)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._badges, _badges)&&const DeepCollectionEquality().equals(other._name, _name)&&const DeepCollectionEquality().equals(other._description, _description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isPublic,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_name),const DeepCollectionEquality().hash(_description));

@override
String toString() {
  return 'ChallengeData(id: $id, isPublic: $isPublic, badges: $badges, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ChallengeDataCopyWith<$Res> implements $ChallengeDataCopyWith<$Res> {
  factory _$ChallengeDataCopyWith(_ChallengeData value, $Res Function(_ChallengeData) _then) = __$ChallengeDataCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isPublic, List<BadgeData> badges, Map<String, String> name, Map<String, String>? description
});




}
/// @nodoc
class __$ChallengeDataCopyWithImpl<$Res>
    implements _$ChallengeDataCopyWith<$Res> {
  __$ChallengeDataCopyWithImpl(this._self, this._then);

  final _ChallengeData _self;
  final $Res Function(_ChallengeData) _then;

/// Create a copy of ChallengeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isPublic = null,Object? badges = null,Object? name = null,Object? description = freezed,}) {
  return _then(_ChallengeData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeData>,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: freezed == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
