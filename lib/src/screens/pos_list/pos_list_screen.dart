import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import '../../../constants.dart';

final registryClientProvider = Provider((ref) => RegistryClient(domain));

final posListProvider = FutureProvider<List<String>>((ref) async {
  final client = ref.watch(registryClientProvider);
  // final list =await  client.getPosList();
  return [];
});

final scrollControllerProvider = Provider<ScrollController>((ref) {
  final c = ScrollController();
  ref.onDispose(() {
    c.dispose();
  });
  return c;
});

class PosListScreen extends ConsumerWidget {
  final List<POSMap> items;

  const PosListScreen(this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final posAsync = ref.watch(posListProvider);
    final scrollController = ref.watch(scrollControllerProvider);
    return Scaffold(
      // appBar: AppBar(actions: [ IconButton(
      //     icon: Icon(Icons.map),
      //     color: Colors.white,
      //     onPressed: () {
      //       Navigator.of(context).push(
      //           MaterialPageRoute(builder: (_) => PosMapScreen()));
      //     }),
      // ],),
      body: items.isEmpty
          ? Center(
              child: Text('Non ci sono POS in quest\'area'),
            )
          : NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  if ((notification.scrollDelta?.abs() ?? 0) > 10 &&
                      notification.dragDetails != null) print('updateeeeeeeee');
                  ref.read(showMapListFilterProvider.notifier).state = false;
                }

                if (scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  print('User is going down');
                  ref.read(showMapListFilterProvider.notifier).state = false;
                } else {
                  if (scrollController.position.userScrollDirection ==
                      ScrollDirection.forward) {
                    print('User is going up');
                    ref.read(showMapListFilterProvider.notifier).state = true;
                  }
                }
                return false;
              },
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(8, 32, 8, 16),
                itemCount: items.length,
                itemBuilder: (c, i) => Card(
                  child: ListTile(
                    title: Text(
                      items[i].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: items[i].url != null
                        ? IconButton(
                            icon: Icon(Icons.open_in_new),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              Utils.launchUrl(items[i].url!);
                            })
                        : null,
                    subtitle: items[i].url != null
                        ? Text(
                            items[i].url!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : null,
                  ),
                ),
              ),
            ),
    );
  }
}
