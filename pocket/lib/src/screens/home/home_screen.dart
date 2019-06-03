import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/bloc_provider.dart' as myBlocProvider;
import 'package:pocket/src/blocs/suggestions/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pocket/src/models/suggestion_model.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/home/widgets/suggetstions_section.dart';
import 'package:pocket/src/screens/home/widgets/transactions_section.dart';
import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:pocket/src/screens/map/google_map.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/screens/pin/pin.dart';
import 'package:pocket/src/screens/pin/pin_bloc.dart';
import 'package:pocket/src/utils/colors.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen: build');
//    bloc = myBlocProvider.BlocProvider.of<HomeBloc>(context);
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
//            final String link = await showEditField(context);
//          final link = "https://wom.social/vouchers/f6f8fd2a8c424a60aa23f8f444742f13";
//            final link =
//                "https://wom.social/payment/de8eac804f9a477bbf3ba0e111139f2a";

//            final String link = await bloc.scanQRCode();
          try {
            final link = await BarcodeScanner.scan();
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
          } on PlatformException catch (ex) {
            if (ex == BarcodeScanner.CameraAccessDenied) {
              throw Exception(ex);
            } else {
              throw Exception("unknow error");
            }
          } on FormatException {
            throw FormatException(
                "Hai premuto il pulsante back prima di acquisire il dato");
          } catch (ex) {
            throw Exception(ex);
          }

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
              icon: Icon(Icons.map, color: goldColor),
              onPressed: () {
                final mapProvider = myBlocProvider.BlocProvider<GoogleMapBloc>(
//                  child: MapPageView(),
                  child: GoogleMapScreen(),
//                  bloc: GoogleMapBloc(WomDB.get(), bloc.nWoms),
                  bloc: GoogleMapBloc(WomDB.get(), 22),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mapProvider));
              },
            ),
            Expanded(
              child: SizedBox(),
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: goldColor,
              ),
              onPressed: () async {
                await Navigator.pushNamed(context, '/settings');
//                bloc.refreshList();
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
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
//                  StreamBuilder<int>(
//                    stream: bloc.womsCount,
//                    builder: (ctx, snap) {
//                      if (!snap.hasData) {
//                        return CircularProgressIndicator();
//                      }
//                      return Container(
//                        margin: const EdgeInsets.all(5.0),
//                        padding: const EdgeInsets.all(5.0),
//                        decoration: new BoxDecoration(
//                            color: baseIconColor,
//                            borderRadius: new BorderRadius.all(
//                                const Radius.circular(15.0))),
//                        child: Center(
//                          child: Text(
//                            snap.data.toString(),
//                            style: TextStyle(color: goldColor, fontSize: 17.0),
//                          ),
//                        ),
//                      );
//                    },
//                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: Colors.grey,
                height: 8.0,
              ),
            ),
            SuggestionsSection(),
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
              child: TransactionsList2(),
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
//    _sub.cancel();
    super.dispose();
  }
}
