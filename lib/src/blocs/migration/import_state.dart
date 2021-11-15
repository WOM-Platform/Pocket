import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';

import 'migration_data.dart';

part 'import_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  const factory ImportState.loading() = ImportLoading;
  const factory ImportState.error(Exception ex) = ImportError;
  const factory ImportState.completed() = ImportCompleted;
}
