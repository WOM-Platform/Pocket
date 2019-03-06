import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/suggestion_model.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/home/widgets/suggestion_card.dart';
import 'package:pocket/src/screens/home/widgets/transactions_list.dart';
import 'package:pocket/src/screens/map/blocs/map_bloc.dart';
import 'package:pocket/src/screens/map/google_map.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/screens/pin/pin.dart';
import 'package:pocket/src/screens/pin/pin_bloc.dart';
import 'package:pocket/src/screens/suggestion/suggestion.dart';
import 'package:pocket/src/utils/color_utils.dart';
import 'package:pocket/src/widgets/voucher_card.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String path = '/home';

  HomeBloc bloc;

  loadJSONpoint(context) async {
    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/map_point.json');
    bloc.extractPointFromJson(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen: build');
//    getLinksStream().listen((String link) {
//      Uri _latestUri;
//      try {
//        if (link != null) {
//          _latestUri = Uri.parse(link);
//          final deepData =
//              DeepLinkModel.fromUri(_latestUri);
//          final acceptProvider = BlocProvider(
//              child: AcceptCredits(), bloc: AcceptCreditsBloc(deepData));
//          Navigator.push(
//            context,
//            MaterialPageRoute<bool>(builder: (context) => acceptProvider),
//          ).then((value) {
//            print("return from accept provider " + value.toString());
//            bloc.readTransaction();
//          });
//
//          //TODO refresh DB se sono stati accreditati voucher
//        }
//      } on FormatException {
//        //_deep.addError("Format exception");
//      }
//    }, onError: (err) {
//      //_deep.addError('Failed to get latest link: $err.');
//    });

    bloc = BlocProvider.of(context);
    bloc.context = context;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.camera_enhance),
        onPressed: () async {
          try {


//            final link = "https://wom.social/vouchers/e939d0efba2d4e67a7d8243fe03a8135";
            final link = "https://wom.social/payment/5772ef0a5f004ba1ba1ce3a105f98cb0";
            final deepLinkModel = DeepLinkModel.fromUri(Uri.parse(link));

            var blocProviderPin = BlocProvider(
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
                final mapProvider = BlocProvider(
//                  child: MapPageView(),
                  child: GoogleMapScreen(),
                  bloc: MapBloc(WomDB.get()),
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
          StreamBuilder<int>(stream: bloc.womsCount,builder: (ctx, snap){
            if(!snap.hasData){
              return CircularProgressIndicator();
            }
            return Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snap.data.toString()),
            ));
          },),
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
//            Flexible(
//              child: ListView.builder(
//                  itemCount: 3,
//                  itemBuilder: (ctx, index) {
//                    final TransactionModel ticket = TransactionModel(
//                      date: DateTime(2018, 24 - index, 3 + index),
//                      country: "",
//                      shop: "Merchant",
//                      transactionType: index.isEven
//                          ? TransactionType.PAYMENT
//                          : TransactionType.VOUCHERS,
//                      size: 55,
//                    );
//                    return TicketCard(
//                      ticket: ticket,
//                    );
//                  }),
//            ),
          ],
        ),
      ),
    );
  }

/*  buildSuggestSection() {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SuggestionCard(
            suggestionModel: bloc.suggestions[index],
            deleteCard: () {
              bloc.suggestions.removeAt(index);
              print(suggestions.length.toString());
            },
          );
        },
      ),
    );
  }*/

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
              source: "Parcheggio");
          return TicketCard(
            transaction: transaction,
          );
        },
      ),
    );
  }
}
