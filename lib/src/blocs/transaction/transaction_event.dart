import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TransactionEvent extends Equatable {}

class TransactionStarted extends TransactionEvent {
  final String password;

  TransactionStarted(this.password);

  @override
  String toString() => 'TransactionStarted';

  @override
  List<Object> get props => [password];
}

class TransactionConfirmPayment extends TransactionEvent {
  final InfoPayResponse infoPay;
  final String password;

  TransactionConfirmPayment(this.infoPay, this.password);

  @override
  String toString() =>
      'TransactionConfirmPayment: $infoPay, password: $password';

  @override
  List<Object> get props => [infoPay, password];
}

class RequestPaymentTransaction extends TransactionEvent {
  @override
  String toString() => 'RequestPaymentTransaction';

  @override
  List<Object> get props => [];
}

class RequestRedeemTransaction extends TransactionEvent {
  @override
  String toString() => 'RequestRedeemTransaction';

  @override
  List<Object> get props => [];
}

class CompleteTransaction extends TransactionEvent {
  final String token;

  CompleteTransaction({@required this.token});

  @override
  String toString() => 'CompleteTransaction { token: $token }';

  @override
  List<Object> get props => [token];
}
