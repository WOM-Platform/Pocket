import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/constants.dart';

final pocketProvider = Provider<Pocket>((ref) => Pocket(domain, registryKey));
