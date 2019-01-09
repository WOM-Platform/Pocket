import 'package:borsellino/localization/localizations.dart';
import 'package:borsellino/src/blocs/bloc_provider.dart';
import 'package:borsellino/src/screens/home/home_bloc.dart';
import 'package:borsellino/src/screens/home/widgets/suggestion_card.dart';
import 'package:borsellino/src/screens/home/widgets/transactions_list.dart';
import 'package:borsellino/src/screens/map/blocs/map_bloc.dart';
import 'package:borsellino/src/screens/map/google_map.dart';
import 'package:borsellino/src/models/deep_link_model.dart';
import 'package:borsellino/src/models/transaction_model.dart';
import 'package:borsellino/src/screens/accept_credits/accept_credits_bloc.dart';
import 'package:borsellino/src/screens/pay_credits/pay.dart';
import 'package:borsellino/src/screens/accept_credits/accept_credits.dart';
import 'package:borsellino/src/screens/settings/settings.dart';
import 'package:borsellino/src/screens/suggestion/suggestion.dart';
import 'package:borsellino/src/utils/color_utils.dart';
import 'package:borsellino/src/widgets/voucher_card.dart';
import 'package:borsellino/src/db/wom_db.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class HomeScreen extends StatelessWidget {
  HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    getLinksStream().listen((String link) {
      Uri _latestUri;
      try {
        if (link != null) {
          _latestUri = Uri.parse(link);
          final deepData =
              DeepLinkModel(link: link ?? 'Unknown', uri: _latestUri);
          final acceptProvider = BlocProvider(
              child: AcceptCredits(),
              bloc: AcceptCreditsBloc(id: deepData.link));
          Navigator.push(
            context,
            MaterialPageRoute<bool>(builder: (context) => acceptProvider),
          ).then((value) {
            bloc.refreshList();
          });

          //TODO refresh DB se sono stati accreditati voucher
        }
      } on FormatException {
        //_deep.addError("Format exception");
      }
    }, onError: (err) {
      //_deep.addError('Failed to get latest link: $err.');
    });

    bloc = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.camera_enhance),
        onPressed: () async {
          var blocProviderScan = BlocProvider(
            bloc: AcceptCreditsBloc(),
            child: AcceptCredits(),
          );
          Navigator.push(
            context,
            MaterialPageRoute<bool>(builder: (context) => blocProviderScan),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.account_circle),
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => PayScreen()));
//              },
//            ),
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).msg),
        backgroundColor: Theme.of(context).primaryColor,
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
                          bloc.removeSuggestion(
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
              'Ultimi movimenti',
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
              transactionType:
                  index.isEven ? TransactionType.EARN : TransactionType.EXPENSE,
              shop: "Parcheggio");
          return TicketCard(
            ticket: transaction,
          );
        },
      ),
    );
  }

  buildLastPayment() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, int index) {
        return Container();
      },
    );
  }

  buildBottomNavBar(context) {
    return BottomNavigationBar(
      currentIndex: 0,
      fixedColor: Colors.yellow,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text('vneklven'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.forward,
          ),
          title: Text('vneklven'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Colors.red,
          ),
          title: Text('vneklven'),
        ),
      ],
    );
  }
}

class BottomTabItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SuggestionModel {
  final String text;
  final String url;

  SuggestionModel({this.text, this.url});
}
