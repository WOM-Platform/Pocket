// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState()';
}


}

/// @nodoc
class $ImportStateCopyWith<$Res>  {
$ImportStateCopyWith(ImportState _, $Res Function(ImportState) __);
}


/// Adds pattern-matching-related methods to [ImportState].
extension ImportStatePatterns on ImportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ImportInitial value)?  initial,TResult Function( ImportLoading value)?  loading,TResult Function( ImportError value)?  error,TResult Function( JustImported value)?  justImported,TResult Function( ImportSummary value)?  importSummary,TResult Function( ImportCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ImportInitial() when initial != null:
return initial(_that);case ImportLoading() when loading != null:
return loading(_that);case ImportError() when error != null:
return error(_that);case JustImported() when justImported != null:
return justImported(_that);case ImportSummary() when importSummary != null:
return importSummary(_that);case ImportCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ImportInitial value)  initial,required TResult Function( ImportLoading value)  loading,required TResult Function( ImportError value)  error,required TResult Function( JustImported value)  justImported,required TResult Function( ImportSummary value)  importSummary,required TResult Function( ImportCompleted value)  completed,}){
final _that = this;
switch (_that) {
case ImportInitial():
return initial(_that);case ImportLoading():
return loading(_that);case ImportError():
return error(_that);case JustImported():
return justImported(_that);case ImportSummary():
return importSummary(_that);case ImportCompleted():
return completed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ImportInitial value)?  initial,TResult? Function( ImportLoading value)?  loading,TResult? Function( ImportError value)?  error,TResult? Function( JustImported value)?  justImported,TResult? Function( ImportSummary value)?  importSummary,TResult? Function( ImportCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case ImportInitial() when initial != null:
return initial(_that);case ImportLoading() when loading != null:
return loading(_that);case ImportError() when error != null:
return error(_that);case JustImported() when justImported != null:
return justImported(_that);case ImportSummary() when importSummary != null:
return importSummary(_that);case ImportCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Object ex,  StackTrace st)?  error,TResult Function()?  justImported,TResult Function( List<TotemRow> totems,  List<WomRow> woms,  List<Aim> aims,  String otc,  String device,  String password,  List<BadgeData> badges,  List<ChallengeData> challenges)?  importSummary,TResult Function( int count,  int badgesCount,  int challengesCount,  int totemsCount,  Object? ex,  StackTrace? st)?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ImportInitial() when initial != null:
return initial();case ImportLoading() when loading != null:
return loading();case ImportError() when error != null:
return error(_that.ex,_that.st);case JustImported() when justImported != null:
return justImported();case ImportSummary() when importSummary != null:
return importSummary(_that.totems,_that.woms,_that.aims,_that.otc,_that.device,_that.password,_that.badges,_that.challenges);case ImportCompleted() when completed != null:
return completed(_that.count,_that.badgesCount,_that.challengesCount,_that.totemsCount,_that.ex,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Object ex,  StackTrace st)  error,required TResult Function()  justImported,required TResult Function( List<TotemRow> totems,  List<WomRow> woms,  List<Aim> aims,  String otc,  String device,  String password,  List<BadgeData> badges,  List<ChallengeData> challenges)  importSummary,required TResult Function( int count,  int badgesCount,  int challengesCount,  int totemsCount,  Object? ex,  StackTrace? st)  completed,}) {final _that = this;
switch (_that) {
case ImportInitial():
return initial();case ImportLoading():
return loading();case ImportError():
return error(_that.ex,_that.st);case JustImported():
return justImported();case ImportSummary():
return importSummary(_that.totems,_that.woms,_that.aims,_that.otc,_that.device,_that.password,_that.badges,_that.challenges);case ImportCompleted():
return completed(_that.count,_that.badgesCount,_that.challengesCount,_that.totemsCount,_that.ex,_that.st);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Object ex,  StackTrace st)?  error,TResult? Function()?  justImported,TResult? Function( List<TotemRow> totems,  List<WomRow> woms,  List<Aim> aims,  String otc,  String device,  String password,  List<BadgeData> badges,  List<ChallengeData> challenges)?  importSummary,TResult? Function( int count,  int badgesCount,  int challengesCount,  int totemsCount,  Object? ex,  StackTrace? st)?  completed,}) {final _that = this;
switch (_that) {
case ImportInitial() when initial != null:
return initial();case ImportLoading() when loading != null:
return loading();case ImportError() when error != null:
return error(_that.ex,_that.st);case JustImported() when justImported != null:
return justImported();case ImportSummary() when importSummary != null:
return importSummary(_that.totems,_that.woms,_that.aims,_that.otc,_that.device,_that.password,_that.badges,_that.challenges);case ImportCompleted() when completed != null:
return completed(_that.count,_that.badgesCount,_that.challengesCount,_that.totemsCount,_that.ex,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class ImportInitial with DiagnosticableTreeMixin implements ImportState {
  const ImportInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState.initial()';
}


}




/// @nodoc


class ImportLoading with DiagnosticableTreeMixin implements ImportState {
  const ImportLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState.loading()';
}


}




/// @nodoc


class ImportError with DiagnosticableTreeMixin implements ImportState {
  const ImportError(this.ex, this.st);
  

 final  Object ex;
 final  StackTrace st;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportErrorCopyWith<ImportError> get copyWith => _$ImportErrorCopyWithImpl<ImportError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState.error'))
    ..add(DiagnosticsProperty('ex', ex))..add(DiagnosticsProperty('st', st));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportError&&const DeepCollectionEquality().equals(other.ex, ex)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ex),st);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState.error(ex: $ex, st: $st)';
}


}

