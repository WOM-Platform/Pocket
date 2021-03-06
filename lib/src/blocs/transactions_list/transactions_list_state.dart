import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pocket/src/models/transaction_model.dart';

@immutable
abstract class TransactionsState extends Equatable {
  TransactionsState([List props = const []]) : super(props);
}

class InitialTransactionsState extends TransactionsState {}

class TransactionsLoading extends TransactionsState {
  @override
  String toString() => "TransactionsLoading";
}

class TransactionsLoaded extends TransactionsState {
  final List<TransactionModel> transactions;

  TransactionsLoaded(this.transactions) : super([transactions]);

  @override
  String toString() => "TransactionsLoaded";
}

class TransactionsErrorState extends TransactionsState {
  final String error;

  TransactionsErrorState(this.error) : super([error]);

  @override
  String toString() => "TransactionsErrorState";
}

class TransactionsNoDataConnectionState extends TransactionsState {
  @override
  String toString() => "TransactionsNoDataConnectionState";
}
