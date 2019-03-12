import 'package:pocket/constants.dart';
import 'package:pocket/localization/localizations.dart';
import 'package:pocket/src/screens/home/home.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroScreen extends StatelessWidget {
  final TextStyle whiteTextStyle = TextStyle(color: Colors.white);
  final TextStyle descStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageViewModel(
          pageColor: Colors.grey,
          body: Text(
            AppLocalizations.of(context).introDesc1,
          ),
          title: Text(
            AppLocalizations.of(context).introTitle1,
          ),
          mainImage: Image.asset(
            IMAGE_PATH_INTRO_1,
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          )),
      PageViewModel(
        pageColor: const Color(0xFF8BC34A),
        body: Text(
          AppLocalizations.of(context).introDesc2,
        ),
        title: Text(AppLocalizations.of(context).introTitle2),
        mainImage: Image.asset(
          IMAGE_PATH_INTRO_2,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      PageViewModel(
        pageColor: primaryColor,
        body: Text(
          AppLocalizations.of(context).introDesc3,
        ),
        title: Text(AppLocalizations.of(context).introTitle3),
        mainImage: Image.asset(
          IMAGE_PATH_INTRO_3,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
    ];

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (ctx) => IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.pushReplacementNamed(context, HomeScreen.path);
              },
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              doneText: Text(AppLocalizations.of(context).introDoneText),
              skipText: Text(AppLocalizations.of(context).introSkipText),
            ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
