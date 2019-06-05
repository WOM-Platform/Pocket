//import 'package:flutter/material.dart';
//import 'package:rxdart/rxdart.dart';
//import 'package:pocket/src/blocs/bloc_provider.dart';
//
//class PinBloc extends BlocBase {
//  //Password lenght
//  BehaviorSubject<CodeState> _passwordLenght = BehaviorSubject<CodeState>();
//  Observable<CodeState> get passwordLenght => _passwordLenght.stream;
//
//  //Pin is verified
//  BehaviorSubject<bool> _pinIsVerified = BehaviorSubject<bool>();
//  Observable<bool> get pinIsVerified => _pinIsVerified.stream.debounce((_) => TimerStream(true, const Duration(milliseconds: 100)));
//
//  var _inputCodes = <int>[];
//
//  onCodeClick(int code) {
//    final status = isCorrect(code);
//    _passwordLenght.sink
//        .add(CodeState(n: _inputCodes.length, status: status));
//  }
//
//  setPinIsVerifiedToFalse(){
//    _pinIsVerified.sink.add(false);
//  }
//
//  int isCorrect(int code) {
//    if (_inputCodes.length < 4) {
//      _inputCodes.add(code);
//
//      if (_inputCodes.length == 4) {
//        //if (_inputCodes.join() == "1234") {
//          print("password correct");
//          print(_inputCodes.join().toString());
//          _pinIsVerified.sink.add(true);
//          return 1;
////        } else {
////          return 2;
////        }
//      }
//    }
//    return 0;
//  }
//
//
//  deleteCode() {
//    if (_inputCodes.length > 0) {
//      _inputCodes.removeLast();
//      _passwordLenght.sink.add(CodeState(n: _inputCodes.length));
//    }
//  }
//
//  deleteAllCode() {
//    if (_inputCodes.length > 0) {
//      _inputCodes.clear();
//      _passwordLenght.sink.add(CodeState(n: _inputCodes.length));
//    }
//  }
//
//  String getPin(){
//    return _inputCodes.join().toString();
//  }
//
//  @override
//  void dispose() {
//    _passwordLenght.close();
//    _pinIsVerified.close();
//  }
//}
//
//class CodeState {
//  final int n;
//  final int status;
//
//  CodeState({@required this.n, this.status = 0});
//}
