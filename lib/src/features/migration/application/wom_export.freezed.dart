// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wom_export.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WomExport implements DiagnosticableTreeMixin {

 Voucher get wom; String get sourceId; String get sourceName;
/// Create a copy of WomExport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WomExportCopyWith<WomExport> get copyWith => _$WomExportCopyWithImpl<WomExport>(this as WomExport, _$identity);

  /// Serializes this WomExport to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WomExport'))
    ..add(DiagnosticsProperty('wom', wom))..add(DiagnosticsProperty('sourceId', sourceId))..add(DiagnosticsProperty('sourceName', sourceName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WomExport&&(identical(other.wom, wom) || other.wom == wom)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wom,sourceId,sourceName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WomExport(wom: $wom, sourceId: $sourceId, sourceName: $sourceName)';
}


}

/// @nodoc
abstract mixin class $WomExportCopyWith<$Res>  {
  factory $WomExportCopyWith(WomExport value, $Res Function(WomExport) _then) = _$WomExportCopyWithImpl;
@useResult
$Res call({
 Voucher wom, String sourceId, String sourceName
});


$VoucherCopyWith<$Res> get wom;

}
/// @nodoc
class _$WomExportCopyWithImpl<$Res>
    implements $WomExportCopyWith<$Res> {
  _$WomExportCopyWithImpl(this._self, this._then);

  final WomExport _self;
  final $Res Function(WomExport) _then;

/// Create a copy of WomExport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wom = null,Object? sourceId = null,Object? sourceName = null,}) {
  return _then(_self.copyWith(
wom: null == wom ? _self.wom : wom // ignore: cast_nullable_to_non_nullable
as Voucher,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of WomExport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherCopyWith<$Res> get wom {
  
  return $VoucherCopyWith<$Res>(_self.wom, (value) {
    return _then(_self.copyWith(wom: value));
  });
}
}


/// Adds pattern-matching-related methods to [WomExport].
extension WomExportPatterns on WomExport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WomExport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WomExport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WomExport value)  $default,){
final _that = this;
switch (_that) {
case _WomExport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WomExport value)?  $default,){
final _that = this;
switch (_that) {
case _WomExport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Voucher wom,  String sourceId,  String sourceName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WomExport() when $default != null:
return $default(_that.wom,_that.sourceId,_that.sourceName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Voucher wom,  String sourceId,  String sourceName)  $default,) {final _that = this;
switch (_that) {
case _WomExport():
return $default(_that.wom,_that.sourceId,_that.sourceName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Voucher wom,  String sourceId,  String sourceName)?  $default,) {final _that = this;
switch (_that) {
case _WomExport() when $default != null:
return $default(_that.wom,_that.sourceId,_that.sourceName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WomExport with DiagnosticableTreeMixin implements WomExport {
  const _WomExport({required this.wom, required this.sourceId, required this.sourceName});
  factory _WomExport.fromJson(Map<String, dynamic> json) => _$WomExportFromJson(json);

@override final  Voucher wom;
@override final  String sourceId;
@override final  String sourceName;

/// Create a copy of WomExport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WomExportCopyWith<_WomExport> get copyWith => __$WomExportCopyWithImpl<_WomExport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WomExportToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WomExport'))
    ..add(DiagnosticsProperty('wom', wom))..add(DiagnosticsProperty('sourceId', sourceId))..add(DiagnosticsProperty('sourceName', sourceName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WomExport&&(identical(other.wom, wom) || other.wom == wom)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wom,sourceId,sourceName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WomExport(wom: $wom, sourceId: $sourceId, sourceName: $sourceName)';
}


}

/// @nodoc
abstract mixin class _$WomExportCopyWith<$Res> implements $WomExportCopyWith<$Res> {
  factory _$WomExportCopyWith(_WomExport value, $Res Function(_WomExport) _then) = __$WomExportCopyWithImpl;
@override @useResult
$Res call({
 Voucher wom, String sourceId, String sourceName
});


@override $VoucherCopyWith<$Res> get wom;

}
/// @nodoc
class __$WomExportCopyWithImpl<$Res>
    implements _$WomExportCopyWith<$Res> {
  __$WomExportCopyWithImpl(this._self, this._then);

  final _WomExport _self;
  final $Res Function(_WomExport) _then;

/// Create a copy of WomExport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wom = null,Object? sourceId = null,Object? sourceName = null,}) {
  return _then(_WomExport(
wom: null == wom ? _self.wom : wom // ignore: cast_nullable_to_non_nullable
as Voucher,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WomExport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherCopyWith<$Res> get wom {
  
  return $VoucherCopyWith<$Res>(_self.wom, (value) {
    return _then(_self.copyWith(wom: value));
  });
}
}

// dart format on
