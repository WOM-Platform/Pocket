import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  TransactionEvent([List props = const []]) : super(props);
}

class TransactionStarted extends TransactionEvent {
  final String password;

  TransactionStarted(this.password) : super([password]);

  @override
  String toString() => 'TransactionStarted';
}

class TransactionConfirmPayment extends TransactionEvent {
  final InfoPayResponse infoPay;
  final String password;

  TransactionConfirmPayment(this.infoPay, this.password)
      : super([infoPay, password]);

  @override
  String toString() =>
      'TransactionConfirmPayment: $infoPay, password: $password';
}

class RequestPaymentTransaction extends TransactionEvent {
  @override
  String toString() => 'RequestPaymentTransaction';
}

class RequestRedeemTransaction extends TransactionEvent {
  @override
  String toString() => 'RequestRedeemTransaction';
}

class CompleteTransaction extends TransactionEvent {
  final String token;

  CompleteTransaction({@required this.token}) : super([token]);

  @override
  String toString() => 'CompleteTransaction { token: $token }';
}
