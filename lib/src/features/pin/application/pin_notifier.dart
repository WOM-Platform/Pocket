import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/pin/application/pin_state.dart';

part 'pin_notifier.g.dart';

@riverpod
class PinNotifier extends _$PinNotifier {
  var _inputCodes = <int>[];

  int isCorrect(int code) {
    if (_inputCodes.length < 4) {
      _inputCodes.add(code);

      if (_inputCodes.length == 4) {
        logger.i('password correct');
        logger.i(_inputCodes.join().toString());

        return 1;
      }
    }
    return 0;
  }

  deleteCode() {
    if (_inputCodes.length > 0) {
      _inputCodes.removeLast();
    }
  }

  @override
  PinState build() {
    return InitialPinState();
  }

  deleteAllCode() {
    _inputCodes.clear();
    state = PinUpdated('');
  }

  updateCode(int pin) {
    final status = isCorrect(pin);
    if (status == 1) {
      state = PinVerified(_inputCodes.join().toString());
    } else {
      state = PinUpdated(_inputCodes.join().toString());
    }
  }
}
