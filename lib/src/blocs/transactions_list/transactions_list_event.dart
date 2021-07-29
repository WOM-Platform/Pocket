import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TransactionsEvent extends Equatable {}

class LoadTransactions extends TransactionsEvent {
  @override
  String toString() => "LoadTransactions";

  @override
  List<Object> get props => [];
}
