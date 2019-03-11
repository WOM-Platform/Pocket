import 'package:equatable/equatable.dart';
import 'package:pocket/src/models/response_info_pay.dart';
import 'package:pocket/src/models/transaction_model.dart';

abstract class TransactionState extends Equatable {}

class TransactionUninitialized extends TransactionState {
  @override
  String toString() => 'TransactionUninitialized';
}

class TransactionCompleteState extends TransactionState {
  final TransactionModel transaction;

  TransactionCompleteState(this.transaction);

  @override
  String toString() => 'TransactionComplete';
}

class TransactionInfoPaymentState extends TransactionState {
  final ResponseInfoPay infoPayment;

  TransactionInfoPaymentState(this.infoPayment);

  @override
  String toString() => 'TransactionInfoPayment';
}

class TransactionLoadingState extends TransactionState {
  @override
  String toString() => 'TransactionLoading';
}

class TransactionErrorState extends TransactionState {
  final String error;

  TransactionErrorState(this.error) : assert(error != null && error.isNotEmpty);

  @override
  String toString() => 'TransactionError';
}
