import 'package:flutter/material.dart';
import 'package:pocket/app.dart';
import 'package:pocket/app_repository.dart';

void main() => runApp(App(
  appRepository: AppRepository(),
));
