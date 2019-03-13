import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/app.dart';
import 'package:pocket/src/blocs/app_bloc.dart';
import 'package:pocket/src/blocs/bloc_provider.dart' as myBlocProvider;
import 'package:flutter/material.dart';
import 'package:pocket/src/screens/pin/pin.dart';
import 'package:pocket/src/screens/pin/pin_bloc.dart';
import 'package:pocket/src/utils/utils.dart';

/*
 adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "wom://pay/910895d04a39438bbe6a7db04c5b1f59"'
 */

/*
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
    super.initState();

    if (fakeData == null) {
      DefaultAssetBundle.of(context)
          .loadString('assets/map_point.json')
          .then((result) {
        fakeData = result;
      });
    }

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    opacityLogo = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("animation complete");
        }
      });

    bloc.getDeepLink().then((deepLinkModel) {
      print("SplashScreen: uri data detected");
      _controller.forward().whenCompleteOrCancel(() {
        if (deepLinkModel == null) {
          Utils.isFirstOpen().then((isFirstOpen) {
            if (isFirstOpen) {
              Navigator.pushReplacementNamed(context, '/intro');
            } else {
              Navigator.pushReplacementNamed(context, '/home');
            }
          });
        } else {
          print("SplashScreen: chiamata tramite deeplink" +
              deepLinkModel.toString());
          var blocProviderPin = myBlocProvider.BlocProvider(
            bloc: PinBloc(),
            child: PinScreen(
              deepLinkModel: deepLinkModel,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<bool>(builder: (context) => blocProviderPin),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    bloc.deep.listen((model) {
//      showPopup(context, model);
//      print(model.toString());
//    }, onError: (err){
//      final homeProvider = BlocProvider(child: HomeScreen(), bloc: HomeBloc());
//      Navigator.pushReplacement(
//        context,
//        MaterialPageRoute<bool>(builder: (context) => homeProvider),
//      );
//    });
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
//          Opacity(
//            opacity: 1 - opacityLogo.value,
//            child: Container(
//              color: Theme.of(context).primaryColor,
//            ),
//          ),
          Center(
            child: Opacity(
              child: Image.asset("assets/images/logo.png"),
              opacity: opacityLogo.value,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
//    bloc.dispose();
    super.dispose();
  }
}
