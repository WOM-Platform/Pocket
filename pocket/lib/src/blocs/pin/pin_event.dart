import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PinEvent extends Equatable {
  PinEvent([List props = const []]) : super(props);
}

class UpdateCode extends PinEvent {
  final int value;

  UpdateCode(this.value) : super([value]);

  @override
  String toString() => "UpdateCode";
}

class DeleteCode extends PinEvent {
  @override
  String toString() => "DeleteCode";
}

class DeleteAllCode extends PinEvent {
  @override
  String toString() => "DeleteAllCode";
}
