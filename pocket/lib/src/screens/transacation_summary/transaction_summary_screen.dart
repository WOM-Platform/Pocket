import 'package:pocket/app.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/voucher_model.dart';
import 'package:pocket/src/screens/transacation_summary/transaction_summary_bloc.dart';
import 'package:pocket/src/widgets/voucher_card.dart';
import 'package:flutter/material.dart';

class TransactionSummaryScreen extends StatefulWidget {
  const TransactionSummaryScreen({Key key}) : super(key: key);

  @override
  TransactionSummaryScreenState createState() {
    return new TransactionSummaryScreenState();
  }
}

class TransactionSummaryScreenState extends State<TransactionSummaryScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  TransactionSummaryBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of(context);

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  Future<bool> _onWillPop() {
    return Future(() {
//      Navigator.pushNamedAndRemoveUntil(context,  MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), ModalRoute.withName('/'));
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/'));
      //Navigator.popUntil(context, ModalRoute.withName('/home'));
      true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: StreamBuilder<TransactionModel>(
          stream: bloc.voucher,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleButton(text: 'Error!', color: Colors.red),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    snapshot.error as String,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ));
            }

            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(fakeModeVar ? Colors.yellow : Theme.of(context).primaryColor),
              ));
            }

            _controller.forward();
            return AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      0.0, _animation.value * (-10), 0.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            height: 270.0,
                            width: 270.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                'Congratulations!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 37.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          height: _animation.value * 20.0,
                        ),
                        FadeTransition(
                          opacity: _animation,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Center(
                                child: Text(
                              'You got:',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: _animation.value * 20.0,
                        ),
                        FadeTransition(
                          opacity: _animation,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TicketCard(transaction: snapshot.data),
                          ),
                        ),
                        SizedBox(
                          height: _animation.value * 50.0,
                        ),
                        FadeTransition(
                          opacity: _animation,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 80.0),
                            child: OutlineButton(
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      '/home', ModalRoute.withName('/'));
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CircleButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const CircleButton({Key key, this.text, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 270.0,
        width: 270.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 37.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
