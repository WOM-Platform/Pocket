import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'import_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  const factory ImportState.initial() = ImportInitial;
  const factory ImportState.loading() = ImportLoading;
  const factory ImportState.error(Object ex, StackTrace st) = ImportError;
  const factory ImportState.justImported() = JustImported;
  const factory ImportState.completed(int count) = ImportCompleted;
}
