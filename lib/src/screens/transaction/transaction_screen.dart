import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/blocs/app/app_bloc.dart';
import 'package:pocket/src/blocs/transaction/bloc.dart';
import 'package:pocket/src/blocs/transactions_list/transactions_list_event.dart';
import 'package:pocket/src/screens/transaction/info_payment.dart';
import 'package:pocket/src/utils/utils.dart';
import 'package:pocket/src/widgets/voucher_card.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  TransactionScreenState createState() {
    return new TransactionScreenState();
  }
}

class TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late TransactionBloc bloc;

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

  final whiteTextStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    bloc = BlocProvider.of<TransactionBloc>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).primaryColor,
      ),
      child: WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (BuildContext context, TransactionState state) {
              if (state is TransactionLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionNoDataConnectionState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.warning,
                        size: MediaQuery.of(context).size.width / 3,
                        color: Colors.orange,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('no_connection_title'),
                        textAlign: TextAlign.center,
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('no_connection_transaction_desc'),
                        textAlign: TextAlign.center,
                        style: whiteTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          if (state.infoPay == null) {
                            bloc.add(TransactionStarted(state.password));
                          } else {
                            bloc.add(TransactionConfirmPayment(
                                state.infoPay, state.password));
                          }
                        },
                        label: Text(
                          AppLocalizations.of(context)!.translate('try_again'),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is TransactionInfoPaymentState) {
                return Center(
                    child: InfoPayment(
                  responseInfoPay: state.infoPayment,
                  password: state.password,
                ));
              } else if (state is TransactionErrorState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleButton(
                          text:
                              AppLocalizations.of(context)!.translate('error'),
                          color: Colors.red),
                      SizedBox(height: 15.0),
                      Text(
                        state.error,
                        style: whiteTextStyle,
                      ),
                      SizedBox(height: 15.0),
                      FloatingActionButton.extended(
                          onPressed: () {
                            backToHome();
                          },
                          label: Text("Ok")),
                    ],
                  ),
                );
              } else if (state is TransactionMissingLocationState) {
                return MissingLocationWidget(
                  state: state,
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
                              opacity: _animation as Animation<double>,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child:
                                    TicketCard(transaction: state.transaction),
                              ),
                            ),
                            SizedBox(
                              height: _animation.value * 30.0,
                            ),
                            FadeTransition(
                              opacity: _animation as Animation<double>,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 80.0),
                                child: FloatingActionButton.extended(
                                    onPressed: () {
                                      if (state.transaction.transactionType ==
                                              TransactionType.PAYMENT &&
                                          url != null) {
                                        Utils.launchUrl(url);
                                      }
                                      backToHome();
                                    },
                                    label: Text(
                                        '${state.transaction.transactionType == TransactionType.PAYMENT && url != null ? 'Continue' : 'Ok'}')),
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
            },
          ),
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
    BlocProvider.of<AppBloc>(context).transactionsBloc!.add(LoadTransactions());
    Navigator.popUntil(context, ModalRoute.withName('/'));
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

class MissingLocationWidget extends StatefulWidget {
  final TransactionMissingLocationState state;

  const MissingLocationWidget({Key? key, required this.state})
      : super(key: key);

  @override
  _MissingLocationWidgetState createState() => _MissingLocationWidgetState();
}

class _MissingLocationWidgetState extends State<MissingLocationWidget> {
  StreamSubscription<ServiceStatus>? _gpsServiceStream;
  bool _serviceEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.state.exception is ServiceGPSDisabled) {
      _serviceEnabled = false;
      _gpsServiceStream = Geolocator.getServiceStatusStream().listen((status) {
        //XOR
        if (_serviceEnabled ^ (status == ServiceStatus.enabled))
          setState(() {
            _serviceEnabled = status == ServiceStatus.enabled;
          });
      });
    }
  }

  @override
  void dispose() {
    _gpsServiceStream?.cancel();
    super.dispose();
  }

  Future tryAgain() async {
    final event = widget.state.eventToRepeat;
    final exception = widget.state.exception;
    if (exception is ServiceGPSDisabled) {
      await Geolocator.openLocationSettings();
      return;
    } else if (exception is LocationPermissionDenied) {
      final permission = await Geolocator.requestPermission();
      print(permission);
      BlocProvider.of<TransactionBloc>(context, listen: false).add(event);
    } else if (exception is LocationPermissionDeniedForever) {
      await Geolocator.openAppSettings();
      return;
    }
  }

  String failureToWarningText(BuildContext context, exception) {
    if (exception is ServiceGPSDisabled) {
      if (_serviceEnabled) {
        return AppLocalizations.of(context)!
            .translate('gps_service_on_description');
      }
      return AppLocalizations.of(context)!
          .translate('gps_service_off_description');
    } else if (exception is LocationPermissionDenied) {
      return AppLocalizations.of(context)!
          .translate('gps_permission_denied_description');
    } else if (exception is LocationPermissionDeniedForever) {
      return AppLocalizations.of(context)!
          .translate('gps_permission_denied_forever_description');
    }
    return AppLocalizations.of(context)!.translate('missing_location_error');
  }

  String failureToActionText(BuildContext context, exception) {
    if (exception is ServiceGPSDisabled) {
      return AppLocalizations.of(context)!.translate('enable_gps');
    } else if (exception is LocationPermissionDenied) {
      return AppLocalizations.of(context)!.translate('grant_permission');
    } else if (exception is LocationPermissionDeniedForever) {
      return AppLocalizations.of(context)!
          .translate('open_permission_settings');
    }
    return AppLocalizations.of(context)!.translate('try_again');
  }

  @override
  Widget build(BuildContext context) {
    final whiteTextStyle = TextStyle(color: Colors.white);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Spacer(),
            Icon(Icons.warning, color: Colors.orange, size: 120),
            SizedBox(height: 40.0),
            Text(
              failureToWarningText(context, widget.state.exception),
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (!(widget.state.exception is ServiceGPSDisabled &&
                _serviceEnabled) && widget.state.exception is! GetLocationTimeout) ...[
              SizedBox(height: 24.0),
              FloatingActionButton.extended(
                backgroundColor: Colors.green,
                onPressed: tryAgain,
                label: Text(
                  failureToActionText(context, widget.state.exception),
                  style: whiteTextStyle,
                ),
              ),
            ],
            if (widget.state.exception is ServiceGPSDisabled ||
                widget.state.exception is LocationPermissionDeniedForever || widget.state.exception is GetLocationTimeout ) ...[
              const SizedBox(height: 32),
              FloatingActionButton.extended(
                onPressed: () =>
                    BlocProvider.of<TransactionBloc>(context, listen: false)
                        .add(widget.state.eventToRepeat),
                label: Text(
                  AppLocalizations.of(context)!.translate('try_again'),
                ),
              ),
            ],
            const Spacer(),
            Text(
              'La posizione rilevata verrà assegnata ai WOM che ne sono sprovvisti.',
              textAlign: TextAlign.center,
              style: whiteTextStyle,
            ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
