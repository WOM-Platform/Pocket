// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totem_dialog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TotemResponse {

 String get status; String? get sessionId; String? get eventId; String? get link; String? get pin; String? get eventName; String? get providerName; String? get sessionName; String? get totemName; TotemMetadata? get metadata;
/// Create a copy of TotemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemResponseCopyWith<TotemResponse> get copyWith => _$TotemResponseCopyWithImpl<TotemResponse>(this as TotemResponse, _$identity);

  /// Serializes this TotemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.link, link) || other.link == link)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.totemName, totemName) || other.totemName == totemName)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,sessionId,eventId,link,pin,eventName,providerName,sessionName,totemName,metadata);

@override
String toString() {
  return 'TotemResponse(status: $status, sessionId: $sessionId, eventId: $eventId, link: $link, pin: $pin, eventName: $eventName, providerName: $providerName, sessionName: $sessionName, totemName: $totemName, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $TotemResponseCopyWith<$Res>  {
  factory $TotemResponseCopyWith(TotemResponse value, $Res Function(TotemResponse) _then) = _$TotemResponseCopyWithImpl;
@useResult
$Res call({
 String status, String? sessionId, String? eventId, String? link, String? pin, String? eventName, String? providerName, String? sessionName, String? totemName, TotemMetadata? metadata
});


$TotemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$TotemResponseCopyWithImpl<$Res>
    implements $TotemResponseCopyWith<$Res> {
  _$TotemResponseCopyWithImpl(this._self, this._then);

  final TotemResponse _self;
  final $Res Function(TotemResponse) _then;

/// Create a copy of TotemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? sessionId = freezed,Object? eventId = freezed,Object? link = freezed,Object? pin = freezed,Object? eventName = freezed,Object? providerName = freezed,Object? sessionName = freezed,Object? totemName = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,eventName: freezed == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String?,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,sessionName: freezed == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String?,totemName: freezed == totemName ? _self.totemName : totemName // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as TotemMetadata?,
  ));
}
/// Create a copy of TotemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $TotemMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [TotemResponse].
extension TotemResponsePatterns on TotemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotemResponse value)  $default,){
final _that = this;
switch (_that) {
case _TotemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TotemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String? sessionId,  String? eventId,  String? link,  String? pin,  String? eventName,  String? providerName,  String? sessionName,  String? totemName,  TotemMetadata? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotemResponse() when $default != null:
return $default(_that.status,_that.sessionId,_that.eventId,_that.link,_that.pin,_that.eventName,_that.providerName,_that.sessionName,_that.totemName,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String? sessionId,  String? eventId,  String? link,  String? pin,  String? eventName,  String? providerName,  String? sessionName,  String? totemName,  TotemMetadata? metadata)  $default,) {final _that = this;
switch (_that) {
case _TotemResponse():
return $default(_that.status,_that.sessionId,_that.eventId,_that.link,_that.pin,_that.eventName,_that.providerName,_that.sessionName,_that.totemName,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String? sessionId,  String? eventId,  String? link,  String? pin,  String? eventName,  String? providerName,  String? sessionName,  String? totemName,  TotemMetadata? metadata)?  $default,) {final _that = this;
switch (_that) {
case _TotemResponse() when $default != null:
return $default(_that.status,_that.sessionId,_that.eventId,_that.link,_that.pin,_that.eventName,_that.providerName,_that.sessionName,_that.totemName,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotemResponse implements TotemResponse {
  const _TotemResponse({required this.status, this.sessionId, this.eventId, this.link, this.pin, this.eventName, this.providerName, this.sessionName, this.totemName, this.metadata});
  factory _TotemResponse.fromJson(Map<String, dynamic> json) => _$TotemResponseFromJson(json);

@override final  String status;
@override final  String? sessionId;
@override final  String? eventId;
@override final  String? link;
@override final  String? pin;
@override final  String? eventName;
@override final  String? providerName;
@override final  String? sessionName;
@override final  String? totemName;
@override final  TotemMetadata? metadata;

/// Create a copy of TotemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotemResponseCopyWith<_TotemResponse> get copyWith => __$TotemResponseCopyWithImpl<_TotemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotemResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.link, link) || other.link == link)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.totemName, totemName) || other.totemName == totemName)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,sessionId,eventId,link,pin,eventName,providerName,sessionName,totemName,metadata);

@override
String toString() {
  return 'TotemResponse(status: $status, sessionId: $sessionId, eventId: $eventId, link: $link, pin: $pin, eventName: $eventName, providerName: $providerName, sessionName: $sessionName, totemName: $totemName, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$TotemResponseCopyWith<$Res> implements $TotemResponseCopyWith<$Res> {
  factory _$TotemResponseCopyWith(_TotemResponse value, $Res Function(_TotemResponse) _then) = __$TotemResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, String? sessionId, String? eventId, String? link, String? pin, String? eventName, String? providerName, String? sessionName, String? totemName, TotemMetadata? metadata
});


@override $TotemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$TotemResponseCopyWithImpl<$Res>
    implements _$TotemResponseCopyWith<$Res> {
  __$TotemResponseCopyWithImpl(this._self, this._then);

  final _TotemResponse _self;
  final $Res Function(_TotemResponse) _then;

/// Create a copy of TotemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? sessionId = freezed,Object? eventId = freezed,Object? link = freezed,Object? pin = freezed,Object? eventName = freezed,Object? providerName = freezed,Object? sessionName = freezed,Object? totemName = freezed,Object? metadata = freezed,}) {
  return _then(_TotemResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,eventName: freezed == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String?,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,sessionName: freezed == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String?,totemName: freezed == totemName ? _self.totemName : totemName // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as TotemMetadata?,
  ));
}

/// Create a copy of TotemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $TotemMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$TotemMetadata {

 String? get url; String? get email; String? get phoneNumber;
/// Create a copy of TotemMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemMetadataCopyWith<TotemMetadata> get copyWith => _$TotemMetadataCopyWithImpl<TotemMetadata>(this as TotemMetadata, _$identity);

  /// Serializes this TotemMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemMetadata&&(identical(other.url, url) || other.url == url)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,email,phoneNumber);

@override
String toString() {
  return 'TotemMetadata(url: $url, email: $email, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $TotemMetadataCopyWith<$Res>  {
  factory $TotemMetadataCopyWith(TotemMetadata value, $Res Function(TotemMetadata) _then) = _$TotemMetadataCopyWithImpl;
@useResult
$Res call({
 String? url, String? email, String? phoneNumber
});




}
/// @nodoc
class _$TotemMetadataCopyWithImpl<$Res>
    implements $TotemMetadataCopyWith<$Res> {
  _$TotemMetadataCopyWithImpl(this._self, this._then);

  final TotemMetadata _self;
  final $Res Function(TotemMetadata) _then;

/// Create a copy of TotemMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? email = freezed,Object? phoneNumber = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TotemMetadata].
extension TotemMetadataPatterns on TotemMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotemMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotemMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotemMetadata value)  $default,){
final _that = this;
switch (_that) {
case _TotemMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotemMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _TotemMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String? email,  String? phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotemMetadata() when $default != null:
return $default(_that.url,_that.email,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String? email,  String? phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _TotemMetadata():
return $default(_that.url,_that.email,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String? email,  String? phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _TotemMetadata() when $default != null:
return $default(_that.url,_that.email,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotemMetadata implements TotemMetadata {
  const _TotemMetadata({this.url, this.email, this.phoneNumber});
  factory _TotemMetadata.fromJson(Map<String, dynamic> json) => _$TotemMetadataFromJson(json);

@override final  String? url;
@override final  String? email;
@override final  String? phoneNumber;

/// Create a copy of TotemMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotemMetadataCopyWith<_TotemMetadata> get copyWith => __$TotemMetadataCopyWithImpl<_TotemMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotemMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotemMetadata&&(identical(other.url, url) || other.url == url)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,email,phoneNumber);

@override
String toString() {
  return 'TotemMetadata(url: $url, email: $email, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$TotemMetadataCopyWith<$Res> implements $TotemMetadataCopyWith<$Res> {
  factory _$TotemMetadataCopyWith(_TotemMetadata value, $Res Function(_TotemMetadata) _then) = __$TotemMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? email, String? phoneNumber
});




}
/// @nodoc
class __$TotemMetadataCopyWithImpl<$Res>
    implements _$TotemMetadataCopyWith<$Res> {
  __$TotemMetadataCopyWithImpl(this._self, this._then);

  final _TotemMetadata _self;
  final $Res Function(_TotemMetadata) _then;

/// Create a copy of TotemMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? email = freezed,Object? phoneNumber = freezed,}) {
  return _then(_TotemMetadata(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$TotemDialogState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TotemDialogState()';
}


}

/// @nodoc
class $TotemDialogStateCopyWith<$Res>  {
$TotemDialogStateCopyWith(TotemDialogState _, $Res Function(TotemDialogState) __);
}


/// Adds pattern-matching-related methods to [TotemDialogState].
extension TotemDialogStatePatterns on TotemDialogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TotemDialogComplete value)?  complete,TResult Function( TotemDialogRetrievingGPS value)?  retrievingGPS,TResult Function( TotemDialogCommunicationWithServer value)?  serverCommunication,TResult Function( TotemDialogGenderRequest value)?  genderRequest,TResult Function( TotemDialogInitialLoading value)?  initialLoading,TResult Function( TotemDialogStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TotemDialogComplete() when complete != null:
return complete(_that);case TotemDialogRetrievingGPS() when retrievingGPS != null:
return retrievingGPS(_that);case TotemDialogCommunicationWithServer() when serverCommunication != null:
return serverCommunication(_that);case TotemDialogGenderRequest() when genderRequest != null:
return genderRequest(_that);case TotemDialogInitialLoading() when initialLoading != null:
return initialLoading(_that);case TotemDialogStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TotemDialogComplete value)  complete,required TResult Function( TotemDialogRetrievingGPS value)  retrievingGPS,required TResult Function( TotemDialogCommunicationWithServer value)  serverCommunication,required TResult Function( TotemDialogGenderRequest value)  genderRequest,required TResult Function( TotemDialogInitialLoading value)  initialLoading,required TResult Function( TotemDialogStateError value)  error,}){
final _that = this;
switch (_that) {
case TotemDialogComplete():
return complete(_that);case TotemDialogRetrievingGPS():
return retrievingGPS(_that);case TotemDialogCommunicationWithServer():
return serverCommunication(_that);case TotemDialogGenderRequest():
return genderRequest(_that);case TotemDialogInitialLoading():
return initialLoading(_that);case TotemDialogStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TotemDialogComplete value)?  complete,TResult? Function( TotemDialogRetrievingGPS value)?  retrievingGPS,TResult? Function( TotemDialogCommunicationWithServer value)?  serverCommunication,TResult? Function( TotemDialogGenderRequest value)?  genderRequest,TResult? Function( TotemDialogInitialLoading value)?  initialLoading,TResult? Function( TotemDialogStateError value)?  error,}){
final _that = this;
switch (_that) {
case TotemDialogComplete() when complete != null:
return complete(_that);case TotemDialogRetrievingGPS() when retrievingGPS != null:
return retrievingGPS(_that);case TotemDialogCommunicationWithServer() when serverCommunication != null:
return serverCommunication(_that);case TotemDialogGenderRequest() when genderRequest != null:
return genderRequest(_that);case TotemDialogInitialLoading() when initialLoading != null:
return initialLoading(_that);case TotemDialogStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DeepLinkModel deepLinkModel,  String password)?  complete,TResult Function()?  retrievingGPS,TResult Function()?  serverCommunication,TResult Function()?  genderRequest,TResult Function()?  initialLoading,TResult Function( TotemError totemError,  Object error,  StackTrace? st)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TotemDialogComplete() when complete != null:
return complete(_that.deepLinkModel,_that.password);case TotemDialogRetrievingGPS() when retrievingGPS != null:
return retrievingGPS();case TotemDialogCommunicationWithServer() when serverCommunication != null:
return serverCommunication();case TotemDialogGenderRequest() when genderRequest != null:
return genderRequest();case TotemDialogInitialLoading() when initialLoading != null:
return initialLoading();case TotemDialogStateError() when error != null:
return error(_that.totemError,_that.error,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DeepLinkModel deepLinkModel,  String password)  complete,required TResult Function()  retrievingGPS,required TResult Function()  serverCommunication,required TResult Function()  genderRequest,required TResult Function()  initialLoading,required TResult Function( TotemError totemError,  Object error,  StackTrace? st)  error,}) {final _that = this;
switch (_that) {
case TotemDialogComplete():
return complete(_that.deepLinkModel,_that.password);case TotemDialogRetrievingGPS():
return retrievingGPS();case TotemDialogCommunicationWithServer():
return serverCommunication();case TotemDialogGenderRequest():
return genderRequest();case TotemDialogInitialLoading():
return initialLoading();case TotemDialogStateError():
return error(_that.totemError,_that.error,_that.st);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DeepLinkModel deepLinkModel,  String password)?  complete,TResult? Function()?  retrievingGPS,TResult? Function()?  serverCommunication,TResult? Function()?  genderRequest,TResult? Function()?  initialLoading,TResult? Function( TotemError totemError,  Object error,  StackTrace? st)?  error,}) {final _that = this;
switch (_that) {
case TotemDialogComplete() when complete != null:
return complete(_that.deepLinkModel,_that.password);case TotemDialogRetrievingGPS() when retrievingGPS != null:
return retrievingGPS();case TotemDialogCommunicationWithServer() when serverCommunication != null:
return serverCommunication();case TotemDialogGenderRequest() when genderRequest != null:
return genderRequest();case TotemDialogInitialLoading() when initialLoading != null:
return initialLoading();case TotemDialogStateError() when error != null:
return error(_that.totemError,_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class TotemDialogComplete implements TotemDialogState {
  const TotemDialogComplete({required this.deepLinkModel, required this.password});
  

 final  DeepLinkModel deepLinkModel;
 final  String password;

/// Create a copy of TotemDialogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemDialogCompleteCopyWith<TotemDialogComplete> get copyWith => _$TotemDialogCompleteCopyWithImpl<TotemDialogComplete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogComplete&&(identical(other.deepLinkModel, deepLinkModel) || other.deepLinkModel == deepLinkModel)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,deepLinkModel,password);

@override
String toString() {
  return 'TotemDialogState.complete(deepLinkModel: $deepLinkModel, password: $password)';
}


}

/// @nodoc
abstract mixin class $TotemDialogCompleteCopyWith<$Res> implements $TotemDialogStateCopyWith<$Res> {
  factory $TotemDialogCompleteCopyWith(TotemDialogComplete value, $Res Function(TotemDialogComplete) _then) = _$TotemDialogCompleteCopyWithImpl;
@useResult
$Res call({
 DeepLinkModel deepLinkModel, String password
});




}
/// @nodoc
class _$TotemDialogCompleteCopyWithImpl<$Res>
    implements $TotemDialogCompleteCopyWith<$Res> {
  _$TotemDialogCompleteCopyWithImpl(this._self, this._then);

  final TotemDialogComplete _self;
  final $Res Function(TotemDialogComplete) _then;

/// Create a copy of TotemDialogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deepLinkModel = null,Object? password = null,}) {
  return _then(TotemDialogComplete(
deepLinkModel: null == deepLinkModel ? _self.deepLinkModel : deepLinkModel // ignore: cast_nullable_to_non_nullable
as DeepLinkModel,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TotemDialogRetrievingGPS implements TotemDialogState {
  const TotemDialogRetrievingGPS();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogRetrievingGPS);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TotemDialogState.retrievingGPS()';
}


}




/// @nodoc


class TotemDialogCommunicationWithServer implements TotemDialogState {
  const TotemDialogCommunicationWithServer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogCommunicationWithServer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TotemDialogState.serverCommunication()';
}


}




/// @nodoc


class TotemDialogGenderRequest implements TotemDialogState {
  const TotemDialogGenderRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogGenderRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TotemDialogState.genderRequest()';
}


}




/// @nodoc


class TotemDialogInitialLoading implements TotemDialogState {
  const TotemDialogInitialLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogInitialLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TotemDialogState.initialLoading()';
}


}




/// @nodoc


class TotemDialogStateError implements TotemDialogState {
  const TotemDialogStateError(this.totemError, this.error, {this.st});
  

 final  TotemError totemError;
 final  Object error;
 final  StackTrace? st;

/// Create a copy of TotemDialogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemDialogStateErrorCopyWith<TotemDialogStateError> get copyWith => _$TotemDialogStateErrorCopyWithImpl<TotemDialogStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemDialogStateError&&(identical(other.totemError, totemError) || other.totemError == totemError)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,totemError,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'TotemDialogState.error(totemError: $totemError, error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $TotemDialogStateErrorCopyWith<$Res> implements $TotemDialogStateCopyWith<$Res> {
  factory $TotemDialogStateErrorCopyWith(TotemDialogStateError value, $Res Function(TotemDialogStateError) _then) = _$TotemDialogStateErrorCopyWithImpl;
@useResult
$Res call({
 TotemError totemError, Object error, StackTrace? st
});




}
/// @nodoc
class _$TotemDialogStateErrorCopyWithImpl<$Res>
    implements $TotemDialogStateErrorCopyWith<$Res> {
  _$TotemDialogStateErrorCopyWithImpl(this._self, this._then);

  final TotemDialogStateError _self;
  final $Res Function(TotemDialogStateError) _then;

/// Create a copy of TotemDialogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totemError = null,Object? error = null,Object? st = freezed,}) {
  return _then(TotemDialogStateError(
null == totemError ? _self.totemError : totemError // ignore: cast_nullable_to_non_nullable
as TotemError,null == error ? _self.error : error ,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
