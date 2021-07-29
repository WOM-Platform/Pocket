import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class LoadTransaction extends Equatable {
  @override
  String toString() => "LoadTransactions";

  @override
  List<Object> get props => [];
}
