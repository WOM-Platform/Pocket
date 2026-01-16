import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_background/nfc_background.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

part 'app_notifier.g.dart';

bool isFirstOpen = false;
final appLinks = AppLinks();

@riverpod
NfcBackground getNFCBackground(Ref ref) {
  return NfcBackground();
}

@riverpod
Stream<TotemData> getNfcIntent(Ref ref) async* {
  final stream = ref.watch(getNFCBackgroundProvider).backgroundIntentStream;
  await for (final link in stream) {
    logger.i('getNfcIntent: Subscription stream uri : $link');
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
    logger.i('NfcBackgroundNotifier build');
    ref.listen<AsyncValue<TotemData>>(getNfcIntentProvider, (
      previous,
      next,
    ) async {
      logger.i('getNfcIntentProvider new intent');

      final currentState = next;
      if (!_lock && currentState is AsyncData) {
        _lock = true;
        state = AsyncData(currentState.requireValue);
      }
    });
    return null;
  }

  unlock() {
    _lock = false;
  }
}

// final _deepLinkStreamNotifierProvider = StreamProvider<String?>((ref) async* {
//   await for (final s in appLinks.stringLinkStream) {
//     logger.i('_deepLinkStreamNotifierProvider: Subscription stream uri : $s');
//     yield s;
//   }
// });

final deepLinkNotifierProvider =
    AsyncNotifierProvider<DeepLinkNotifier, String?>(DeepLinkNotifier.new);

class DeepLinkNotifier extends AsyncNotifier<String?> {
  late final StreamSubscription? _streamSubscription;

  @override
  FutureOr<String?> build() async {
    _streamSubscription = appLinks.stringLinkStream.listen((deepLink) {
      logger.i('DeepLinkNotifier: deeplink: $deepLink');
      state = AsyncData(deepLink);
    });

    // final initialDeepLink = await appLinks.getInitialLinkString();
    // if (initialDeepLink != null) {
    //   logger.i('DeepLinkNotifier: build: initialDeepLink: $initialDeepLink');
    //   await Future.delayed(Duration(milliseconds: 250));
    //   return initialDeepLink;
    // }
    return null;
  }

  void reset() {
    state = AsyncData(null);
  }
}
