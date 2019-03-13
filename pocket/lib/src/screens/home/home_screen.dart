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

class HomeScreen2 extends StatefulWidget {
  static const String path = '/home';

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
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
      backgroundColor: Colors.grey[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
//        backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: goldColor,
        label: const Text(
          'QR-Code',
          style: TextStyle(color: baseIconColor),
        ),
        icon: const Icon(
          Icons.camera_enhance,
          color: baseIconColor,
        ),
        onPressed: () async {
          try {
//            final String link = await showEditField(context);
          final link = "https://wom.social/vouchers/25068c17bc4c444d81643a45820872eb";
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
        color: baseIconColor,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.map,color: goldColor),
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
              icon: Icon(Icons.settings,color: goldColor,),
              onPressed: () async {
                await Navigator.pushNamed(context, '/settings');
                bloc.refreshList();
              },
            ),
          ],
        ),
      ),
//      appBar: AppBar(
//        title: Text(AppLocalizations.of(context).title, style: TextStyle(color: darkBlueColor),),
//        backgroundColor: Colors.transparent,
//        actions: <Widget>[
//          StreamBuilder<int>(
//            stream: bloc.womsCount,
//            builder: (ctx, snap) {
//              if (!snap.hasData) {
//                return CircularProgressIndicator();
//              }
//              return Center(
//                  child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(snap.data.toString()),
//              ));
//            },
//          ),
//        ],
//      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).title,
                    style: TextStyle(
                        color: darkBlueColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  StreamBuilder<int>(
                    stream: bloc.womsCount,
                    builder: (ctx, snap) {
                      if (!snap.hasData) {
                        return CircularProgressIndicator();
                      }
                      return Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        decoration: new BoxDecoration(
                            color: baseIconColor,
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(15.0))),
                        child: Center(
                          child: Text(
                            snap.data.toString(),
                            style:
                                TextStyle(color: goldColor, fontSize: 17.0),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(color: Colors.grey,height: 8.0,),
            ),
            StreamBuilder<List<SuggestionModel>>(
              stream: bloc.suggestions,
              builder: (ctx, snapshot) {
                if (!snapshot.hasData || snapshot.data.length == 0) {
                  return Container();
                }

                return Container(
                  padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                  height: 165.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.map((s) {
                      return GestureDetector(
                        onTap: null,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Stack(
                            children: <Widget>[
                              Card(
                                color: baseIconColor,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 4.0),
                                        child: Text(
                                          s.type.toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[400]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Text(
                                          s.text,
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                right: 0.0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey[300],
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: IconButton(
                                  color: Colors.grey[200],
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey[200],
                                  ),
                                  onPressed: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                AppLocalizations.of(context).lastMovements,
                style: TextStyle(
                    color: darkBlueColor2,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500),
              ),
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

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
