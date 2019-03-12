import 'package:bloc/bloc.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/response_info_pay.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/screens/transacation_summary/transaction_events.dart';
import 'package:pocket/src/screens/transacation_summary/transaction_state.dart';
import 'package:pocket/src/services/transaction_repository.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;
  final String otc;

  TransactionBloc(this._repository, this.otc)
      : assert(_repository != null) ;

  @override
  void onTransition(Transition<TransactionEvent, TransactionState> transition) {
    print(transition);
  }

  @override
  TransactionState get initialState => TransactionLoadingState();

  @override
  Stream<TransactionState> mapEventToState(
      TransactionState currentState, TransactionEvent event) async* {
    if (event is TransactionStarted) {
      try {
        TransactionModel transaction;
        if (event.type == TransactionType.VOUCHERS) {
          transaction = await _repository.getWoms(otc);
          yield TransactionCompleteState(transaction);
        } else {
          final ResponseInfoPay infoPayment =
              await _repository.requestPayment(otc);
          print(infoPayment);
          yield TransactionInfoPaymentState(infoPayment);
        }
      } catch (ex) {
        yield TransactionErrorState(ex.toString());
      }
    }

    if (event is TransactionConfirmPayment) {
      yield TransactionLoadingState();
      try {
        TransactionModel transaction =
            await _repository.pay(otc, event.infoPay);
        yield TransactionCompleteState(transaction);
      } catch (ex) {
        yield TransactionErrorState(ex);
      }
    }
  }

  exception(){
    throw Exception('fake exception');
  }
}
