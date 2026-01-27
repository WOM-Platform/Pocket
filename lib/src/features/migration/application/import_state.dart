import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';

part 'import_state.freezed.dart';

@freezed
abstract class ImportState with _$ImportState {
  const factory ImportState.initial() = ImportInitial;

  const factory ImportState.loading() = ImportLoading;

  const factory ImportState.error(Object ex, StackTrace st) = ImportError;

  const factory ImportState.justImported() = JustImported;

  const factory ImportState.importSummary({
    required List<TotemRow> totems,
    required List<WomRow> woms,
    required List<Aim> aims,
    required String otc,
    required String device,
    required String password,
    required List<BadgeData> badges,
    required List<ChallengeData> challenges,
  }) = ImportSummary;

  const factory ImportState.completed({
    required int count,
    required int badgesCount,
    required int challengesCount,
    required int totemsCount,
    Object? ex,
    StackTrace? st,
  }) = ImportCompleted;
}
