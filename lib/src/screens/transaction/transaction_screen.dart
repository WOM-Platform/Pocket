import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/transaction_notifier.dart';
import 'package:wom_pocket/src/application/transactions_notifier.dart';
import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/blocs/transaction/bloc.dart';
import 'package:wom_pocket/src/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/screens/home/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/screens/transaction/info_payment.dart';
import 'package:wom_pocket/src/utils/utils.dart';
import 'package:wom_pocket/src/widgets/voucher_card.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  final TransactionNotifierParams params;

  const TransactionScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  TransactionScreenState createState() {
    return new TransactionScreenState();
  }
}

class TransactionScreenState extends ConsumerState<TransactionScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  // late TransactionBloc bloc;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    backToHome();
    return Future.value(false);
  }

  void backToHome() {
    // BlocProvider.of<AppBloc>(context).transactionsBloc!.add(LoadTransactions());
    refreshHome();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  refreshHome() {
    ref.invalidate(fetchTransactionsProvider);
    ref.invalidate(availableWomCountProvider);
    ref.invalidate(mapNotifierProvider);
    ref.invalidate(totalWomCountProvider);
    ref.invalidate(fetchAimInPercentageProvider);
    ref.invalidate(fetchWomCountEarnedInTheLastWeekProvider);
    ref.invalidate(fetchWomCountSpentInTheLastWeekProvider);
    ref.invalidate(getExchangeTransactionsProvider);
    ref.invalidate(exchangeNotifierProvider);
  }

  final whiteTextStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final state = ref.watch(transactionNotifierProvider(widget.params));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).primaryColor,
      ),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Builder(
            builder: (BuildContext context) {
              return state.when(data: (state) {
                if (state is TransactionNoDataConnectionState) {
                  return TransactionWarningWidget(
                    title: AppLocalizations.of(context)!
                        .translate('no_connection_title'),
                    desc: AppLocalizations.of(context)!
                        .translate('no_connection_transaction_desc'),
                    tryAgain: () {
                      if (state.infoPay == null) {
                        ref.invalidate(
                            transactionNotifierProvider(widget.params));
                      } else {
                        ref
                            .read(transactionNotifierProvider(widget.params)
                                .notifier)
                            .confirmPayment(state.infoPay!);
                      }
                    },
                  );
                } else if (state is TransactionInfoPaymentState) {
                  return Center(
                      child: InfoPayment(
                    params: widget.params,
                    responseInfoPay: state.infoPayment,
                    password: state.password,
                  ));
                } else if (state is TransactionErrorState) {
                  return TransactionErrorWidget(
                    error: state.translationKey != null
                        ? AppLocalizations.of(context)!
                            .translate(state.translationKey!)
                        : state.error,
                    backToHome: () => backToHome(),
                  );
                } else if (state is TransactionMissingLocationState) {
                  return TransactionWarningWidget(
                    title: AppLocalizations.of(context)!
                        .translate('missing_location_error'),
                    desc: AppLocalizations.of(context)!
                        .translate('missing_location_error_desc'),
                    tryAgain: () {
                      ref.invalidate(
                          transactionNotifierProvider(widget.params));
                    },
                  );
                } else if (state is TransactionCompleteState) {
                  _controller.forward();
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      final url = state.transaction.ackUrl;
                      return Transform(
                        transform: Matrix4.translationValues(
                            0.0, _animation.value * (-10), 0.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: height / 3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
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
                                opacity: _animation as Animation<double>,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Center(
                                    child: Text(
                                      getMessage(state.transaction.type),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _animation.value * 10.0,
                              ),
                              FadeTransition(
                                opacity: _animation as Animation<double>,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TicketCard(
                                      transaction: state.transaction),
                                ),
                              ),
                              SizedBox(
                                height: _animation.value * 30.0,
                              ),
                              FadeTransition(
                                opacity: _animation as Animation<double>,
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 80.0),
                                  child: FloatingActionButton.extended(
                                      onPressed: () {
                                        if (state.transaction.type ==
                                                TransactionType.PAYMENT &&
                                            url != null) {
                                          Utils.launchUri(url);
                                        }
                                        backToHome();
                                      },
                                      label: Text(
                                          '${state.transaction.type == TransactionType.PAYMENT && url != null ? 'Continue' : 'Ok'}')),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate('somethings_wrong'),
                    style: whiteTextStyle,
                  ),
                );
              }, error: (err, st) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate('somethings_wrong'),
                    style: whiteTextStyle,
                  ),
                );
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
            },
          ),
        ),
      ),
    );
  }

  String getMessage(TransactionType type) {
    return switch (type) {
      TransactionType.VOUCHERS =>
        '${AppLocalizations.of(context)!.translate('you_got')}:',
      TransactionType.PAYMENT =>
        AppLocalizations.of(context)!.translate('payment_completed'),
      TransactionType.MIGRATION_IMPORT => '',
      TransactionType.MIGRATION_EXPORT => '',
      TransactionType.EXCHANGE_EXPORT => '',
      TransactionType.EXCHANGE_IMPORT => AppLocalizations.of(context)!.translate('import_exchange_completed'),
    };
  }
}

class CircleButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Color? color;

  const CircleButton({Key? key, this.text, this.onTap, this.color})
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
            text!,
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

class TransactionErrorWidget extends StatelessWidget {
  final String error;
  final Function()? backToHome;

  const TransactionErrorWidget({Key? key, required this.error, this.backToHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error,
              size: MediaQuery.of(context).size.width / 3,
              color: Colors.red,
            ),
            SizedBox(height: 16.0),
            Text(
              error,
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            FloatingActionButton.extended(
                onPressed: () {
                  backToHome?.call();
                },
                label: Text("Ok")),
          ],
        ),
      ),
    );
  }
}

class TransactionWarningWidget extends StatelessWidget {
  final Function()? tryAgain;
  final String title;
  final String desc;

  const TransactionWarningWidget(
      {Key? key, this.tryAgain, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.warning, color: Colors.orange, size: 120),
            SizedBox(height: 40.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 24.0),
            FloatingActionButton.extended(
                onPressed: () {
                  tryAgain?.call();
                },
                label: Text(
                  AppLocalizations.of(context)!.translate('try_again'),
                )),
          ],
        ),
      ),
    );
  }
}
