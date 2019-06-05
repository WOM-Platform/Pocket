import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pocket/src/models/deep_link_model.dart';

@immutable
abstract class AppEvent extends Equatable {
  AppEvent([List props = const []]) : super(props);
}

class LoadData extends AppEvent {
  @override
  String toString() => "LoadData";
}

class DeepLinkEvent extends AppEvent {
  final DeepLinkModel deepLinkModel;

  DeepLinkEvent(this.deepLinkModel);
}

class HomeEvent extends AppEvent {}

class AppStarted extends AppEvent {}