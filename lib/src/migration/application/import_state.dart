import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';

import '../data/migration_data.dart';

part 'import_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  const factory ImportState.initial() = ImportInitial;
  const factory ImportState.loading() = ImportLoading;
  const factory ImportState.error(Object ex, StackTrace st) = ImportError;
  const factory ImportState.completed(int count) = ImportCompleted;
}