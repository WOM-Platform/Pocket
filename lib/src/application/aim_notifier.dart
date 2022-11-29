import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart' show Aim;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';

final databaseProvider = Provider((ref) {
  final d = MyDatabase();
  ref.onDispose(() {
    d.close();
  });
  return d;
});

final aimNotifierProvider =
    AsyncNotifierProvider<AimNotifier, List<Aim>>(AimNotifier.new);

class AimNotifier extends AsyncNotifier<List<Aim>> {
  @override
  FutureOr<List<Aim>> build() async {
    var aims = await ref.read(aimRepositoryProvider).getFlatAimList();
    if (aims.isEmpty) {
      aims = await ref.read(aimRepositoryProvider).updateAim();
    }
    return aims;
  }
}
