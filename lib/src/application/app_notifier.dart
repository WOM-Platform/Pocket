import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import '../blocs/app/app_state.dart';

bool isFirstOpen = false;

final _deepLinkStreamNotifierProvider =
    StreamProvider<DeepLinkModel>((ref) async* {
  await for (final s in uriLinkStream) {
    logger.i("Subscription stream uri : $s");
    final deepLinkModel = DeepLinkModel.fromUri(s);
    yield deepLinkModel;
  }
});

final deepLinkNotifierProvider =
    AsyncNotifierProvider<DeepLinkNotifier, DeepLinkModel?>(
        DeepLinkNotifier.new);

class DeepLinkNotifier extends AsyncNotifier<DeepLinkModel?> {
  @override
  FutureOr<DeepLinkModel?> build() async {
    // final streamDeepLink = ref.watch(_deepLinkStreamNotifierProvider);

    ref.listen(_deepLinkStreamNotifierProvider, (previous, next) {
      if (next is AsyncData) {
        final deepLink = next.valueOrNull;
        if (deepLink != null) {
          state =  AsyncData(deepLink);
        }
      }
    });
    final initialDeepLink = await getDeepLink();
    if (initialDeepLink != null) {
      await Future.delayed(Duration(milliseconds: 250));
      return initialDeepLink;
    }
    return null;
  }

  Future<DeepLinkModel?> getDeepLink() async {
    DeepLinkModel? deepLinkModel;
    try {
      Uri? initialUri = await getInitialUri();
      logger.i("AppNotifier uri : $initialUri");
      deepLinkModel = DeepLinkModel.fromUri(initialUri);
    } on PlatformException {
      logger.i("AppReposirotry");
      logger.i('Failed to get initial link.');
//      return Future.error('Failed to get initial link.');
    } on FormatException {
      logger.i("AppBloc");
      logger.i('Failed to parse the initial link as Uri.');
//      return Future.error('Failed to parse the initial link as Uri.');
    } catch (e) {
      logger.i("AppBloc");
      logger.i(e.toString());
//      return Future.error(e);
    }
    return deepLinkModel;
  }
}

final appNotifierProvider =
    AsyncNotifierProvider<AppNotifier, AppState>(AppNotifier.new);

class AppNotifier extends AsyncNotifier<AppState> {
  //late StreamSubscription _sub;

  @override
  FutureOr<AppState> build() async {
    await ref.read(appRepositoryProvider).updateAim();
    await ref.read(transactionCountNotifierProvider.future);
    isFirstOpen = await Utils.readIsFirstOpen();
    if (isFirstOpen) {
      await Utils.setIsFirstOpen(false);
    }
    if (isFirstOpen) {
      return IntroMode();
    } else {
      return NormalMode();
    }
  }

  Future<AppStatus> getAppStatus() {
    return ref.read(appRepositoryProvider).getAppStatus();
  }

  goIntoNormalMode() {
    state = AsyncData(NormalMode());
  }

  goIntoDeepLinkMode(DeepLinkModel deepLinkModel) {
    state = AsyncData(DeepLinkMode(deepLinkModel));
  }
}