/// @nodoc
abstract mixin class $ImportErrorCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory $ImportErrorCopyWith(ImportError value, $Res Function(ImportError) _then) = _$ImportErrorCopyWithImpl;
@useResult
$Res call({
 Object ex, StackTrace st
});




}
/// @nodoc
class _$ImportErrorCopyWithImpl<$Res>
    implements $ImportErrorCopyWith<$Res> {
  _$ImportErrorCopyWithImpl(this._self, this._then);

  final ImportError _self;
  final $Res Function(ImportError) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ex = null,Object? st = null,}) {
  return _then(ImportError(
null == ex ? _self.ex : ex ,null == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

/// @nodoc


class JustImported with DiagnosticableTreeMixin implements ImportState {
  const JustImported();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState.justImported'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JustImported);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState.justImported()';
}


}




/// @nodoc


class ImportSummary with DiagnosticableTreeMixin implements ImportState {
  const ImportSummary({required final  List<TotemRow> totems, required final  List<WomRow> woms, required final  List<Aim> aims, required this.otc, required this.device, required this.password, required final  List<BadgeData> badges, required final  List<ChallengeData> challenges}): _totems = totems,_woms = woms,_aims = aims,_badges = badges,_challenges = challenges;
  

 final  List<TotemRow> _totems;
 List<TotemRow> get totems {
  if (_totems is EqualUnmodifiableListView) return _totems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_totems);
}

 final  List<WomRow> _woms;
 List<WomRow> get woms {
  if (_woms is EqualUnmodifiableListView) return _woms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_woms);
}

 final  List<Aim> _aims;
 List<Aim> get aims {
  if (_aims is EqualUnmodifiableListView) return _aims;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aims);
}

 final  String otc;
 final  String device;
 final  String password;
 final  List<BadgeData> _badges;
 List<BadgeData> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  List<ChallengeData> _challenges;
 List<ChallengeData> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}


