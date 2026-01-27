import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/application/pocket_notifier.dart';
import 'package:wom_pocket/src/core/application/transactions_list/transactions_notifier.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/models/transaction_model.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';
import 'package:wom_pocket/src/features/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/features/map/application/bloc.dart';
import 'package:wom_pocket/src/features/migration/application/import_state.dart';
import 'package:wom_pocket/src/features/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/features/root/widgets/wom_stats_widget.dart';

part 'import_notifier.g.dart';

@riverpod
class ImportNotifier extends _$ImportNotifier {
  ImportState build(DeepLinkModel deepLinkModel) {
    return ImportInitial();
  }

  Future checkImport(String password) async {
    try {
      state = ImportState.loading();
      final otc = deepLinkModel.otc;
      if (otc == null) throw Exception('Otc is null');
      final response = await ref
          .read(pocketProvider)
          .getInfoAboutMigration(otc, password);

      if (response.completed) {
        state = JustImported();
        return;
      }
      logger.i(response);
      final responseBytes = await ref
          .read(pocketProvider)
          .retrieveMigrationPayload(otc, password);

      final dir = await getTemporaryDirectory();
      final partialKey = deepLinkModel.migrationPartialKey;
      final migrationDir = Directory('${dir.path}/migration/import');
      if (await migrationDir.exists()) {
        await migrationDir.delete(recursive: true);
      }
      await migrationDir.create(recursive: true);
      final bytes = Utils.decryptBytesWithAes(
        responseBytes,
        '$partialKey$password',
      );
      final zipFile = File('${migrationDir.path}/zip_encrypted_wom_migration');
      await zipFile.writeAsBytes(bytes);
      await ZipFile.extractToDirectory(
        zipFile: zipFile,
        destinationDir: migrationDir,
      );

      final womEncryptedJsonFile = File('${migrationDir.path}/woms');
      final womEncryptedJson = await womEncryptedJsonFile.readAsString();
      final map = Map.from(jsonDecode(womEncryptedJson));

      final womList = List<Map<String, dynamic>>.from(map['woms']);
      final woms = womList.map((e) => WomRow.fromJson(e)).toList();

      final totemList = List<Map<String, dynamic>>.from(map['totems'] ?? []);
      final totems = totemList.map((e) => TotemRow.fromJson(e)).toList();

      final badgeList = List<Map<String, dynamic>>.from(map['badges'] ?? []);
      final badges = badgeList
          .map((e) => BadgeData.fromBadgeEntry(BadgeEntry.fromJson(e)))
          .toList();

      final challengeList = List<Map<String, dynamic>>.from(
        map['challenges'] ?? [],
      );
      final challenges = challengeList
          .map(
            (e) => ChallengeData.fromChallengeEntry(
              ChallengeEntry.fromJson(e),
              [],
            ),
          )
          .toList();

      final device = map['device'] as String;

      logger.i('Stai importando: ${woms.length} wom');
      logger.i('Stai importando ${totems.length} totems');
      logger.i('Stai importando ${badges.length} totems');
      logger.i('Stai importando ${challenges.length} totems');

      final tmp = <String?>{};

      for (int i = 0; i < woms.length; i++) {
        tmp.add(woms[i].aim);
      }

      final aims = <Aim>[];
      final aimsList = await ref.read(aimProvider.future);
      for (final a in tmp) {
        final aim = aimsList.firstWhereOrNull((element) => element.code == a);
        if (aim != null) {
          aims.add(aim);
        }
      }

      state = ImportSummary(
        woms: woms,
        totems: totems,
        aims: aims,
        otc: otc,
        password: password,
        device: device,
        badges: badges,
        challenges: challenges,
      );
    } catch (ex, st) {
      logger.e('checkImport', error: ex, stackTrace: st);
      state = ImportError(ex, st);
    }
  }

  Future<void> importWom() async {
    final currentState = state;
    if (currentState is! ImportSummary) {
      return;
    }
    try {
      state = ImportState.loading();

      final otc = currentState.otc;
      final password = currentState.password;
      final woms = currentState.woms;
      final totems = currentState.totems;
      final aims = currentState.aims;
      final device = currentState.device;
      final badges = currentState.badges;
      final challenges = currentState.challenges;
      var badgesCountImported = 0;
      var challengesCountImported = 0;
      var totemsCountImported = 0;

      final tx = TransactionModel(
        id: 0,
        date: DateTime.now(),
        size: woms.length,
        type: TransactionType.MIGRATION_IMPORT,
        source: device,
        aimCode: aims.map((a) => a.code).join(','),
      );

      // await ref.read(getDatabaseProvider).deleteEverything();

      await ref
          .read(getDatabaseProvider)
          .importWoms(tx.toTransactionCompanion(), woms);

      Object? object = null;
      StackTrace? stackTrace = null;
      try {
        final totemsCompanion = totems.map((w) => w.toCompanion(true)).toList();
        await ref.read(getDatabaseProvider).importTotems(totemsCompanion);
        totemsCountImported = totemsCompanion.length;
      } catch (ex, st) {
        object = ex;
        stackTrace = st;
        logger.e('importTotems', error: ex, stackTrace: st);
      }

      try {
        final badgesCompanion = badges
            .map((b) => b.toBadgeCompanion())
            .toList();
        await ref
            .read(getDatabaseProvider)
            .badgeDao
            .insertBadgeEntries(badgesCompanion);
        badgesCountImported = badgesCompanion.length;
      } catch (ex, st) {
        object = ex;
        stackTrace = st;
        logger.e('importBadges', error: ex, stackTrace: st);
      }

      try {
        final challengesCompanion = challenges
            .map((c) => c.toChallengeCompanion())
            .toList();
        await ref
            .read(getDatabaseProvider)
            .challengeDao
            .insertChallenges(challengesCompanion);
        challengesCountImported = challengesCompanion.length;
      } catch (ex, st) {
        object = ex;
        stackTrace = st;
        logger.e('challengesCompanion', error: ex, stackTrace: st);
      }

      await ref.read(pocketProvider).completeMigration(otc, password);
      state = ImportCompleted(
        count: woms.length,
        badgesCount: badgesCountImported,
        challengesCount: challengesCountImported,
        totemsCount: totemsCountImported,
        ex: object,
        st: stackTrace,
      );
    } catch (ex, st) {
      logger.e('importWom', error: ex, stackTrace: st);
      state = ImportError(ex, st);
    }
    refreshHome();
  }

  refreshHome() {
    ref.invalidate(availableWomCountProvider);
    ref.invalidate(fetchTransactionsProvider);
    ref.invalidate(exchangeProvider);
    ref.invalidate(totalWomCountProvider);
    ref.invalidate(mapNotifierProvider);
    ref.invalidate(fetchWomCountEarnedInTheLastWeekProvider);
    ref.invalidate(fetchWomCountSpentInTheLastWeekProvider);
    ref.invalidate(badgeProvider);
  }

  void goToPin() {
    state = ImportInitial();
  }
}
