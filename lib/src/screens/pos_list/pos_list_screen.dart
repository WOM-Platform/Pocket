import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map.dart';
import 'package:wom_pocket/src/screens/suggestion/suggestion.dart';

import '../../../constants.dart';

part 'pos_list_screen.g.dart';

@Riverpod(keepAlive: true)
RegistryClient getRegistryClient(GetRegistryClientRef ref) {
  return RegistryClient(domain);
}

// final registryClientProvider = Provider((ref) => RegistryClient(domain));

// @Riverpod(keepAlive: true)
// List<String> getPosList(GetPosListRef ref)async{
//
// }
//
// final posListProvider = FutureProvider<List<String>>((ref) async {
//   final client = ref.watch(registryClientProvider);
//   // final list =await  client.getPosList();
//   return [];
// });

// final scrollControllerProvider = Provider<ScrollController>((ref) {
//   final c = ScrollController();
//   ref.onDispose(() {
//     c.dispose();
//   });
//   return c;
// });


@Riverpod(keepAlive: true)
Raw<ScrollController> scrollController(ScrollControllerRef ref) {
  final c = ScrollController();
  ref.onDispose(() {
    c.dispose();
  });
  return c;
}

class PosListScreen extends ConsumerWidget {
  final List<POSMap> items;

  final Function(LatLng)? goToLocation;

  const PosListScreen({
    Key? key,
    required this.items,
    this.goToLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);
    return Scaffold(
      body: items.isEmpty
          ? EmptyListWidget(
              goToLocation: goToLocation,
            )
          : NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  if ((notification.scrollDelta?.abs() ?? 0) > 10 &&
                      notification.dragDetails != null)
                    ref.read(showMapListFilterNotifierProvider.notifier).hide();
                }

                if (scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  print('User is going down');
                  ref.read(showMapListFilterNotifierProvider.notifier).hide();
                } else {
                  if (scrollController.position.userScrollDirection ==
                      ScrollDirection.forward) {
                    print('User is going up');
                    ref.read(showMapListFilterNotifierProvider.notifier).show();
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
                              // Utils.launchUrl(items[i].url!);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      SuggestionScreen(url: items[i].url!)));
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

class EmptyListWidget extends ConsumerWidget {
  final Function(LatLng)? goToLocation;

  const EmptyListWidget({Key? key, this.goToLocation}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = TextStyle(fontSize: 20, color: Colors.black);
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'In questa pagina trovi la lista dei POS visualizzati sulla mappa.',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Per cercare i POS:',
            style: style,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '- vai sulla mappa,',
            style: style,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
            text: TextSpan(
              style: style,
              children: [
                TextSpan(
                  text: '- premi il pulsante "',
                ),
                TextSpan(
                    text:
                        '${AppLocalizations.of(context)!.translate('search_here')}"',
                    style: style.copyWith(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: '.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Se compaiono POS sulla mappa, puoi tornare in questa pagina per consultarne l\'elenco.',
            style: style.copyWith(fontSize: 16, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Dove siamo:', style: style),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 130,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: InkWell(
                  onTap: () {
                    final l = LatLng(43.725201, 12.635312);
                    ref.read(mapIndexNotifierProvider.notifier).toggle();
                    goToLocation?.call(l);
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/urbino.jpeg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(color: Colors.black.withOpacity(0.3)),
                        Center(
                          child: Text(
                            'Urbino',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Card(
                  child: Container(
                    child: Text('Coming soon'),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              // AspectRatio(
              //   aspectRatio: 4 / 3,
              //   child: Card(
              //     child: Container(
              //       child: Text('Coming soon'),
              //       alignment: Alignment.center,
              //     ),
              //   ),
              // )
            ],
          ),
        )

        // Text(
        //   '🔍​ Premi il pulsante "${AppLocalizations.of(context)!.translate('search_here')}"',
        //   style: style,
        // ),
      ],
    );
  }
}
