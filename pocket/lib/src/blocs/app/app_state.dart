import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pocket/src/models/deep_link_model.dart';

@immutable
abstract class AppState extends Equatable {
  AppState([List props = const []]) : super(props);
}

class InitialAppState extends AppState {}
//
//class AppStarting extends AppState {
//  @override
//  String toString() => 'AppStarting';
//}

class LoadingData extends AppState {
  @override
  String toString() => 'LoadingData';
}

class DeepLinkMode extends AppState {
  final DeepLinkModel deepLinkModel;

  DeepLinkMode(this.deepLinkModel);

  @override
  String toString() => 'DeepLinkMode';
}

class IntroMode extends AppState {
  @override
  String toString() => 'IntroMode';
}

class NormalMode extends AppState {
  NormalMode() : super([]);

  @override
  String toString() => 'NormalMode';
}
