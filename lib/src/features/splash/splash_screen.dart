import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:wom_pocket/src/core/my_logger.dart';

/*
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "wom://pay/910895d04a39438bbe6a7db04c5b1f59"'
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://wom.social/payment/15294cdf49c14083b57f75f59915ca55"'
*/
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacityLogo;

  @override
  void initState() {
    logger.i('splash init');
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    opacityLogo = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          logger.i('animation complete');
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SvgPicture.asset('assets/images/wom-pocket-icon.svg'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    logger.i('splash dispose');
    _controller.dispose();
    super.dispose();
  }
}
