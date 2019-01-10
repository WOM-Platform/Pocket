import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/voucher_model.dart';
import 'package:pocket/src/screens/accept_credits/accept_credits_bloc.dart';
import 'package:pocket/src/widgets/voucher_card.dart';
import 'package:flutter/material.dart';

class AcceptCredits extends StatefulWidget {
  final String id;

  const AcceptCredits({Key key, this.id}) : super(key: key);

  @override
  AcceptCreditsState createState() {
    return new AcceptCreditsState();
  }
}

class AcceptCreditsState extends State<AcceptCredits>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

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

  @override
  Widget build(BuildContext context) {
    final AcceptCreditsBloc bloc = BlocProvider.of(context);
//    if (widget.id == null) {
//      bloc.scanQRCode();
//    }else{
//      bloc.fetchVoucher(widget.id);
//    }
//
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder<VoucherModel>(
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
            return Center(child: CircularProgressIndicator());
          }

          _controller.forward();
          return AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.translationValues(
                    0.0, _animation.value * (-90), 0.0),
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
                              'Congratulation!',
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Center(child: Text('Hai ottenuto:',style: TextStyle(color: Colors.white,fontSize: 20.0),)),
                        ),
                      ),
                      SizedBox(
                        height: _animation.value * 15.0,
                      ),
                      FadeTransition(
                        opacity: _animation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TicketCard(ticket: snapshot.data),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
