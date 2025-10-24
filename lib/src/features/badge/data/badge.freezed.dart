// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BadgeData {

 String get id; bool get isPublic; Map<String, String> get name; String? get challengeId; Map<String, String>? get description;@JsonKey(name: 'image') ImageData? get image; bool get seen; bool get achieved;@DateTimeConverter() DateTime? get achievedAt;@DateTimeConverter() DateTime? get createdAt;@DateTimeConverter() DateTime? get lastUpdate; String? get informationUri; BadgeSimpleFilter? get simpleFilter;
/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeDataCopyWith<BadgeData> get copyWith => _$BadgeDataCopyWithImpl<BadgeData>(this as BadgeData, _$identity);

  /// Serializes this BadgeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeData&&(identical(other.id, id) || other.id == id)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.challengeId, challengeId) || other.challengeId == challengeId)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.image, image) || other.image == image)&&(identical(other.seen, seen) || other.seen == seen)&&(identical(other.achieved, achieved) || other.achieved == achieved)&&(identical(other.achievedAt, achievedAt) || other.achievedAt == achievedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.informationUri, informationUri) || other.informationUri == informationUri)&&(identical(other.simpleFilter, simpleFilter) || other.simpleFilter == simpleFilter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isPublic,const DeepCollectionEquality().hash(name),challengeId,const DeepCollectionEquality().hash(description),image,seen,achieved,achievedAt,createdAt,lastUpdate,informationUri,simpleFilter);

@override
String toString() {
  return 'BadgeData(id: $id, isPublic: $isPublic, name: $name, challengeId: $challengeId, description: $description, image: $image, seen: $seen, achieved: $achieved, achievedAt: $achievedAt, createdAt: $createdAt, lastUpdate: $lastUpdate, informationUri: $informationUri, simpleFilter: $simpleFilter)';
}


}

/// @nodoc
abstract mixin class $BadgeDataCopyWith<$Res>  {
  factory $BadgeDataCopyWith(BadgeData value, $Res Function(BadgeData) _then) = _$BadgeDataCopyWithImpl;
@useResult
$Res call({
 String id, bool isPublic, Map<String, String> name, String? challengeId, Map<String, String>? description,@JsonKey(name: 'image') ImageData? image, bool seen, bool achieved,@DateTimeConverter() DateTime? achievedAt,@DateTimeConverter() DateTime? createdAt,@DateTimeConverter() DateTime? lastUpdate, String? informationUri, BadgeSimpleFilter? simpleFilter
});


$ImageDataCopyWith<$Res>? get image;$BadgeSimpleFilterCopyWith<$Res>? get simpleFilter;

}
/// @nodoc
class _$BadgeDataCopyWithImpl<$Res>
    implements $BadgeDataCopyWith<$Res> {
  _$BadgeDataCopyWithImpl(this._self, this._then);

  final BadgeData _self;
  final $Res Function(BadgeData) _then;

/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isPublic = null,Object? name = null,Object? challengeId = freezed,Object? description = freezed,Object? image = freezed,Object? seen = null,Object? achieved = null,Object? achievedAt = freezed,Object? createdAt = freezed,Object? lastUpdate = freezed,Object? informationUri = freezed,Object? simpleFilter = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,challengeId: freezed == challengeId ? _self.challengeId : challengeId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageData?,seen: null == seen ? _self.seen : seen // ignore: cast_nullable_to_non_nullable
as bool,achieved: null == achieved ? _self.achieved : achieved // ignore: cast_nullable_to_non_nullable
as bool,achievedAt: freezed == achievedAt ? _self.achievedAt : achievedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,informationUri: freezed == informationUri ? _self.informationUri : informationUri // ignore: cast_nullable_to_non_nullable
as String?,simpleFilter: freezed == simpleFilter ? _self.simpleFilter : simpleFilter // ignore: cast_nullable_to_non_nullable
as BadgeSimpleFilter?,
  ));
}
/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDataCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageDataCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BadgeSimpleFilterCopyWith<$Res>? get simpleFilter {
    if (_self.simpleFilter == null) {
    return null;
  }

  return $BadgeSimpleFilterCopyWith<$Res>(_self.simpleFilter!, (value) {
    return _then(_self.copyWith(simpleFilter: value));
  });
}
}


