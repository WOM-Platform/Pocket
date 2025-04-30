// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_totem_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyTotemResponse _$MyTotemResponseFromJson(Map<String, dynamic> json) {
  return _MyTotemResponse.fromJson(json);
}

/// @nodoc
mixin _$MyTotemResponse {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this MyTotemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyTotemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyTotemResponseCopyWith<MyTotemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTotemResponseCopyWith<$Res> {
  factory $MyTotemResponseCopyWith(
          MyTotemResponse value, $Res Function(MyTotemResponse) then) =
      _$MyTotemResponseCopyWithImpl<$Res, MyTotemResponse>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MyTotemResponseCopyWithImpl<$Res, $Val extends MyTotemResponse>
    implements $MyTotemResponseCopyWith<$Res> {
  _$MyTotemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTotemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyTotemResponseImplCopyWith<$Res>
    implements $MyTotemResponseCopyWith<$Res> {
  factory _$$MyTotemResponseImplCopyWith(_$MyTotemResponseImpl value,
          $Res Function(_$MyTotemResponseImpl) then) =
      __$$MyTotemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MyTotemResponseImplCopyWithImpl<$Res>
    extends _$MyTotemResponseCopyWithImpl<$Res, _$MyTotemResponseImpl>
    implements _$$MyTotemResponseImplCopyWith<$Res> {
  __$$MyTotemResponseImplCopyWithImpl(
      _$MyTotemResponseImpl _value, $Res Function(_$MyTotemResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTotemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MyTotemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTotemResponseImpl implements _MyTotemResponse {
  const _$MyTotemResponseImpl({required this.id});

  factory _$MyTotemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTotemResponseImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MyTotemResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTotemResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MyTotemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTotemResponseImplCopyWith<_$MyTotemResponseImpl> get copyWith =>
      __$$MyTotemResponseImplCopyWithImpl<_$MyTotemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTotemResponseImplToJson(
      this,
    );
  }
}

abstract class _MyTotemResponse implements MyTotemResponse {
  const factory _MyTotemResponse({required final String id}) =
      _$MyTotemResponseImpl;

  factory _MyTotemResponse.fromJson(Map<String, dynamic> json) =
      _$MyTotemResponseImpl.fromJson;

  @override
  String get id;

  /// Create a copy of MyTotemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTotemResponseImplCopyWith<_$MyTotemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
