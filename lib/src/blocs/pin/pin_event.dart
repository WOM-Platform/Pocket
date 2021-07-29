import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PinEvent extends Equatable {}

class UpdateCode extends PinEvent {
  final int value;

  UpdateCode(this.value);

  @override
  String toString() => "UpdateCode";

  @override
  List<Object> get props => [value];
}

class DeleteCode extends PinEvent {
  @override
  String toString() => "DeleteCode";

  @override
  List<Object> get props => [];
}

class DeleteAllCode extends PinEvent {
  @override
  String toString() => "DeleteAllCode";

  @override
  List<Object> get props => [];
}