/// Adds pattern-matching-related methods to [BadgeData].
extension BadgeDataPatterns on BadgeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeData value)  $default,){
final _that = this;
switch (_that) {
case _BadgeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeData value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isPublic,  Map<String, String> name,  String? challengeId,  Map<String, String>? description, @JsonKey(name: 'image')  ImageData? image,  bool seen,  bool achieved, @DateTimeConverter()  DateTime? achievedAt, @DateTimeConverter()  DateTime? createdAt, @DateTimeConverter()  DateTime? lastUpdate,  String? informationUri,  BadgeSimpleFilter? simpleFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeData() when $default != null:
return $default(_that.id,_that.isPublic,_that.name,_that.challengeId,_that.description,_that.image,_that.seen,_that.achieved,_that.achievedAt,_that.createdAt,_that.lastUpdate,_that.informationUri,_that.simpleFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isPublic,  Map<String, String> name,  String? challengeId,  Map<String, String>? description, @JsonKey(name: 'image')  ImageData? image,  bool seen,  bool achieved, @DateTimeConverter()  DateTime? achievedAt, @DateTimeConverter()  DateTime? createdAt, @DateTimeConverter()  DateTime? lastUpdate,  String? informationUri,  BadgeSimpleFilter? simpleFilter)  $default,) {final _that = this;
switch (_that) {
case _BadgeData():
return $default(_that.id,_that.isPublic,_that.name,_that.challengeId,_that.description,_that.image,_that.seen,_that.achieved,_that.achievedAt,_that.createdAt,_that.lastUpdate,_that.informationUri,_that.simpleFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isPublic,  Map<String, String> name,  String? challengeId,  Map<String, String>? description, @JsonKey(name: 'image')  ImageData? image,  bool seen,  bool achieved, @DateTimeConverter()  DateTime? achievedAt, @DateTimeConverter()  DateTime? createdAt, @DateTimeConverter()  DateTime? lastUpdate,  String? informationUri,  BadgeSimpleFilter? simpleFilter)?  $default,) {final _that = this;
switch (_that) {
case _BadgeData() when $default != null:
return $default(_that.id,_that.isPublic,_that.name,_that.challengeId,_that.description,_that.image,_that.seen,_that.achieved,_that.achievedAt,_that.createdAt,_that.lastUpdate,_that.informationUri,_that.simpleFilter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BadgeData implements BadgeData {
  const _BadgeData({required this.id, required this.isPublic, required final  Map<String, String> name, this.challengeId, final  Map<String, String>? description, @JsonKey(name: 'image') this.image, this.seen = false, this.achieved = false, @DateTimeConverter() this.achievedAt, @DateTimeConverter() this.createdAt, @DateTimeConverter() this.lastUpdate, this.informationUri, this.simpleFilter}): _name = name,_description = description;
  factory _BadgeData.fromJson(Map<String, dynamic> json) => _$BadgeDataFromJson(json);

@override final  String id;
@override final  bool isPublic;
 final  Map<String, String> _name;
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

@override final  String? challengeId;
 final  Map<String, String>? _description;
@override Map<String, String>? get description {
  final value = _description;
  if (value == null) return null;
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'image') final  ImageData? image;
@override@JsonKey() final  bool seen;
@override@JsonKey() final  bool achieved;
@override@DateTimeConverter() final  DateTime? achievedAt;
@override@DateTimeConverter() final  DateTime? createdAt;
@override@DateTimeConverter() final  DateTime? lastUpdate;
@override final  String? informationUri;
@override final  BadgeSimpleFilter? simpleFilter;

/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeDataCopyWith<_BadgeData> get copyWith => __$BadgeDataCopyWithImpl<_BadgeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeData&&(identical(other.id, id) || other.id == id)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.challengeId, challengeId) || other.challengeId == challengeId)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.image, image) || other.image == image)&&(identical(other.seen, seen) || other.seen == seen)&&(identical(other.achieved, achieved) || other.achieved == achieved)&&(identical(other.achievedAt, achievedAt) || other.achievedAt == achievedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.informationUri, informationUri) || other.informationUri == informationUri)&&(identical(other.simpleFilter, simpleFilter) || other.simpleFilter == simpleFilter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isPublic,const DeepCollectionEquality().hash(_name),challengeId,const DeepCollectionEquality().hash(_description),image,seen,achieved,achievedAt,createdAt,lastUpdate,informationUri,simpleFilter);

@override
String toString() {
  return 'BadgeData(id: $id, isPublic: $isPublic, name: $name, challengeId: $challengeId, description: $description, image: $image, seen: $seen, achieved: $achieved, achievedAt: $achievedAt, createdAt: $createdAt, lastUpdate: $lastUpdate, informationUri: $informationUri, simpleFilter: $simpleFilter)';
}


}

