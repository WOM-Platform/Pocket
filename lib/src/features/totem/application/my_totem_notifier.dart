import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/location_notifier.dart';
import 'package:wom_pocket/src/core/exceptions/location_exception.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/services/transaction_repository.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/totem/application/my_totem_state.dart';

part 'my_totem_notifier.g.dart';

const nameKey = 'name';
const emailKey = 'email';
const phoneKey = 'phone';
const websiteKey = 'website';
const totemIdKey = 'totemId';
const eventIdKey = 'eventId';
const refreshTimeoutInSeconds = 60;

@riverpod
class MyTotemNotifier extends _$MyTotemNotifier {
  @override
  MyTotemState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _timer = null;
    });
    _init();
    return MyTotemStateLoading();
  }

  final box = Hive.box('settings');
  Timer? _timer;

  _init() async {
    await Future.delayed(Duration.zero, () {});
    state = MyTotemStateLoading();
    try {
      final totemId = box.get(totemIdKey);
      final name = box.get(nameKey);
      final email = box.get(emailKey);
      final phone = box.get(phoneKey);
      final website = box.get(websiteKey);

      // cifrare il link prima di servirlo
      // https://link.wom.social/connection/CIFRATO

      if (totemId == null) {
        state = MyTotemStateEmpty();
        return;
      }

      _initTimer();
      final link = await _getNewLink(totemId);
      state = MyTotemState.loaded(
        totemId: totemId,
        totemLink: link,
        name: name,
        email: email,
        phone: phone,
        website: website,
      );
    } on ServiceGPSDisabled {
      state = MyTotemStateError(MyTotemError.gpsServiceDisabled);
    } on LocationPermissionDenied {
      state = MyTotemStateError(MyTotemError.missingPermissions);
    } on LocationPermissionDeniedForever {
      state = MyTotemStateError(MyTotemError.missingPermissions);
    } catch (ex, st) {
      state = MyTotemStateError(MyTotemError.generic);
      logger.e('MyTotemNotifier: _init: ', error: ex, stackTrace: st);
    }
  }

  _initTimer() {
    _timer?.cancel();
    _timer =
        Timer.periodic(Duration(seconds: refreshTimeoutInSeconds), (t) async {
      final currentState = state;
      if (currentState is MyTotemStateLoaded) {
        try {
          state = currentState.copyWith(isRefreshing: true);
          final totemLink = await _getNewLink(currentState.totemId);
          state =
              currentState.copyWith(totemLink: totemLink, isRefreshing: false);
        } on ServiceGPSDisabled {
          state = MyTotemStateError(MyTotemError.gpsServiceDisabled);
          t.cancel();
        } on LocationPermissionDenied {
          state = MyTotemStateError(MyTotemError.missingPermissions);
          t.cancel();
        } catch (ex, st) {
          logger.e(
            'MyTotemNotifier: periodic timer: ',
            error: ex,
            stackTrace: st,
          );
          state = MyTotemStateError(MyTotemError.generic);
          t.cancel();
        }
      }
    });
  }

  String _encryptLink(String totemId, int timestamp, Position position) {
    final params =
        '$totemId?timestamp=$timestamp&latitude=${position.latitude}&longitude=${position.longitude}';

    // final encrypted = aesEncrypt(params);
    // final decoded = Uri.encodeComponent(encrypted);

    return '$connectionBaseUrl/v1/$params';
  }

  Future<String> _getNewLink(String totemId) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final position = await ref.refresh(getPositionProvider.future);
    final link = _encryptLink(totemId, now, position);
    logger.i(link);
    return link;
  }

  Future<String> savePersonalTotem({
    required String name,
    String? email,
    String? phone,
    String? website,
  }) async {
    try {
      final totemId = box.get(totemIdKey) as String?;

      // Invoca API cmi per salvare i dati
      final response =
          await ref.read(transactionRepositoryProvider).generatePersonalTotem(
                name: name,
                email: email,
                phone: phone,
                website: website,
                totemId: totemId,
              );

      final id = response.id;

      await box.put(totemIdKey, id);
      await box.put(nameKey, name);
      await box.put(emailKey, email);
      await box.put(phoneKey, phone);
      await box.put(websiteKey, website);

      return id;
    } catch (ex, st) {
      logger.e(
        'MyTotemNotifier: savePersonalTotem',
        error: ex,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
