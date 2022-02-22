import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import '../../my_logger.dart';
import './bloc.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  final DeepLinkModel deepLinkModel;

  PinBloc(this.deepLinkModel) : super(InitialPinState());

  var _inputCodes = <int>[];

  @override
  Stream<PinState> mapEventToState(
    PinEvent event,
  ) async* {
    if (event is UpdateCode) {
      final status = isCorrect(event.value);
      if (status == 1) {
        yield PinVerified(_inputCodes.join().toString());
      } else {
        yield PinUpdated(_inputCodes.join().toString());
      }
    }
    if (event is DeleteAllCode) {
      _inputCodes.clear();
      yield PinUpdated("");
    }
  }

  int isCorrect(int code) {
    if (_inputCodes.length < 4) {
      _inputCodes.add(code);

      if (_inputCodes.length == 4) {
        //if (_inputCodes.join() == "1234") {
        logger.i("password correct");
        logger.i(_inputCodes.join().toString());

        return 1;
//        } else {
//          return 2;
//        }
      }
    }
    return 0;
  }

  deleteCode() {
    if (_inputCodes.length > 0) {
      _inputCodes.removeLast();
    }
  }
}
