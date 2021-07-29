import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pocket/src/models/deep_link_model.dart';

@immutable
abstract class AppState extends Equatable {}

class InitialAppState extends AppState {
  @override
  List<Object> get props => [];
}
//
//class AppStarting extends AppState {
//  @override
//  String toString() => 'AppStarting';
//}

class LoadingData extends AppState {
  @override
  String toString() => 'LoadingData';

  @override
  List<Object> get props => [];
}

class DeepLinkMode extends AppState {
  final DeepLinkModel deepLinkModel;

  DeepLinkMode(this.deepLinkModel);

  @override
  String toString() => 'DeepLinkMode';

  @override
  List<Object> get props => [deepLinkModel];
}

class IntroMode extends AppState {
  @override
  String toString() => 'IntroMode';

  @override
  List<Object> get props => [];
}

class NormalMode extends AppState {
  @override
  String toString() => 'NormalMode';

  @override
  List<Object> get props => [];
}
