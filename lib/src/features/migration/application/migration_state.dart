import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/features/migration/data/migration_data.dart';

part 'migration_state.freezed.dart';

@freezed
class MigrationState with _$MigrationState {
  const factory MigrationState.data({
    required String pin,
    required int womsCount,
    required int totemsCount,
  }) = MigrationStateData;

  const factory MigrationState.loading() = MigrationStateLoading;

  const factory MigrationState.initial() = MigrationStateInitial;
  const factory MigrationState.complete({required MigrationData data}) =
      MigrationStateComplete;

  const factory MigrationState.error(Object error, StackTrace st) =
      MigrationStateError;
}
