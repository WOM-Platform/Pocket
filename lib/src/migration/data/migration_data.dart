import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'migration_data.g.dart';

@HiveType(typeId: 0)
class MigrationData extends HiveObject {
  @HiveField(0)
  final String registryUrl;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String link;
  @HiveField(3)
  final DateTime deadline;

  MigrationData(this.registryUrl, this.code, this.link, this.deadline);

  factory MigrationData.fromMigrationResponse(
      CreateMigrationResponse r, String partialKey) {
    return MigrationData(
        r.registryUrl, r.code, '${r.link}/$partialKey', r.deadline);
  }
}
