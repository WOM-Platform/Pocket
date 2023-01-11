import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/application/transactions_notifier.dart';
import 'package:wom_pocket/src/blocs/transactions_list/bloc.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/new_home/ui/aim_chart.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/screens/home/widgets/transaction_list.dart';
import 'package:wom_pocket/src/screens/map/map_screen.dart';
import 'package:wom_pocket/src/transaction/ui/transactions_screen.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

import '../../screens/home/widgets/wom_stats_widget.dart';

class NewHome extends ConsumerWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionCountAsync = ref.watch(transactionCountNotifierProvider);
    print(transactionCountAsync);
    return Scaffold(
      appBar: PocketAppBar(),
      // backgroundColor: Color(lightBackground).withOpacity(1),
      /* appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title:
              Text('${flavor == Flavor.DEVELOPMENT ? 'DEV ' : ''}WOM POCKET'),
          // centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          // brightness: Brightness.dark,
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(50),
          //   child: WomStatsWidget(),
          // ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.info),
            //   color: Theme.of(context).colorScheme.secondary,
            //   onPressed: () async {
            //     await _clearTutorial(context);
            //     _showTutorial(context);
            //   },
            // ),
            */
      body: SafeArea(
        child: transactionCountAsync.when(
          data: (count) {
            if (count > 0) {
              return CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   pinned: true,
                  //   backgroundColor: Colors.white,
                  //   title: Row(
                  //     children: [
                  //       Image.asset(
                  //         'assets/images/logo_1.png',
                  //         // fit: BoxFit.fitHeight,
                  //         width: 70,
                  //         // height: lerpDouble(120, 65, progress),
                  //       ),
                  //       Text(
                  //         'POCKET',
                  //         style: Theme.of(context).textTheme.headline5?.copyWith(
                  //               // color: Colors.white,
                  //               color: Theme.of(context).primaryColor,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      // padding: const EdgeInsets.all(16),
                      // color: Theme.of(context).primaryColor,
                      child: Column(
                        children: [
                          // const WomStatsWidget(),
                          // const SizedBox(height: 16),
                          AimChart(
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SectionTitle(
                          title: 'Mappa dei tuoi WOM',
                          leftPadding: 16,
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned.fill(
                                child: MapBody(
                                  enabled: false,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  logEvent('open_wom_map');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: 'Ultime transazioni',
                      text: 'Vedi tutte',
                      leftPadding: 16,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => TransactionsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TransactionsList(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 80,
                    ),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Placeholder(
                      fallbackHeight: 150,
                      fallbackWidth: 150,
                    ),
                  ],
                ),
                Text(
                  'Non hai ancora nessun WOM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Non appena acquisirai un WOM ne sarai molto felice',
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
          error: (ex, st) {
            return Center(
              child: Text(
                'Si è verificato un errore imprevisto!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

/*class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Material(
      elevation: lerpDouble(0, 1.0, progress) ?? 0.0,
      child: Container(
        color: Colors.white,

        // color: Theme.of(context).primaryColor,
        child: Stack(
          fit: StackFit.expand,
          // overflow: Overflow.visible,
          children: [
            // Image.network(
            //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            //   fit: BoxFit.cover,
            // ),
            // AnimatedOpacity(
            //   duration: const Duration(milliseconds: 150),
            //   opacity: progress,
            //   child: ColoredBox(
            //     color: Theme.of(context).primaryColor,
            //   ),
            // ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // padding: EdgeInsets.lerp(
              //   EdgeInsets.fromLTRB(16, 16, 16, 16),
              //   EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //   EdgeInsets.only(bottom: 16),
              // progress,
              // ),
              alignment: Alignment.lerp(
                Alignment.center,
                Alignment.centerLeft,
                progress,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo_1.png',
                    height: lerpDouble(120, 65, progress),
                  ),
                  Text(
                    'POCKET',
                    style: TextStyle.lerp(
                      Theme.of(context).textTheme.headline3?.copyWith(
                            // color: Colors.white,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      Theme.of(context).textTheme.headline6?.copyWith(
                            // color: Colors.white,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      progress,
                    ),
                  ),
                ],
              ),
            ),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 100),
            //   padding: EdgeInsets.lerp(
            //     EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //     EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //     // EdgeInsets.only(bottom: 16),
            //     progress,
            //   ),
            //   alignment: Alignment.lerp(
            //     Alignment.bottomLeft,
            //     Alignment.centerRight,
            //     progress,
            //   ),
            //   child: Consumer(builder: (context, ref, child) {
            //     final count = ref.watch(womStatsProvider).valueOrNull ?? '-';
            //     return Text(
            //       'Saldo: $count',
            //       style: TextStyle.lerp(
            //         Theme.of(context).textTheme.headline5?.copyWith(
            //               color: Theme.of(context).primaryColor,
            //               fontWeight: FontWeight.bold,
            //             ),
            //         Theme.of(context)
            //             .textTheme
            //             .headline6
            //             ?.copyWith(color: Colors.white),
            //         progress,
            //       ),
            //     );
            //   }),
            // ),
            */ /* Center(
              child: Opacity(
                opacity: shrinkOffset / expandedHeight,
                child: Text(
                  "MySliverAppBar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
              ),
            ),*/ /*
            */ /* Positioned(
              top: expandedHeight / 2 - shrinkOffset,
              left: MediaQuery.of(context).size.width / 4,
              child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    height: expandedHeight,
                    width: MediaQuery.of(context).size.width / 2,
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),*/ /*
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}*/