/// @nodoc
abstract mixin class _$BadgeDataCopyWith<$Res> implements $BadgeDataCopyWith<$Res> {
  factory _$BadgeDataCopyWith(_BadgeData value, $Res Function(_BadgeData) _then) = __$BadgeDataCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isPublic, Map<String, String> name, String? challengeId, Map<String, String>? description,@JsonKey(name: 'image') ImageData? image, bool seen, bool achieved,@DateTimeConverter() DateTime? achievedAt,@DateTimeConverter() DateTime? createdAt,@DateTimeConverter() DateTime? lastUpdate, String? informationUri, BadgeSimpleFilter? simpleFilter
});


@override $ImageDataCopyWith<$Res>? get image;@override $BadgeSimpleFilterCopyWith<$Res>? get simpleFilter;

}
/// @nodoc
class __$BadgeDataCopyWithImpl<$Res>
    implements _$BadgeDataCopyWith<$Res> {
  __$BadgeDataCopyWithImpl(this._self, this._then);

  final _BadgeData _self;
  final $Res Function(_BadgeData) _then;

/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isPublic = null,Object? name = null,Object? challengeId = freezed,Object? description = freezed,Object? image = freezed,Object? seen = null,Object? achieved = null,Object? achievedAt = freezed,Object? createdAt = freezed,Object? lastUpdate = freezed,Object? informationUri = freezed,Object? simpleFilter = freezed,}) {
  return _then(_BadgeData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,challengeId: freezed == challengeId ? _self.challengeId : challengeId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageData?,seen: null == seen ? _self.seen : seen // ignore: cast_nullable_to_non_nullable
as bool,achieved: null == achieved ? _self.achieved : achieved // ignore: cast_nullable_to_non_nullable
as bool,achievedAt: freezed == achievedAt ? _self.achievedAt : achievedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,informationUri: freezed == informationUri ? _self.informationUri : informationUri // ignore: cast_nullable_to_non_nullable
as String?,simpleFilter: freezed == simpleFilter ? _self.simpleFilter : simpleFilter // ignore: cast_nullable_to_non_nullable
as BadgeSimpleFilter?,
  ));
}

/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDataCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageDataCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BadgeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BadgeSimpleFilterCopyWith<$Res>? get simpleFilter {
    if (_self.simpleFilter == null) {
    return null;
  }

  return $BadgeSimpleFilterCopyWith<$Res>(_self.simpleFilter!, (value) {
    return _then(_self.copyWith(simpleFilter: value));
  });
}
}


