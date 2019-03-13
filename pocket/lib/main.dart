import 'package:flutter/material.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/services/app_repository.dart';

void main() => runApp(App(
  appRepository: AppRepository(),
));
