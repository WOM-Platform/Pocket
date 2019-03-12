import 'dart:async';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pocket/app_repository.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:uni_links/uni_links.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository _appRepository;

  AppBloc(this._appRepository) : assert(_appRepository != null);

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    print(transition);
  }

  @override
  get initialState => null;

  @override
  Stream<AppState> mapEventToState(AppState currentState, AppEvent event) {
    return null;
  }

  Future<DeepLinkModel> getDeepLink() async {
    DeepLinkModel deepLinkModel;
    try {
      Uri initialUri = await getInitialUri();
      print("AppBloc uri : $initialUri");
      deepLinkModel = DeepLinkModel.fromUri(initialUri);
    } on PlatformException {
      print("AppReposirotry");
      print('Failed to get initial link.');
//      return Future.error('Failed to get initial link.');
    } on FormatException {
      print("AppBloc");
      print('Failed to parse the initial link as Uri.');
//      return Future.error('Failed to parse the initial link as Uri.');
    } catch (e) {
      print("AppBloc");
      print(e.toString());
//      return Future.error(e);
    }
    return deepLinkModel;
  }
}

abstract class AppState extends Equatable {
  AppState([List props = const []]) : super(props);
}

class AppStarting extends AppState {
  @override
  String toString() => 'AppStarting';
}

class DeepLinkMode extends AppState {
  final DeepLinkModel deepLinkModel;

  DeepLinkMode(this.deepLinkModel);

  @override
  String toString() => 'DeepLinkMode';
}

class NormalMode extends AppState {
  @override
  String toString() => 'NormalMode';
}

abstract class AppEvent extends Equatable {
  AppEvent([List props = const []]) : super(props);
}

class DeepLinkEvent extends AppEvent {
  final DeepLinkModel deepLinkModel;

  DeepLinkEvent(this.deepLinkModel);
}

class HomeEvent extends AppEvent {}

class AppStarted extends AppEvent {}