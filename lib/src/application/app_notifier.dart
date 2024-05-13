import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_background/nfc_background.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uni_links/uni_links.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import 'app_state.dart';

part 'app_notifier.g.dart';

bool isFirstOpen = false;

@riverpod
NfcBackground getNFCBackground(GetNFCBackgroundRef ref) {
  return NfcBackground();
}

@riverpod
Stream<TotemData> getNfcIntent(GetNfcIntentRef ref) async* {
  final stream = ref.watch(getNFCBackgroundProvider).backgroundIntentStream;
  await for (final link in stream) {
    logger.i("Subscription stream uri : $link");
    final totemData = validateTotemQrCodeWithRegex(link);
    if (totemData != null) {
      yield totemData;
    }
  }
}

@riverpod
class NfcBackgroundNotifier extends _$NfcBackgroundNotifier {
  bool _lock = false;

  @override
  Future<TotemData?> build() async {
    print('NfcBackgroundNotifier build');
    ref.listen<AsyncValue<TotemData>>(getNfcIntentProvider,
        (previous, next) async {
      print('getNfcIntentProvider new intent');

      final currentState = next;
      if (!_lock && currentState is AsyncData) {
        _lock = true;
        state = AsyncData(currentState.requireValue);
      }
    });

    // final initial = await ref.watch(getNFCBackgroundProvider).getInitialData();
    // if (initial != null) {
    //   final totemData = validateTotemQrCodeWithRegex(initial);
    //   if (totemData != null) {
    //     _lock = true;
    //     return totemData;
    //   }
    // }
    return null;
  }

  unlock() {
    _lock = false;
  }
}

final _deepLinkStreamNotifierProvider =
    StreamProvider<String?>((ref) async* {
  await for (final s in linkStream) {
    logger.i("Subscription stream uri : $s");
    // final deepLinkModel = DeepLinkModel.fromUri(s);
    yield s;
  }
});

/*@freezed
class DeepLinkState with DeepLinkState {
  const factory DeepLinkState.single({
    DeepLinkModel? deepL,
    TotemData? totemData,
  }) = _DeepLinkState;
}*/

final deepLinkNotifierProvider =
    AsyncNotifierProvider<DeepLinkNotifier, String?>(
        DeepLinkNotifier.new);

class DeepLinkNotifier extends AsyncNotifier<String?> {
  @override
  FutureOr<String?> build() async {
    ref.listen(_deepLinkStreamNotifierProvider, (previous, next) {
      if (next is AsyncData) {
        final deepLink = next.valueOrNull;
        if (deepLink != null) {
          logger.i("deeplink: $deepLink");
          state = AsyncData(deepLink);
        }
      }
    });


    final initialDeepLink = await getInitialLink();
    if (initialDeepLink != null) {
      logger.i("initialDeepLink: $initialDeepLink");
      await Future.delayed(Duration(milliseconds: 250));
      return initialDeepLink;
    }
    return null;
  }

/*  Future<DeepLinkModel?> getDeepLink() async {
    DeepLinkModel? deepLinkModel;
    try {
      Uri? initialUri = await getInitialUri();
      logger.i("AppNotifier uri : $initialUri");
      deepLinkModel = DeepLinkModel.fromUri(initialUri);
    } on PlatformException catch (ex, st) {
      logger.e('AppRepository: error getting deep link',
          error: ex, stackTrace: st);
    } on FormatException catch (ex, st) {
      logger.e('Error getting deep link', error: ex, stackTrace: st);
    } catch (ex, st) {
      logger.e('Error getting deep link', error: ex, stackTrace: st);
    }
    return deepLinkModel;
  }*/
}

final appNotifierProvider =
    AsyncNotifierProvider<AppNotifier, AppState>(AppNotifier.new);

class AppNotifier extends AsyncNotifier<AppState> {
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
