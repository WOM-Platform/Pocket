import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import './bloc.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  final DeepLinkModel deepLinkModel;

  PinBloc(this.deepLinkModel);

  @override
  PinState get initialState => InitialPinState();

  var _inputCodes = <int>[];

  @override
  Stream<PinState> mapEventToState(
    PinEvent event,
  ) async* {
    if(event is UpdateCode){
      final status = isCorrect(event.value);
      if(status == 1) {
        yield PinVerified(_inputCodes.join().toString());
      }else{
        yield PinUpdated(_inputCodes.join().toString());
      }
    }
    if(event is DeleteAllCode){
      yield PinUpdated("");
    }
  }

  int isCorrect(int code) {
    if (_inputCodes.length < 4) {
      _inputCodes.add(code);

      if (_inputCodes.length == 4) {
        //if (_inputCodes.join() == "1234") {
        print("password correct");
        print(_inputCodes.join().toString());

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

  deleteAllCode() {
    if (_inputCodes.length > 0) {
      _inputCodes.clear();
    }
  }


}
