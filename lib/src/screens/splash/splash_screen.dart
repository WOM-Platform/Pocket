import 'package:auto_size_text/auto_size_text.dart';
import 'package:pocket/src/blocs/app/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

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
  AppBloc bloc;
  AnimationController _controller;
  Animation<double> opacityLogo;

  @override
  void initState() {
    bloc = BlocProvider.of<AppBloc>(context);
    print("splash init");
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    opacityLogo = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("animation complete");
        }
      });
    _controller.forward();

    /*final deepLinkObservable = Observable.fromFuture(bloc.getDeepLink());
    final animationCompleteObservable =
        Observable.fromFuture(_controller.forward().whenComplete(() {}));

    animationCompleteObservable.zipWith<DeepLinkModel, DeepLinkModel>(
        deepLinkObservable, (_, deeplink) {
      return deeplink;
    }).listen((deepLinkModel) {
      if (deepLinkModel != null) {
        //WidgetsBinding.instance
        //        .addPostFrameCallback((_) => afterFirstLayout(context));
        print("SplashScreen: chiamata tramite deeplink" +
            deepLinkModel.toString());
        goToPinScreen(deepLinkModel);
      } else {
        Utils.isFirstOpen().then((isFirstOpen) {
          if (isFirstOpen) {
            Navigator.pushReplacementNamed(context, '/intro');
          } else {
            Navigator.pushReplacementNamed(context, '/home');
          }
        });
      }
    });
*/
    //TODO old method delete in RELEASE
//    bloc.getDeepLink().then((deepLinkModel) {
//      print("SplashScreen: uri data detected");
//      _controller.forward().(() {
//        if (deepLinkModel == null) {
//          Utils.isFirstOpen().then((isFirstOpen) {
//            if (isFirstOpen) {
//              Navigator.pushReplacementNamed(context, '/intro');
//            } else {
//              Navigator.pushReplacementNamed(context, '/home');
//            }
//          });
//        } else {
//          print("SplashScreen: chiamata tramite deeplink" +
//              deepLinkModel.toString());
//          var blocProviderPin = myBlocProvider.BlocProvider(
//            bloc: PinBloc(),
//            child: PinScreen(
//              deepLinkModel: deepLinkModel,
//            ),
//          );
//          Navigator.pushReplacement(
//            context,
//            MaterialPageRoute<bool>(builder: (context) => blocProviderPin),
//          );
//        }
//      });
//    });
  }

/*  goToPinScreen(DeepLinkModel deepLinkModel) {
//    var blocProviderPin = myBlocProvider.BlocProvider(
//      bloc: PinBloc(),
//      child: PinScreen(
//        deepLinkModel: deepLinkModel,
//      ),
//    );
    var blocProviderPin = BlocProvider(
      bloc: PinBloc(deepLinkModel),
      child: PinScreen(),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<bool>(builder: (context) => blocProviderPin),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Opacity(
//              child: Image.asset("assets/images/logo.png"),
              child: AutoSizeText(
                'WOM POCKET',
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              opacity: opacityLogo.value,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print("splash dispose");
    _controller.dispose();
    super.dispose();
  }
}
