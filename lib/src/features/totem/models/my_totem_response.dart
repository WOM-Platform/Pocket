import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_totem_response.freezed.dart';
part 'my_totem_response.g.dart';

@freezed
class MyTotemResponse with _$MyTotemResponse {
  const factory MyTotemResponse({
    required String id,
  }) = _MyTotemResponse;

  factory MyTotemResponse.fromJson(Map<String, dynamic> json) =>
      _$MyTotemResponseFromJson(json);
}
