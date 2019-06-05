import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PinState extends Equatable {
  final String pin;

  PinState(this.pin, [List props = const []]) : super([pin]..addAll(props));
}

class InitialPinState extends PinState {
  InitialPinState({String pin = ""}) : super(pin);
}

class PinVerified extends PinState {
  PinVerified(String pin) : super(pin);
}


class PinUpdated extends PinState {
  PinUpdated(String pin) : super(pin);
}
