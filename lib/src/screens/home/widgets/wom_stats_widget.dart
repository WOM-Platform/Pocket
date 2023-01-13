import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/services/wom_repository.dart';

final womRepositoryProvider = Provider<WomRepository>((ref) {
  return WomRepository(ref.watch(databaseProvider));
  ;
});

final totalWomCountProvider = FutureProvider<int>((ref) async {
  return ref.watch(womRepositoryProvider).getTotalWomCount();
});

final availableWomCountProvider = FutureProvider<int>((ref) async {
  return ref.watch(womRepositoryProvider).getAvailableWomCount();
});

/*class WomStatsWidget extends ConsumerWidget {
  const WomStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(totalWomCountProvider).asData?.value;
    if(count == null){
      return SizedBox.shrink();
    }
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(16.0,0,16,0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Spacer(),
          Text(
            'Saldo:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: AutoSizeText(
              // '10000000000000 wom',
              '$count wom',
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          *//*Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Wom Totali',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                         const SizedBox(height: 4),
                        Text(
                          count.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // VerticalDivider(),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Wom utilizzabili',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          count.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*//*
        ],
      ),
    );
  }
}*/
