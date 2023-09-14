// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aim_percentage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AimInPercentage _$AimInPercentageFromJson(Map<String, dynamic> json) {
  return _AimInPercentage.fromJson(json);
}

/// @nodoc
mixin _$AimInPercentage {
  String get aim => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AimInPercentageCopyWith<AimInPercentage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AimInPercentageCopyWith<$Res> {
  factory $AimInPercentageCopyWith(
          AimInPercentage value, $Res Function(AimInPercentage) then) =
      _$AimInPercentageCopyWithImpl<$Res, AimInPercentage>;
  @useResult
  $Res call({String aim, int count, double percentage});
}

/// @nodoc
class _$AimInPercentageCopyWithImpl<$Res, $Val extends AimInPercentage>
    implements $AimInPercentageCopyWith<$Res> {
  _$AimInPercentageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aim = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      aim: null == aim
          ? _value.aim
          : aim // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AimInPercentageCopyWith<$Res>
    implements $AimInPercentageCopyWith<$Res> {
  factory _$$_AimInPercentageCopyWith(
          _$_AimInPercentage value, $Res Function(_$_AimInPercentage) then) =
      __$$_AimInPercentageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String aim, int count, double percentage});
}

/// @nodoc
class __$$_AimInPercentageCopyWithImpl<$Res>
    extends _$AimInPercentageCopyWithImpl<$Res, _$_AimInPercentage>
    implements _$$_AimInPercentageCopyWith<$Res> {
  __$$_AimInPercentageCopyWithImpl(
      _$_AimInPercentage _value, $Res Function(_$_AimInPercentage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aim = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_$_AimInPercentage(
      aim: null == aim
          ? _value.aim
          : aim // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AimInPercentage implements _AimInPercentage {
  const _$_AimInPercentage(
      {required this.aim, required this.count, required this.percentage});

  factory _$_AimInPercentage.fromJson(Map<String, dynamic> json) =>
      _$$_AimInPercentageFromJson(json);

  @override
  final String aim;
  @override
  final int count;
  @override
  final double percentage;

  @override
  String toString() {
    return 'AimInPercentage(aim: $aim, count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AimInPercentage &&
            (identical(other.aim, aim) || other.aim == aim) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aim, count, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AimInPercentageCopyWith<_$_AimInPercentage> get copyWith =>
      __$$_AimInPercentageCopyWithImpl<_$_AimInPercentage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AimInPercentageToJson(
      this,
    );
  }
}

abstract class _AimInPercentage implements AimInPercentage {
  const factory _AimInPercentage(
      {required final String aim,
      required final int count,
      required final double percentage}) = _$_AimInPercentage;

  factory _AimInPercentage.fromJson(Map<String, dynamic> json) =
      _$_AimInPercentage.fromJson;

  @override
  String get aim;
  @override
  int get count;
  @override
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$_AimInPercentageCopyWith<_$_AimInPercentage> get copyWith =>
      throw _privateConstructorUsedError;
}