/// @nodoc
mixin _$BadgeSimpleFilter {

 int get count; String? get aim; String? get sourceId; Bounds? get bounds; Interval? get interval;
/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeSimpleFilterCopyWith<BadgeSimpleFilter> get copyWith => _$BadgeSimpleFilterCopyWithImpl<BadgeSimpleFilter>(this as BadgeSimpleFilter, _$identity);

  /// Serializes this BadgeSimpleFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeSimpleFilter&&(identical(other.count, count) || other.count == count)&&(identical(other.aim, aim) || other.aim == aim)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.interval, interval) || other.interval == interval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,aim,sourceId,bounds,interval);

@override
String toString() {
  return 'BadgeSimpleFilter(count: $count, aim: $aim, sourceId: $sourceId, bounds: $bounds, interval: $interval)';
}


}

/// @nodoc
abstract mixin class $BadgeSimpleFilterCopyWith<$Res>  {
  factory $BadgeSimpleFilterCopyWith(BadgeSimpleFilter value, $Res Function(BadgeSimpleFilter) _then) = _$BadgeSimpleFilterCopyWithImpl;
@useResult
$Res call({
 int count, String? aim, String? sourceId, Bounds? bounds, Interval? interval
});


$BoundsCopyWith<$Res>? get bounds;$IntervalCopyWith<$Res>? get interval;

}
/// @nodoc
class _$BadgeSimpleFilterCopyWithImpl<$Res>
    implements $BadgeSimpleFilterCopyWith<$Res> {
  _$BadgeSimpleFilterCopyWithImpl(this._self, this._then);

  final BadgeSimpleFilter _self;
  final $Res Function(BadgeSimpleFilter) _then;

/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? aim = freezed,Object? sourceId = freezed,Object? bounds = freezed,Object? interval = freezed,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,aim: freezed == aim ? _self.aim : aim // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Bounds?,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as Interval?,
  ));
}
/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundsCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $BoundsCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IntervalCopyWith<$Res>? get interval {
    if (_self.interval == null) {
    return null;
  }

  return $IntervalCopyWith<$Res>(_self.interval!, (value) {
    return _then(_self.copyWith(interval: value));
  });
}
}


/// Adds pattern-matching-related methods to [BadgeSimpleFilter].
extension BadgeSimpleFilterPatterns on BadgeSimpleFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeSimpleFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeSimpleFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeSimpleFilter value)  $default,){
final _that = this;
switch (_that) {
case _BadgeSimpleFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeSimpleFilter value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeSimpleFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? aim,  String? sourceId,  Bounds? bounds,  Interval? interval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeSimpleFilter() when $default != null:
return $default(_that.count,_that.aim,_that.sourceId,_that.bounds,_that.interval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? aim,  String? sourceId,  Bounds? bounds,  Interval? interval)  $default,) {final _that = this;
switch (_that) {
case _BadgeSimpleFilter():
return $default(_that.count,_that.aim,_that.sourceId,_that.bounds,_that.interval);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? aim,  String? sourceId,  Bounds? bounds,  Interval? interval)?  $default,) {final _that = this;
switch (_that) {
case _BadgeSimpleFilter() when $default != null:
return $default(_that.count,_that.aim,_that.sourceId,_that.bounds,_that.interval);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BadgeSimpleFilter implements BadgeSimpleFilter {
  const _BadgeSimpleFilter({required this.count, this.aim, this.sourceId, this.bounds, this.interval});
  factory _BadgeSimpleFilter.fromJson(Map<String, dynamic> json) => _$BadgeSimpleFilterFromJson(json);

@override final  int count;
@override final  String? aim;
@override final  String? sourceId;
@override final  Bounds? bounds;
@override final  Interval? interval;

/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeSimpleFilterCopyWith<_BadgeSimpleFilter> get copyWith => __$BadgeSimpleFilterCopyWithImpl<_BadgeSimpleFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeSimpleFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeSimpleFilter&&(identical(other.count, count) || other.count == count)&&(identical(other.aim, aim) || other.aim == aim)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.interval, interval) || other.interval == interval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,aim,sourceId,bounds,interval);

@override
String toString() {
  return 'BadgeSimpleFilter(count: $count, aim: $aim, sourceId: $sourceId, bounds: $bounds, interval: $interval)';
}


}

/// @nodoc
abstract mixin class _$BadgeSimpleFilterCopyWith<$Res> implements $BadgeSimpleFilterCopyWith<$Res> {
  factory _$BadgeSimpleFilterCopyWith(_BadgeSimpleFilter value, $Res Function(_BadgeSimpleFilter) _then) = __$BadgeSimpleFilterCopyWithImpl;
@override @useResult
$Res call({
 int count, String? aim, String? sourceId, Bounds? bounds, Interval? interval
});


@override $BoundsCopyWith<$Res>? get bounds;@override $IntervalCopyWith<$Res>? get interval;

}
/// @nodoc
class __$BadgeSimpleFilterCopyWithImpl<$Res>
    implements _$BadgeSimpleFilterCopyWith<$Res> {
  __$BadgeSimpleFilterCopyWithImpl(this._self, this._then);

  final _BadgeSimpleFilter _self;
  final $Res Function(_BadgeSimpleFilter) _then;

/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? aim = freezed,Object? sourceId = freezed,Object? bounds = freezed,Object? interval = freezed,}) {
  return _then(_BadgeSimpleFilter(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,aim: freezed == aim ? _self.aim : aim // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Bounds?,interval: freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as Interval?,
  ));
}

