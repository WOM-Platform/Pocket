import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart' show Aim;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';


part 'aim_notifier.g.dart';

@Riverpod(keepAlive: true)
MyDatabase getDatabase(GetDatabaseRef ref){
  final d = MyDatabase();
  //
  // onDispose(() {
  //   d.close();
  // });
  return d;
}

// final databaseProvider = Provider((ref) {
//   final d = MyDatabase();
//   ref.onDispose(() {
//     d.close();
//   });
//   return d;
// });

// final aimNotifierProvider =
//     AsyncNotifierProvider<AimNotifier, List<Aim>>(AimNotifier.new);


@Riverpod(keepAlive: true)
class AimNotifier extends _$AimNotifier {
  @override
  FutureOr<List<Aim>> build() async {
    // var aims = await ref.read(aimRepositoryProvider).getFlatAimList();
    // if (aims.isEmpty) {
      var aims = await ref.read(aimRepositoryProvider).updateAim();
    // }
    return aims;
  }
}
