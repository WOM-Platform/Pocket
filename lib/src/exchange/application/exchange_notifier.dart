import 'dart:math';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:drift/drift.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/application/transactions_notifier.dart';
import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/database/extensions.dart';
import 'package:wom_pocket/src/exchange/application/new_exchange_state.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

part 'exchange_notifier.g.dart';

@riverpod
Future<List<TransactionModel>> getExchangeTransactions(
    GetExchangeTransactionsRef ref) async {
  var aims = await ref.read(aimRepositoryProvider).getFlatAimList();

  try {
    //Se non ho gli aim salvati nel db li scarico da internet
    if (aims.isEmpty) {
      if (await InternetConnectionChecker().hasConnection) {
        aims = await ref.read(aimRepositoryProvider).updateAim();
      } else {
        logger.i("Aims null or empty and No internet connection");
        throw Exception();
      }
    }
    final transactions = await ref
        .read(getDatabaseProvider)
        .transactionsDao
        .getExchangeTransactions;
    return transactions.map((e) => e.toModel()).toList();
  } catch (ex) {
    logger.e(ex.toString());
    rethrow;
  }
}

@riverpod
class ExchangeNotifier extends _$ExchangeNotifier {
  @override
  ExchangeState build() {
    getDailyWomCount();
    return ExchangeStateLoading();
  }

  Future<int> getDailyWomCount() async {
    final womSpentToday = await ref
        .read(getDatabaseProvider)
        .transactionsDao
        .getExchangeDailyCount();
    final total =
        await ref.read(getDatabaseProvider).womsDao.getAvailableWomCount();
    logger.i('Ho consumato già ${womSpentToday} wom');
    state = ExchangeStateInitial(
      dailyAvailableWom: 60 - womSpentToday,
      totalAvailableWom: total,
    );
    return womSpentToday;
  }
}

@riverpod
class NewExchangeNotifier extends _$NewExchangeNotifier {
  @override
  NewExchangeState build(int womCount) {
    _dona(womCount);
    return NewExchangeState.loading();
  }

  void _dona(int womCount) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final keys = await ref.read(pocketProvider).getExchangeKey();
      final satisfyingVouchers =
          (await ref.read(getDatabaseProvider).womsDao.getVouchersForExchange())
              .map((e) => e.toVoucher())
              .toList();

      if (womCount > satisfyingVouchers.length) {
        state = NewExchangeStateinsufficientVouchers();
        return;
      }

      final vouchers = satisfyingVouchers.sublist(0, womCount);
      final response = await ref.read(pocketProvider).createExchangeRequest(
            keys.sourceId,
            CoreUtils.generateGUID(),
            keys.sourcePublicKey,
            vouchers,
          );

      final id =
          await ref.read(getDatabaseProvider).transactionsDao.addTransaction(
                TransactionsCompanion.insert(
                  source: '',
                  aim: 'XX',
                  timestamp: DateTime.now().millisecondsSinceEpoch,
                  type: TransactionType.EXCHANGE_EXPORT.index,
                  size: womCount,
                  pin: Value(response.password),
                  link: Value(response.link),
                ),
              );

      int count = 0;

      for (int i = 0; i < vouchers.length; i++) {
        final c = await ref
            .read(getDatabaseProvider)
            .womsDao
            .updateWomStatusToOff(vouchers[i].id, id);
        count += c;
      }
      logger.i("wom to off = $count");

      state = NewExchangeStateData(
        link: response.link,
        pin: response.password,
        womCount: womCount,
      );
      refreshHome();
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
      state = NewExchangeStateError(ex, st);
    }
  }

  // void showDonation(String link, String pin, int womCount) {
  //   state = NewExchangeStateData(link: link, pin: pin, size: womCount);
  // }

  refreshHome() {
    ref.invalidate(getExchangeTransactionsProvider);
    ref.invalidate(exchangeNotifierProvider);
    ref.invalidate(fetchTransactionsProvider);
    ref.invalidate(availableWomCountProvider);
    ref.invalidate(mapNotifierProvider);
    ref.invalidate(totalWomCountProvider);
    ref.invalidate(fetchAimInPercentageProvider);
    ref.invalidate(fetchWomCountEarnedInTheLastWeekProvider);
    ref.invalidate(fetchWomCountSpentInTheLastWeekProvider);
  }
}
