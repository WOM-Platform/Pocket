import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class IntroScreen extends HookConsumerWidget {
  final bool fromSettings;
  final TextStyle whiteTextStyle = TextStyle(color: Colors.white);
  final TextStyle descStyle = TextStyle(color: Colors.white);

  IntroScreen({this.fromSettings = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPage = useState(0);
    final pages = [
      IntroPage(
        backGroundColor: lightBackground,
        //TODO mettere in bold W O M di Worth One Minute
        message: AppLocalizations.of(context)!.translate('introDesc1'),
        title: AppLocalizations.of(context)!.translate('introTitle1'),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/wom-pocket-icon.svg',
            // height: 285.0,
            width: MediaQuery.of(context).size.width - 48,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      IntroPage(
        backGroundColor: darkBackground,
        message: AppLocalizations.of(context)!.translate('introDesc2'),
        textColor: Colors.white,
        title: AppLocalizations.of(context)!.translate('introTitle2'),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Image.asset(
            'assets/images/logo_1.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      IntroPage(
          textColor: Colors.white,
          backGroundColor: Colors.orange,
          message: AppLocalizations.of(context)!.translate('introDesc3'),
          title: AppLocalizations.of(context)!.translate('introTitle3'),
          child: Image.asset(
            IMAGE_PATH_INTRO_1,
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          )),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: const Color(0xFF8BC34A),
        message: AppLocalizations.of(context)!.translate('introDesc4'),
        title: AppLocalizations.of(context)!.translate('introTitle4'),
        child: Image.asset(
          IMAGE_PATH_INTRO_2,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: primaryColor,
        message: AppLocalizations.of(context)!.translate('introDesc5'),
        title: AppLocalizations.of(context)!.translate('introTitle5'),
        child: Image.asset(
          IMAGE_PATH_INTRO_3,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: Colors.red,
        message: AppLocalizations.of(context)!.translate('introDesc6'),
        title: AppLocalizations.of(context)!.translate('introTitle6'),
        child: Icon(
          Icons.warning,
          color: Colors.white,
          size: 200,
        ),
      ),
    ];

    return Stack(
      children: [
        Positioned.fill(
          child: PageView(
            children: pages,
            onPageChanged: (page) {
              selectedPage.value = page;
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 80,
            child: Consumer(
              builder: (context, ref, child) {
                return DotsIndicator(
                  decorator: DotsDecorator(color: lightBlue),
                  position: selectedPage.value.toDouble(),
                  dotsCount: pages.length,
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 80,
            child: selectedPage.value == pages.length - 1
                ? TextButton(
                    onPressed: () {
                      if (fromSettings) {
                        Navigator.of(context).pop();
                      } else {
                        ref
                            .read(appNotifierProvider.notifier)
                            .goIntoNormalMode();
                      }
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
    /* return Builder(
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
    ); */ //Material App
  }
}

class IntroPage extends StatelessWidget {
  final String title;
  final Color? backGroundColor;
  final String message;
  final Widget child;
  final Color? textColor;

  const IntroPage({
    Key? key,
    required this.backGroundColor,
    required this.title,
    required this.message,
    this.textColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: backGroundColor ?? Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    color: textColor ?? secondaryColor,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: child,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
