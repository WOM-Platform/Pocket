import 'dart:async';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/bloc_provider.dart' as myBlocProvider;
import 'package:pocket/src/models/suggestion_model.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/home/widgets/suggestion_card.dart';
import 'package:pocket/src/screens/home/widgets/transactions_list.dart';
import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:pocket/src/screens/map/google_map.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/screens/pin/pin.dart';
import 'package:pocket/src/screens/pin/pin_bloc.dart';
import 'package:pocket/src/screens/suggestion/suggestion.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:pocket/src/widgets/voucher_card.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;
  StreamSubscription _sub;

  @override
  void initState() {

    _sub = getUriLinksStream().listen((Uri uri) {
      // Use the uri and warn the user, if it is not correct
      print("Stream uri : $uri");
      final deepLinkModel = DeepLinkModel.fromUri(uri);
      var blocProviderPin = myBlocProvider.BlocProvider(
        bloc: PinBloc(),
        child: PinScreen(
          deepLinkModel: deepLinkModel,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute<bool>(builder: (context) => blocProviderPin),
      );
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      print("Stream uri error : $err");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen: build');
    bloc = myBlocProvider.BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.camera_enhance),
        onPressed: () async {
          try {
            final String link = await showEditField(context);
//          final link = "https://wom.social/vouchers/addbefcf2176409b8882e76d878d5f5e";
//            final link =
//                "https://wom.social/payment/de8eac804f9a477bbf3ba0e111139f2a";

            final deepLinkModel = DeepLinkModel.fromUri(Uri.parse(link));

            var blocProviderPin = myBlocProvider.BlocProvider(
              bloc: PinBloc(),
              child: PinScreen(
                deepLinkModel: deepLinkModel,
              ),
            );
            await Navigator.push(
              context,
              MaterialPageRoute<bool>(builder: (context) => blocProviderPin),
            );

//            var blocProviderAcceptCredits = BlocProvider(
//              bloc: AcceptCreditsBloc(deepLinkModel),
//              child: AcceptCredits(),
//            );
//            final result = await Navigator.push(
//              context,
//              MaterialPageRoute<String>(builder: (context) => blocProviderAcceptCredits),
//            );
//            print(result);
            //print("sono tornato");
            //bloc.refreshList();
          } catch (e) {
            print(e.toString());
          }
//          var blocProviderScan = BlocProvider(
//            bloc: AcceptCreditsBloc(),
//            child: AcceptCredits(),
//          );
//          await Navigator.push(
//            context,
//            MaterialPageRoute<bool>(builder: (context) => blocProviderScan),
//          );
//          bloc.refreshList();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                final mapProvider = myBlocProvider.BlocProvider<GoogleMapBloc>(
//                  child: MapPageView(),
                  child: GoogleMapScreen(),
                  bloc: GoogleMapBloc(WomDB.get(), bloc.nWoms),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mapProvider));
              },
            ),
            Expanded(
              child: SizedBox(),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () async {
                await Navigator.pushNamed(context, '/settings');
                bloc.refreshList();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          StreamBuilder<int>(
            stream: bloc.womsCount,
            builder: (ctx, snap) {
              if (!snap.hasData) {
                return CircularProgressIndicator();
              }
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snap.data.toString()),
              ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder<List<SuggestionModel>>(
              stream: bloc.suggestions,
              builder: (ctx, snapshot) {
                if (!snapshot.hasData || snapshot.data.length == 0) {
                  return Container();
                }

                return Container(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.map((s) {
                      return SuggestionCard(
                        suggestionModel: s,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<bool>(
                                builder: (context) => SuggestionScreen()),
                          );
                        },
                        onDeleteCard: () {
                          bloc.removeSuggestionAt(
                              bloc.localSuggestions.indexOf(s));
                        },
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            bloc.localSuggestions.length > 0
                ? Divider(color: Colors.grey)
                : Container(),
            SizedBox(
              height: 10.0,
            ),
            Text(
              AppLocalizations.of(context).lastMovements,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: TransactionsList(bloc: bloc),
            ),
          ],
        ),
      ),
    );
  }

  //TODO delete in release
  Future<String> showEditField(context) async {
    TextEditingController editingController = TextEditingController();
    return await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: TextField(
              controller: editingController,
            ),
            actions: <Widget>[
              FlatButton(
                  child: new Text("GO"),
                  onPressed: () {
                    Navigator.of(context).pop(editingController.text);
                  }),
            ],
          );
        });
  }

  //TODO delete in release
  buildVouchersSection() {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, int index) {
          final transaction = TransactionModel(
              date: DateTime.now(),
              country: "ita",
              size: 100,
              transactionType: index.isEven
                  ? TransactionType.VOUCHERS
                  : TransactionType.PAYMENT,
              source: "Parcheggio",
              aim: "");
          return TicketCard(
            transaction: transaction,
          );
        },
      ),
    );
  }

  //TODO delete in release
  loadJSONpoint(context) async {
    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/map_point.json');
    bloc.extractPointFromJson(data.toString());
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
