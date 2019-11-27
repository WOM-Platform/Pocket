import 'package:bloc/bloc.dart';
import 'package:pocket/src/blocs/transaction/transaction_event.dart';
import 'package:pocket/src/blocs/transaction/transaction_state.dart';
import 'package:pocket/src/models/response_info_pay.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/services/transaction_repository.dart';
import 'package:wom_package/wom_package.dart' show TransactionType;

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;
  final String otc;

  TransactionBloc(this._repository, this.otc) : assert(_repository != null);

  @override
  void onTransition(Transition<TransactionEvent, TransactionState> transition) {
    print(transition);
  }

  @override
  TransactionState get initialState => TransactionLoadingState();

  exception() {
    throw Exception('fake exception');
  }

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionStarted) {
      yield TransactionLoadingState();
      try {
        TransactionModel transaction;
        if (event.type == TransactionType.VOUCHERS) {
          print("bloc: " + otc);
          transaction = await _repository.getWoms(otc);
          print("transaction saved");
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
        print(ex.toString());
        yield TransactionErrorState(ex.toString());
      }
    }
  }
}
