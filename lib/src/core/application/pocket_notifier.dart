import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/constants.dart';

part 'pocket_notifier.g.dart';

@Riverpod(keepAlive: true)
Pocket pocket(Ref ref) {
  return Pocket(domain, registryKey);
}
