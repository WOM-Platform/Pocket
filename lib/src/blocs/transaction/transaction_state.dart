import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';
import 'package:pocket/src/models/transaction_model.dart';

abstract class TransactionState extends Equatable {
  TransactionState([List props = const []]) : super(props);
}

class TransactionUninitialized extends TransactionState {
  @override
  String toString() => 'TransactionUninitialized';
}

class TransactionCompleteState extends TransactionState {
  final TransactionModel transaction;

  TransactionCompleteState(this.transaction) : super([transaction]);

  @override
  String toString() => 'TransactionComplete';
}

class TransactionInfoPaymentState extends TransactionState {
  final InfoPayResponse infoPayment;
  final String password;

  TransactionInfoPaymentState(this.infoPayment, this.password)
      : super([infoPayment, password]);

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

class TransactionNoDataConnectionState extends TransactionState {
  final InfoPayResponse infoPay;
  final String password;

  TransactionNoDataConnectionState({this.infoPay, this.password})
      : super([infoPay, password]);

  @override
  String toString() => 'TransactionNoDataConnectionState';
}
