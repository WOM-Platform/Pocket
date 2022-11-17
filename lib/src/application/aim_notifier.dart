import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart' show Aim;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';

final aimNotifierProvider =
    AsyncNotifierProvider<AimNotifier, List<Aim>>(AimNotifier.new);

class AimNotifier extends AsyncNotifier<List<Aim>> {
  @override
  FutureOr<List<Aim>> build() async {
    var aims = await ref
        .read(aimRepositoryProvider)
        .getFlatAimList(AppDatabase.get().getDb);
    if (aims.isEmpty) {
      aims = await ref
          .read(aimRepositoryProvider)
          .updateAim(AppDatabase.get().getDb);
    }
    return aims;
  }
}
