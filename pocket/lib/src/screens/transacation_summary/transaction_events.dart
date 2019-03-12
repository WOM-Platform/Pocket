import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/response_info_pay.dart';

abstract class TransactionEvent extends Equatable {
  TransactionEvent([List props = const []]) : super(props);
}

class TransactionStarted extends TransactionEvent {
  final TransactionType type;

  TransactionStarted(this.type);

  @override
  String toString() => 'TransactionStarted';
}

class TransactionConfirmPayment extends TransactionEvent {
  final ResponseInfoPay infoPay;

  TransactionConfirmPayment(this.infoPay);

  @override
  String toString() => 'TransactionConfirmPayment';
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
