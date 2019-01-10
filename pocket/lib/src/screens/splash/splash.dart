import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/screens/accept_credits/accept_credits.dart';
import 'package:pocket/src/screens/accept_credits/accept_credits_bloc.dart';
import 'package:pocket/src/screens/home/home.dart';
import 'package:pocket/src/screens/home/home_bloc.dart';
import 'package:pocket/src/screens/intro/intro.dart';
import 'package:pocket/src/screens/splash/splash_bloc.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:flutter/material.dart';

/*
 adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "wom://transfer/path/portion/?uid=123&token=abc"'
 */

/*
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "unilinks://example.com/?arr%5b%5d=123&arr%5b%5d=abc&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82"'
*/

/*
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://wom.social/transfer/subpath"'
*/
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  SplashBloc bloc;

  AnimationController _controller;
  Animation<double> opacityLogo;

//  bool _visible = false;

  @override
  void initState() {
    super.initState();
    bloc = SplashBloc();

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

    bloc.getUriData().then((deepData) {
      print("uri data detected");
      _controller.forward().whenCompleteOrCancel(() {
        if (deepData == null) {
//          final homeProvider = BlocProvider(
//              child: HomeScreen(), bloc: HomeBloc(TransactionDB.get()));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<bool>(builder: (context) => IntroScreen()),
          );
        } else {
          print(deepData.toString());
          showPopup(deepData);
          final acceptProvider =
          BlocProvider(child: AcceptCredits(), bloc: AcceptCreditsBloc(id: deepData.link));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<bool>(builder: (context) => acceptProvider),
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
//      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 1 - opacityLogo.value,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
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

  showPopup(DeepLinkModel model) async {
    final queryParams = model.uri?.queryParametersAll?.entries?.toList();
    showModalBottomSheet<void>(
      builder: (BuildContext ctx) {
        return new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Vai avanti!'),
              onTap: () {
                final acceptProvider = BlocProvider(
                    child: AcceptCredits(),
                    bloc: AcceptCreditsBloc(id: model.link));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<bool>(builder: (context) => acceptProvider),
                );
              },
            ),
            new ListTile(
              leading: new Icon(Icons.music_note),
              title: new Text(model.link),
              onTap: null,
            ),
            new ExpansionTile(
              initiallyExpanded: true,
              title: const Text('Query params'),
              children: queryParams?.map((item) {
                    return new ListTile(
                      title: new Text('${item.key}'),
                      trailing: new Text('${item.value?.join(', ')}'),
                    );
                  })?.toList() ??
                  <Widget>[
                    new ListTile(
                      dense: true,
                      title: const Text('null'),
                    ),
                  ],
            ),
          ],
        );
      },
      context: context,
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
