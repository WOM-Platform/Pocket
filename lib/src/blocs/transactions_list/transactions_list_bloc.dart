import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/services/aim_repository.dart';
import './bloc.dart';

class TransactionsListBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionDB _transactionDB;
  AimRepository _aimRepository;

  TransactionsListBloc(this._transactionDB)
      : super(InitialTransactionsState()) {
    _aimRepository = AimRepository();
  }

  @override
  Stream<TransactionsState> mapEventToState(
    TransactionsEvent event,
  ) async* {
    if (event is LoadTransactions) {
      yield TransactionsLoading();

      List<Aim> aims = await _aimRepository.getFlatAimList(
          database: AppDatabase.get().getDb());

      try {
        //Se non ho gli aim salvati nel db li scarico da internet
        if (aims == null || aims.isEmpty) {
          if (await DataConnectionChecker().hasConnection) {
            // final repo = AppRepository();
            aims = await _aimRepository.updateAim(
                database: AppDatabase.get().getDb());
          } else {
            print("Aims null or empty and No internet connection");
            yield TransactionsNoDataConnectionState();
            return;
          }
        }

        print('aim letti : ${aims.length}');
        final List<TransactionModel> transactions =
            await _transactionDB.getTransactions();
        for (TransactionModel t in transactions) {
          final String aimCode = t.aimCode.split(',').first;
          final Aim aim = aims.firstWhere((a) {
            return a.code == aimCode;
          }, orElse: () {
            return null;
          });
          t.aim = aim;
        }
        yield TransactionsLoaded(transactions);
      } catch (ex) {
        print(ex.toString());
        yield TransactionsErrorState('somethings_wrong');
      }
    }
  }
}
