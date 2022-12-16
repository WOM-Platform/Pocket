import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'migration_data.freezed.dart';
part 'migration_data.g.dart';

@freezed
class MigrationData with _$MigrationData {
  const factory MigrationData({
    required String code,
    required String link,
    @DateTimeConverter() required DateTime importDeadline,
  }) = _MigrationData;

  factory MigrationData.fromJson(Map<String, dynamic> json) =>
      _$MigrationDataFromJson(json);
}

