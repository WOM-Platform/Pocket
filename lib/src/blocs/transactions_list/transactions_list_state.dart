import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';

@immutable
abstract class TransactionsState extends Equatable {}

class InitialTransactionsState extends TransactionsState {
  @override
  List<Object> get props => [];
}

class TransactionsLoading extends TransactionsState {
  @override
  String toString() => "TransactionsLoading";
  @override
  List<Object> get props => [];
}

class TransactionsLoaded extends TransactionsState {
  final List<TransactionModel> transactions;

  TransactionsLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];

  @override
  String toString() => "TransactionsLoaded";
}

class TransactionsErrorState extends TransactionsState {
  final String error;

  TransactionsErrorState(this.error);

  @override
  String toString() => "TransactionsErrorState";

  @override
  List<Object> get props => [error];
}

class TransactionsNoDataConnectionState extends TransactionsState {
  @override
  String toString() => "TransactionsNoDataConnectionState";

  @override
  List<Object> get props => [];
}
