import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/blocs/app/app_bloc.dart';
import 'package:wom_pocket/src/blocs/app/app_event.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class IntroScreen extends ConsumerWidget {
  final bool fromSettings;
  final TextStyle whiteTextStyle = TextStyle(color: Colors.white);
  final TextStyle descStyle = TextStyle(color: Colors.white);

  IntroScreen({this.fromSettings = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appBloc = BlocProvider.of<AppBloc>(context);
    final pages = [
      PageViewModel(
        pageColor: Colors.white,
        //TODO mettere in bold W O M di Worth One Minute
        body: Text(
          AppLocalizations.of(context)!.translate('introDesc1'),
          style: TextStyle(color: primaryColor),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            AppLocalizations.of(context)!.translate('introTitle1'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        mainImage: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/wom-pocket-icon.svg',
            // height: 285.0,
            width: MediaQuery.of(context).size.width - 48,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      PageViewModel(
        pageColor: primaryColor,
        body: Text(
          AppLocalizations.of(context)!.translate('introDesc2'),
          style: TextStyle(color: Colors.white),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
    AppLocalizations.of(context)!.translate('introTitle2'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        mainImage: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Image.asset(
            'assets/images/logo_1.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      PageViewModel(
          pageColor: Colors.grey,
          body: Text(
            AppLocalizations.of(context)!.translate('introDesc3'),
          ),
          title: Text(
            AppLocalizations.of(context)!.translate('introTitle3'),
          ),
          mainImage: Image.asset(
            IMAGE_PATH_INTRO_1,
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          )),
      PageViewModel(
        pageColor: const Color(0xFF8BC34A),
        body: Text(AppLocalizations.of(context)!.translate('introDesc4'),
        ),
        title: Text(
          AppLocalizations.of(context)!.translate('introTitle4'),
        ),
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
          AppLocalizations.of(context)!.translate('introDesc5'),
        ),
        title: Text(
          AppLocalizations.of(context)!.translate('introTitle5'),
        ),
        mainImage: Image.asset(
          IMAGE_PATH_INTRO_3,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      PageViewModel(
          pageColor: Colors.red,
          body: Text(AppLocalizations.of(context)!.translate('introDesc6'),),
          title: Text(
            AppLocalizations.of(context)!.translate('introTitle6'),
          ),
          mainImage: Icon(
            Icons.warning,
            color: Colors.white,
            size: 200,
          )),
    ];

    return Builder(
      builder: (ctx) => IntroViewsFlutter(
        pages,
        showSkipButton: false,
        onTapDoneButton: () {
          if (fromSettings) {
            Navigator.of(context).pop();
          } else {
            ref.read(appNotifierProvider.notifier).goIntoNormalMode();
          }
        },
        pageButtonTextStyles: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        doneText:
            Text(AppLocalizations.of(context)!.translate('introDoneText')),
        skipText:
            Text(AppLocalizations.of(context)!.translate('introSkipText')),
      ), //IntroViewsFlutter
    ); //Material App
  }
}
