import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SettingsState extends Equatable {}

class InitialSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}