/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportSummaryCopyWith<ImportSummary> get copyWith => _$ImportSummaryCopyWithImpl<ImportSummary>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState.importSummary'))
    ..add(DiagnosticsProperty('totems', totems))..add(DiagnosticsProperty('woms', woms))..add(DiagnosticsProperty('aims', aims))..add(DiagnosticsProperty('otc', otc))..add(DiagnosticsProperty('device', device))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('badges', badges))..add(DiagnosticsProperty('challenges', challenges));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportSummary&&const DeepCollectionEquality().equals(other._totems, _totems)&&const DeepCollectionEquality().equals(other._woms, _woms)&&const DeepCollectionEquality().equals(other._aims, _aims)&&(identical(other.otc, otc) || other.otc == otc)&&(identical(other.device, device) || other.device == device)&&(identical(other.password, password) || other.password == password)&&const DeepCollectionEquality().equals(other._badges, _badges)&&const DeepCollectionEquality().equals(other._challenges, _challenges));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_totems),const DeepCollectionEquality().hash(_woms),const DeepCollectionEquality().hash(_aims),otc,device,password,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_challenges));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState.importSummary(totems: $totems, woms: $woms, aims: $aims, otc: $otc, device: $device, password: $password, badges: $badges, challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class $ImportSummaryCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory $ImportSummaryCopyWith(ImportSummary value, $Res Function(ImportSummary) _then) = _$ImportSummaryCopyWithImpl;
@useResult
$Res call({
 List<TotemRow> totems, List<WomRow> woms, List<Aim> aims, String otc, String device, String password, List<BadgeData> badges, List<ChallengeData> challenges
});




}
/// @nodoc
class _$ImportSummaryCopyWithImpl<$Res>
    implements $ImportSummaryCopyWith<$Res> {
  _$ImportSummaryCopyWithImpl(this._self, this._then);

  final ImportSummary _self;
  final $Res Function(ImportSummary) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totems = null,Object? woms = null,Object? aims = null,Object? otc = null,Object? device = null,Object? password = null,Object? badges = null,Object? challenges = null,}) {
  return _then(ImportSummary(
totems: null == totems ? _self._totems : totems // ignore: cast_nullable_to_non_nullable
as List<TotemRow>,woms: null == woms ? _self._woms : woms // ignore: cast_nullable_to_non_nullable
as List<WomRow>,aims: null == aims ? _self._aims : aims // ignore: cast_nullable_to_non_nullable
as List<Aim>,otc: null == otc ? _self.otc : otc // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeData>,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeData>,
  ));
}


}

/// @nodoc


class ImportCompleted with DiagnosticableTreeMixin implements ImportState {
  const ImportCompleted({required this.count, required this.badgesCount, required this.challengesCount, required this.totemsCount, this.ex, this.st});
  

 final  int count;
 final  int badgesCount;
 final  int challengesCount;
 final  int totemsCount;
 final  Object? ex;
 final  StackTrace? st;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportCompletedCopyWith<ImportCompleted> get copyWith => _$ImportCompletedCopyWithImpl<ImportCompleted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImportState.completed'))
    ..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('badgesCount', badgesCount))..add(DiagnosticsProperty('challengesCount', challengesCount))..add(DiagnosticsProperty('totemsCount', totemsCount))..add(DiagnosticsProperty('ex', ex))..add(DiagnosticsProperty('st', st));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportCompleted&&(identical(other.count, count) || other.count == count)&&(identical(other.badgesCount, badgesCount) || other.badgesCount == badgesCount)&&(identical(other.challengesCount, challengesCount) || other.challengesCount == challengesCount)&&(identical(other.totemsCount, totemsCount) || other.totemsCount == totemsCount)&&const DeepCollectionEquality().equals(other.ex, ex)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,count,badgesCount,challengesCount,totemsCount,const DeepCollectionEquality().hash(ex),st);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImportState.completed(count: $count, badgesCount: $badgesCount, challengesCount: $challengesCount, totemsCount: $totemsCount, ex: $ex, st: $st)';
}


}

/// @nodoc
abstract mixin class $ImportCompletedCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory $ImportCompletedCopyWith(ImportCompleted value, $Res Function(ImportCompleted) _then) = _$ImportCompletedCopyWithImpl;
@useResult
$Res call({
 int count, int badgesCount, int challengesCount, int totemsCount, Object? ex, StackTrace? st
});




}
/// @nodoc
class _$ImportCompletedCopyWithImpl<$Res>
    implements $ImportCompletedCopyWith<$Res> {
  _$ImportCompletedCopyWithImpl(this._self, this._then);

  final ImportCompleted _self;
  final $Res Function(ImportCompleted) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,Object? badgesCount = null,Object? challengesCount = null,Object? totemsCount = null,Object? ex = freezed,Object? st = freezed,}) {
  return _then(ImportCompleted(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,badgesCount: null == badgesCount ? _self.badgesCount : badgesCount // ignore: cast_nullable_to_non_nullable
as int,challengesCount: null == challengesCount ? _self.challengesCount : challengesCount // ignore: cast_nullable_to_non_nullable
as int,totemsCount: null == totemsCount ? _self.totemsCount : totemsCount // ignore: cast_nullable_to_non_nullable
as int,ex: freezed == ex ? _self.ex : ex ,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
