import 'package:bloc/bloc.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pocket/src/blocs/transaction/transaction_event.dart';
import 'package:pocket/src/blocs/transaction/transaction_state.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/services/transaction_repository.dart';

import '../../my_logger.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;
  final String otc;
  final TransactionType type;

  TransactionBloc(this._repository, this.otc, this.type)
      : super(TransactionLoadingState());

  exception() {
    throw Exception('fake exception');
  }

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionStarted) {
      yield TransactionLoadingState();
      if (await InternetConnectionChecker().hasConnection) {
        try {
          TransactionModel transaction;
          if (type == TransactionType.VOUCHERS) {
            logger.i("bloc: " + otc);
            transaction = await _repository.getWoms(otc, event.password!);
            logger.i("transaction saved");
            yield TransactionCompleteState(transaction);
          } else {
            final infoPayment =
                await _repository.requestPayment(otc, event.password);
            logger.i(infoPayment);
            yield TransactionInfoPaymentState(infoPayment, event.password);
          }
        } on InsufficientVouchers catch (ex) {
          yield TransactionErrorState(
              'Non hai voucher a sufficienza per questa richiesta');
        } on ServerException catch (ex) {
          yield TransactionErrorState(ex.error ?? 'Errore sconosciuto');
        } on TimeoutException catch (ex) {
          yield TransactionErrorState('La richiesta ha impiegato troppo tempo');
        } catch (ex) {
          yield TransactionErrorState(ex.toString());
        }
      } else {
        yield TransactionNoDataConnectionState();
      }
    } else if (event is TransactionConfirmPayment) {
      yield TransactionLoadingState();
      if (await InternetConnectionChecker().hasConnection) {
        try {
          final transaction =
              await _repository.pay(otc, event.password, event.infoPay!);
          yield TransactionCompleteState(transaction);
        } on InsufficientVouchers catch (ex) {
          yield TransactionErrorState(
              'Non hai voucher a sufficienza per questa richiesta');
        } on ServerException catch (ex) {
          yield TransactionErrorState(ex.error ?? 'Errore sconosciuto');
        } on TimeoutException catch (ex) {
          yield TransactionErrorState('La richiesta ha impiegato troppo tempo');
        } catch (ex) {
          logger.i(ex.toString());
          yield TransactionErrorState(ex.toString());
        }
      } else {
        yield TransactionNoDataConnectionState(infoPay: event.infoPay);
      }
    }
  }
}
