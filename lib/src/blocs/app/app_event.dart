import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';

@immutable
abstract class AppEvent extends Equatable {}

class LoadData extends AppEvent {
  @override
  String toString() => "LoadData";

  @override
  List<Object> get props => [];
}

class DeepLinkEvent extends AppEvent {
  final DeepLinkModel deepLinkModel;

  DeepLinkEvent(this.deepLinkModel);

  @override
  List<Object> get props => [];
}

class HomeEvent extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {
  @override
  List<Object> get props => [];
}
