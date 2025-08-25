import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/splash/application/splash_state.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() {
    _init();
    return SplashStateLoading();
  }

  _init() async {
    final isFirstOpen = await Utils.readIsFirstOpen();
    await Future.delayed(Duration(seconds: 2));
    if (isFirstOpen) {
      state = SplashStateLoaded(route: '/intro');
    } else {
      state = SplashStateLoaded(route: '/');
    }
  }
}
