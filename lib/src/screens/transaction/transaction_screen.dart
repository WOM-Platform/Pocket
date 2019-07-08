import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/app/app_bloc.dart';
import 'package:pocket/src/blocs/transactions_list/transactions_list_event.dart';
import 'package:pocket/src/screens/transaction/info_payment.dart';
import 'package:pocket/src/blocs/transaction/bloc.dart';

import 'package:pocket/src/widgets/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/models/deep_link_model.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key key}) : super(key: key);

  @override
  TransactionScreenState createState() {
    return new TransactionScreenState();
  }
}

class TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  TransactionBloc bloc;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  Future<bool> _onWillPop() {
    backToHome();
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    bloc = BlocProvider.of<TransactionBloc>(context);
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocBuilder<TransactionEvent, TransactionState>(
          bloc: bloc,
          builder: (BuildContext context, TransactionState state) {
            if (state is TransactionLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TransactionInfoPaymentState) {
              return Center(child: InfoPayment(state.infoPayment));
            }

            if (state is TransactionErrorState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleButton(text: 'Error!', color: Colors.red),
                    SizedBox(height: 15.0),
                    Text(
                      state.error,
                      style: TextStyle(color: Colors.white),
                    ),
                    FloatingActionButton.extended(
                        onPressed: () {
                          backToHome();
                        },
                        label: Text("OK")),
//                    OutlineButton(
//                        child: Text(
//                          'OK',
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          backToHome();
//                        }),
                  ],
                ),
              );
            }

            if (state is TransactionCompleteState) {
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
                          Container(
                            height: height/3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
//                                  child: Center(
//                                    child: Text(
//                                      'Congratulations!',
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                        fontSize: 37.0,
//                                        fontWeight: FontWeight.bold,
//                                      ),
//                                    ),
//                                  ),
                            child: FlareActor(
                              "assets/flare/check.flr",
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              animation: 'success',
                            ),
                          ),
                          SizedBox(
                            height: _animation.value * 5.0,
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Center(
                                  child: Text(
                                state.transaction.transactionType ==
                                        TransactionType.VOUCHERS
                                    ? 'You got:'
                                    : 'Payment Completed',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: _animation.value * 10.0,
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TicketCard(transaction: state.transaction),
                            ),
                          ),
                          SizedBox(
                            height: _animation.value * 30.0,
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 80.0),
//                              child: OutlineButton(
//                                child: Text(
//                                  'OK',
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                                onPressed: () {
//                                  backToHome();
//                                },
//                              ),
                              child: FloatingActionButton.extended(
                                  onPressed: () {
                                    backToHome();
                                  },
                                  label: Text("OK")),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container(
              color: Colors.red,
              child: Text("ERROR STATE"),
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

  void backToHome() {
    BlocProvider.of<AppBloc>(context)
        .transactionsBloc
        .dispatch(LoadTransactions());
    Navigator.popUntil(context, ModalRoute.withName('/'));
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