/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundsCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $BoundsCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of BadgeSimpleFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IntervalCopyWith<$Res>? get interval {
    if (_self.interval == null) {
    return null;
  }

  return $IntervalCopyWith<$Res>(_self.interval!, (value) {
    return _then(_self.copyWith(interval: value));
  });
}
}


/// @nodoc
mixin _$Interval {

@DateTimeConverter() DateTime get start;@DateTimeConverter() DateTime get end;
/// Create a copy of Interval
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntervalCopyWith<Interval> get copyWith => _$IntervalCopyWithImpl<Interval>(this as Interval, _$identity);

  /// Serializes this Interval to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Interval&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'Interval(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $IntervalCopyWith<$Res>  {
  factory $IntervalCopyWith(Interval value, $Res Function(Interval) _then) = _$IntervalCopyWithImpl;
@useResult
$Res call({
@DateTimeConverter() DateTime start,@DateTimeConverter() DateTime end
});




}
/// @nodoc
class _$IntervalCopyWithImpl<$Res>
    implements $IntervalCopyWith<$Res> {
  _$IntervalCopyWithImpl(this._self, this._then);

  final Interval _self;
  final $Res Function(Interval) _then;

/// Create a copy of Interval
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Interval].
extension IntervalPatterns on Interval {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Interval value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Interval() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Interval value)  $default,){
final _that = this;
switch (_that) {
case _Interval():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Interval value)?  $default,){
final _that = this;
switch (_that) {
case _Interval() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DateTimeConverter()  DateTime start, @DateTimeConverter()  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Interval() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DateTimeConverter()  DateTime start, @DateTimeConverter()  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _Interval():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DateTimeConverter()  DateTime start, @DateTimeConverter()  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _Interval() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Interval implements Interval {
  const _Interval({@DateTimeConverter() required this.start, @DateTimeConverter() required this.end});
  factory _Interval.fromJson(Map<String, dynamic> json) => _$IntervalFromJson(json);

@override@DateTimeConverter() final  DateTime start;
@override@DateTimeConverter() final  DateTime end;

/// Create a copy of Interval
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntervalCopyWith<_Interval> get copyWith => __$IntervalCopyWithImpl<_Interval>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntervalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Interval&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'Interval(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$IntervalCopyWith<$Res> implements $IntervalCopyWith<$Res> {
  factory _$IntervalCopyWith(_Interval value, $Res Function(_Interval) _then) = __$IntervalCopyWithImpl;
@override @useResult
$Res call({
@DateTimeConverter() DateTime start,@DateTimeConverter() DateTime end
});




}
/// @nodoc
class __$IntervalCopyWithImpl<$Res>
    implements _$IntervalCopyWith<$Res> {
  __$IntervalCopyWithImpl(this._self, this._then);

  final _Interval _self;
  final $Res Function(_Interval) _then;

/// Create a copy of Interval
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_Interval(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ImageData {

 String get fullSizeUrl; String get midDensityFullWidthUrl; String get highDensityFullWidthUrl; String get squareThumbnailUrl; String get blurHash;
/// Create a copy of ImageData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageDataCopyWith<ImageData> get copyWith => _$ImageDataCopyWithImpl<ImageData>(this as ImageData, _$identity);

  /// Serializes this ImageData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageData&&(identical(other.fullSizeUrl, fullSizeUrl) || other.fullSizeUrl == fullSizeUrl)&&(identical(other.midDensityFullWidthUrl, midDensityFullWidthUrl) || other.midDensityFullWidthUrl == midDensityFullWidthUrl)&&(identical(other.highDensityFullWidthUrl, highDensityFullWidthUrl) || other.highDensityFullWidthUrl == highDensityFullWidthUrl)&&(identical(other.squareThumbnailUrl, squareThumbnailUrl) || other.squareThumbnailUrl == squareThumbnailUrl)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeUrl,midDensityFullWidthUrl,highDensityFullWidthUrl,squareThumbnailUrl,blurHash);

@override
String toString() {
  return 'ImageData(fullSizeUrl: $fullSizeUrl, midDensityFullWidthUrl: $midDensityFullWidthUrl, highDensityFullWidthUrl: $highDensityFullWidthUrl, squareThumbnailUrl: $squareThumbnailUrl, blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class $ImageDataCopyWith<$Res>  {
  factory $ImageDataCopyWith(ImageData value, $Res Function(ImageData) _then) = _$ImageDataCopyWithImpl;
@useResult
$Res call({
 String fullSizeUrl, String midDensityFullWidthUrl, String highDensityFullWidthUrl, String squareThumbnailUrl, String blurHash
});




}
/// @nodoc
class _$ImageDataCopyWithImpl<$Res>
    implements $ImageDataCopyWith<$Res> {
  _$ImageDataCopyWithImpl(this._self, this._then);

  final ImageData _self;
  final $Res Function(ImageData) _then;

/// Create a copy of ImageData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullSizeUrl = null,Object? midDensityFullWidthUrl = null,Object? highDensityFullWidthUrl = null,Object? squareThumbnailUrl = null,Object? blurHash = null,}) {
  return _then(_self.copyWith(
fullSizeUrl: null == fullSizeUrl ? _self.fullSizeUrl : fullSizeUrl // ignore: cast_nullable_to_non_nullable
as String,midDensityFullWidthUrl: null == midDensityFullWidthUrl ? _self.midDensityFullWidthUrl : midDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
as String,highDensityFullWidthUrl: null == highDensityFullWidthUrl ? _self.highDensityFullWidthUrl : highDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
as String,squareThumbnailUrl: null == squareThumbnailUrl ? _self.squareThumbnailUrl : squareThumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageData].
extension ImageDataPatterns on ImageData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageData value)  $default,){
final _that = this;
switch (_that) {
case _ImageData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageData value)?  $default,){
final _that = this;
switch (_that) {
case _ImageData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullSizeUrl,  String midDensityFullWidthUrl,  String highDensityFullWidthUrl,  String squareThumbnailUrl,  String blurHash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageData() when $default != null:
return $default(_that.fullSizeUrl,_that.midDensityFullWidthUrl,_that.highDensityFullWidthUrl,_that.squareThumbnailUrl,_that.blurHash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullSizeUrl,  String midDensityFullWidthUrl,  String highDensityFullWidthUrl,  String squareThumbnailUrl,  String blurHash)  $default,) {final _that = this;
switch (_that) {
case _ImageData():
return $default(_that.fullSizeUrl,_that.midDensityFullWidthUrl,_that.highDensityFullWidthUrl,_that.squareThumbnailUrl,_that.blurHash);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullSizeUrl,  String midDensityFullWidthUrl,  String highDensityFullWidthUrl,  String squareThumbnailUrl,  String blurHash)?  $default,) {final _that = this;
switch (_that) {
case _ImageData() when $default != null:
return $default(_that.fullSizeUrl,_that.midDensityFullWidthUrl,_that.highDensityFullWidthUrl,_that.squareThumbnailUrl,_that.blurHash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageData implements ImageData {
  const _ImageData({required this.fullSizeUrl, required this.midDensityFullWidthUrl, required this.highDensityFullWidthUrl, required this.squareThumbnailUrl, required this.blurHash});
  factory _ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);

@override final  String fullSizeUrl;
@override final  String midDensityFullWidthUrl;
@override final  String highDensityFullWidthUrl;
@override final  String squareThumbnailUrl;
@override final  String blurHash;

/// Create a copy of ImageData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageDataCopyWith<_ImageData> get copyWith => __$ImageDataCopyWithImpl<_ImageData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageData&&(identical(other.fullSizeUrl, fullSizeUrl) || other.fullSizeUrl == fullSizeUrl)&&(identical(other.midDensityFullWidthUrl, midDensityFullWidthUrl) || other.midDensityFullWidthUrl == midDensityFullWidthUrl)&&(identical(other.highDensityFullWidthUrl, highDensityFullWidthUrl) || other.highDensityFullWidthUrl == highDensityFullWidthUrl)&&(identical(other.squareThumbnailUrl, squareThumbnailUrl) || other.squareThumbnailUrl == squareThumbnailUrl)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeUrl,midDensityFullWidthUrl,highDensityFullWidthUrl,squareThumbnailUrl,blurHash);

@override
String toString() {
  return 'ImageData(fullSizeUrl: $fullSizeUrl, midDensityFullWidthUrl: $midDensityFullWidthUrl, highDensityFullWidthUrl: $highDensityFullWidthUrl, squareThumbnailUrl: $squareThumbnailUrl, blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class _$ImageDataCopyWith<$Res> implements $ImageDataCopyWith<$Res> {
  factory _$ImageDataCopyWith(_ImageData value, $Res Function(_ImageData) _then) = __$ImageDataCopyWithImpl;
@override @useResult
$Res call({
 String fullSizeUrl, String midDensityFullWidthUrl, String highDensityFullWidthUrl, String squareThumbnailUrl, String blurHash
});




}
/// @nodoc
class __$ImageDataCopyWithImpl<$Res>
    implements _$ImageDataCopyWith<$Res> {
  __$ImageDataCopyWithImpl(this._self, this._then);

  final _ImageData _self;
  final $Res Function(_ImageData) _then;

/// Create a copy of ImageData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullSizeUrl = null,Object? midDensityFullWidthUrl = null,Object? highDensityFullWidthUrl = null,Object? squareThumbnailUrl = null,Object? blurHash = null,}) {
  return _then(_ImageData(
fullSizeUrl: null == fullSizeUrl ? _self.fullSizeUrl : fullSizeUrl // ignore: cast_nullable_to_non_nullable
as String,midDensityFullWidthUrl: null == midDensityFullWidthUrl ? _self.midDensityFullWidthUrl : midDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
as String,highDensityFullWidthUrl: null == highDensityFullWidthUrl ? _self.highDensityFullWidthUrl : highDensityFullWidthUrl // ignore: cast_nullable_to_non_nullable
as String,squareThumbnailUrl: null == squareThumbnailUrl ? _self.squareThumbnailUrl : squareThumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
