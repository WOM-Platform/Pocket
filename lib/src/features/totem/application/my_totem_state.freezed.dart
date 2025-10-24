// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_totem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyTotemState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTotemState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyTotemState()';
}


}

/// @nodoc
class $MyTotemStateCopyWith<$Res>  {
$MyTotemStateCopyWith(MyTotemState _, $Res Function(MyTotemState) __);
}


/// Adds pattern-matching-related methods to [MyTotemState].
extension MyTotemStatePatterns on MyTotemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyTotemStateLoaded value)?  loaded,TResult Function( MyTotemStateLoading value)?  loading,TResult Function( MyTotemStateEmpty value)?  empty,TResult Function( MyTotemStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyTotemStateLoaded() when loaded != null:
return loaded(_that);case MyTotemStateLoading() when loading != null:
return loading(_that);case MyTotemStateEmpty() when empty != null:
return empty(_that);case MyTotemStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyTotemStateLoaded value)  loaded,required TResult Function( MyTotemStateLoading value)  loading,required TResult Function( MyTotemStateEmpty value)  empty,required TResult Function( MyTotemStateError value)  error,}){
final _that = this;
switch (_that) {
case MyTotemStateLoaded():
return loaded(_that);case MyTotemStateLoading():
return loading(_that);case MyTotemStateEmpty():
return empty(_that);case MyTotemStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyTotemStateLoaded value)?  loaded,TResult? Function( MyTotemStateLoading value)?  loading,TResult? Function( MyTotemStateEmpty value)?  empty,TResult? Function( MyTotemStateError value)?  error,}){
final _that = this;
switch (_that) {
case MyTotemStateLoaded() when loaded != null:
return loaded(_that);case MyTotemStateLoading() when loading != null:
return loading(_that);case MyTotemStateEmpty() when empty != null:
return empty(_that);case MyTotemStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String totemId,  String totemLink,  bool isRefreshing,  String? email,  String? phone,  String? website)?  loaded,TResult Function()?  loading,TResult Function()?  empty,TResult Function( MyTotemError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MyTotemStateLoaded() when loaded != null:
return loaded(_that.name,_that.totemId,_that.totemLink,_that.isRefreshing,_that.email,_that.phone,_that.website);case MyTotemStateLoading() when loading != null:
return loading();case MyTotemStateEmpty() when empty != null:
return empty();case MyTotemStateError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String totemId,  String totemLink,  bool isRefreshing,  String? email,  String? phone,  String? website)  loaded,required TResult Function()  loading,required TResult Function()  empty,required TResult Function( MyTotemError error)  error,}) {final _that = this;
switch (_that) {
case MyTotemStateLoaded():
return loaded(_that.name,_that.totemId,_that.totemLink,_that.isRefreshing,_that.email,_that.phone,_that.website);case MyTotemStateLoading():
return loading();case MyTotemStateEmpty():
return empty();case MyTotemStateError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String totemId,  String totemLink,  bool isRefreshing,  String? email,  String? phone,  String? website)?  loaded,TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( MyTotemError error)?  error,}) {final _that = this;
switch (_that) {
case MyTotemStateLoaded() when loaded != null:
return loaded(_that.name,_that.totemId,_that.totemLink,_that.isRefreshing,_that.email,_that.phone,_that.website);case MyTotemStateLoading() when loading != null:
return loading();case MyTotemStateEmpty() when empty != null:
return empty();case MyTotemStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class MyTotemStateLoaded implements MyTotemState {
  const MyTotemStateLoaded({required this.name, required this.totemId, required this.totemLink, this.isRefreshing = false, this.email, this.phone, this.website});
  

 final  String name;
 final  String totemId;
 final  String totemLink;
@JsonKey() final  bool isRefreshing;
 final  String? email;
 final  String? phone;
 final  String? website;

/// Create a copy of MyTotemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTotemStateLoadedCopyWith<MyTotemStateLoaded> get copyWith => _$MyTotemStateLoadedCopyWithImpl<MyTotemStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTotemStateLoaded&&(identical(other.name, name) || other.name == name)&&(identical(other.totemId, totemId) || other.totemId == totemId)&&(identical(other.totemLink, totemLink) || other.totemLink == totemLink)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website));
}


@override
int get hashCode => Object.hash(runtimeType,name,totemId,totemLink,isRefreshing,email,phone,website);

@override
String toString() {
  return 'MyTotemState.loaded(name: $name, totemId: $totemId, totemLink: $totemLink, isRefreshing: $isRefreshing, email: $email, phone: $phone, website: $website)';
}


}

/// @nodoc
abstract mixin class $MyTotemStateLoadedCopyWith<$Res> implements $MyTotemStateCopyWith<$Res> {
  factory $MyTotemStateLoadedCopyWith(MyTotemStateLoaded value, $Res Function(MyTotemStateLoaded) _then) = _$MyTotemStateLoadedCopyWithImpl;
@useResult
$Res call({
 String name, String totemId, String totemLink, bool isRefreshing, String? email, String? phone, String? website
});




}
/// @nodoc
class _$MyTotemStateLoadedCopyWithImpl<$Res>
    implements $MyTotemStateLoadedCopyWith<$Res> {
  _$MyTotemStateLoadedCopyWithImpl(this._self, this._then);

  final MyTotemStateLoaded _self;
  final $Res Function(MyTotemStateLoaded) _then;

/// Create a copy of MyTotemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? totemId = null,Object? totemLink = null,Object? isRefreshing = null,Object? email = freezed,Object? phone = freezed,Object? website = freezed,}) {
  return _then(MyTotemStateLoaded(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,totemId: null == totemId ? _self.totemId : totemId // ignore: cast_nullable_to_non_nullable
as String,totemLink: null == totemLink ? _self.totemLink : totemLink // ignore: cast_nullable_to_non_nullable
as String,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class MyTotemStateLoading implements MyTotemState {
  const MyTotemStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTotemStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyTotemState.loading()';
}


}




/// @nodoc


class MyTotemStateEmpty implements MyTotemState {
  const MyTotemStateEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTotemStateEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyTotemState.empty()';
}


}




/// @nodoc


class MyTotemStateError implements MyTotemState {
  const MyTotemStateError(this.error);
  

 final  MyTotemError error;

/// Create a copy of MyTotemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTotemStateErrorCopyWith<MyTotemStateError> get copyWith => _$MyTotemStateErrorCopyWithImpl<MyTotemStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTotemStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MyTotemState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $MyTotemStateErrorCopyWith<$Res> implements $MyTotemStateCopyWith<$Res> {
  factory $MyTotemStateErrorCopyWith(MyTotemStateError value, $Res Function(MyTotemStateError) _then) = _$MyTotemStateErrorCopyWithImpl;
@useResult
$Res call({
 MyTotemError error
});




}
/// @nodoc
class _$MyTotemStateErrorCopyWithImpl<$Res>
    implements $MyTotemStateErrorCopyWith<$Res> {
  _$MyTotemStateErrorCopyWithImpl(this._self, this._then);

  final MyTotemStateError _self;
  final $Res Function(MyTotemStateError) _then;

/// Create a copy of MyTotemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MyTotemStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MyTotemError,
  ));
}


}

// dart format on
