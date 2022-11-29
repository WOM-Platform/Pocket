import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';
import 'package:wom_pocket/src/blocs/transaction/bloc.dart';
import 'package:wom_pocket/src/blocs/transaction/transaction_event.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';

abstract class TransactionState extends Equatable {}

class TransactionUninitialized extends TransactionState {
  @override
  String toString() => 'TransactionUninitialized';

  @override
  List<Object> get props => [];
}

class TransactionCompleteState extends TransactionState {
  final TransactionModel transaction;

  TransactionCompleteState(this.transaction);

  @override
  String toString() => 'TransactionComplete';

  @override
  List<Object> get props => [transaction];
}

class TransactionInfoPaymentState extends TransactionState {
  final PaymentInfoResponse infoPayment;
  final String password;

  TransactionInfoPaymentState(this.infoPayment, this.password);

  @override
  String toString() => 'TransactionInfoPayment';

  @override
  List<Object?> get props => [infoPayment, password];
}

class TransactionLoadingState extends TransactionState {
  @override
  String toString() => 'TransactionLoading';

  @override
  List<Object> get props => [];
}

class TransactionMissingLocationState extends TransactionState {
  // final TransactionEvent eventToRepeat;
  // final LocationServiceException exception;

  TransactionMissingLocationState();

  @override
  String toString() => 'TransactionMissingLocationState';

  @override
  List<Object> get props => [];
}

class TransactionErrorState extends TransactionState {
  final String error;
  final String? translationKey;

  TransactionErrorState({required this.error, this.translationKey})
      : assert(error.isNotEmpty);

  @override
  String toString() => 'TransactionError';

  @override
  List<Object?> get props => [error, translationKey ?? ''];
}

class TransactionNoDataConnectionState extends TransactionState {
  final PaymentInfoResponse? infoPay;
  final String password;

  TransactionNoDataConnectionState({this.infoPay, required this.password});

  @override
  String toString() => 'TransactionNoDataConnectionState';

  @override
  List<Object?> get props => [infoPay, password];
}
