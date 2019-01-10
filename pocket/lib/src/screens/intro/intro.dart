import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/screens/home/home.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroScreen extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: Colors.grey,
        // iconImageAssetPath: 'assets/images/air-hostess.png',
//        bubble: Image.asset('assets/images/team.png'),
        body: Text(
          'Contribuisci ad un sistema affiliato',
        ),
        title: Text(
          'Collabora',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
        mainImage: Image.asset(
          'assets/images/team.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
//      iconImageAssetPath: 'assets/images/best-seller.png',
      body: Text(
        'Potrai accumulare dei WOM ad ogni tuo contributo',
      ),
      title: Text('Accumula'),
      mainImage: Image.asset(
        'assets/images/best-seller.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
//      iconImageAssetPath: 'assets/images/banking.png',
      body: Text(
        'Una volta accumulati potrai memorizzarli nel tuo borsellino...',
      ),
      title: Text('Raccogli'),
      mainImage: Image.asset(
        'assets/images/banking.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: primaryColor,
//      iconImageAssetPath: 'assets/images/store.png',
      body: Text(
        '...e sarà facile spenderli nei negozi che hanno aderito all\'iniziativa',
      ),
      title: Text('Spendi'),
      mainImage: Image.asset(
        'assets/images/store.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (ctx) =>
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                final homeProvider = BlocProvider(
                    child: HomeScreen(), bloc: HomeBloc(TransactionDB.get()));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<bool>(builder: (context) => homeProvider),
                );
              },
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}