import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';

import 'package:wom_pocket/src/features/transaction/application/transaction_state.dart';
import 'package:wom_pocket/src/core/application/transactions_list/transactions_notifier.dart';
import 'package:wom_pocket/src/features/map/application/bloc.dart';
import 'package:wom_pocket/src/core/ui/widgets/voucher_card.dart';
import 'package:wom_pocket/src/features/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/features/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/features/root/widgets/wom_stats_widget.dart';
import 'package:wom_pocket/src/features/transaction/application/transaction_notifier.dart';
import 'package:wom_pocket/src/features/transaction/ui/info_payment.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  final TransactionNotifierParams params;

  const TransactionScreen({
    required this.params,
    Key? key,
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

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void backToHome() {
    refreshHome();
    context.go('/');
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
      child: PopScope(
        onPopInvokedWithResult: (_, __) {
          refreshHome();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Builder(
            builder: (BuildContext context) {
              return state.when(
                data: (state) {
                  if (state is TransactionNoDataConnectionState) {
                    return TransactionWarningWidget(
                      title: 'no_connection_title'.tr(),
                      desc: 'no_connection_transaction_desc'.tr(),
                      tryAgain: () {
                        if (state.infoPay == null) {
                          ref
                              .read(
                                transactionNotifierProvider(widget.params)
                                    .notifier,
                              )
                              .refresh();
                        } else {
                          ref
                              .read(
                                transactionNotifierProvider(widget.params)
                                    .notifier,
                              )
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
                      ),
                    );
                  } else if (state is TransactionErrorState) {
                    return TransactionErrorWidget(
                      errorKey: state.translationKey,
                      message: state.translationKey != null
                          ? state.translationKey!.tr()
                          : state.error,
                      tryAgain: () {
                        ref
                            .read(
                              transactionNotifierProvider(widget.params)
                                  .notifier,
                            )
                            .refresh();
                      },
                      backToHome: backToHome,
                    );
                  } else if (state is TransactionMissingLocationState) {
                    return TransactionWarningWidget(
                      title: 'missing_location_error'.tr(),
                      desc: 'missing_location_error_desc'.tr(),
                      tryAgain: () {
                        ref
                            .read(
                              transactionNotifierProvider(widget.params)
                                  .notifier,
                            )
                            .refresh();
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
                            0.0,
                            _animation.value * (-10),
                            0.0,
                          ),
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
                                  child: RiveAnimation.asset(
                                    'assets/flare/check.riv',
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    // animation: 'success',
                                  ),
                                ),
                                SizedBox(
                                  height: _animation.value * 5.0,
                                ),
                                FadeTransition(
                                  opacity: _animation as Animation<double>,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        getMessage(state.transaction.type),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
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
                                      horizontal: 10.0,
                                    ),
                                    child: TicketCard(
                                      transaction: state.transaction,
                                    ),
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
                                          Utils.launchURL(url);
                                        }
                                        backToHome();
                                      },
                                      label: Text(
                                        '${state.transaction.type == TransactionType.PAYMENT && url != null ? 'Continue' : 'Ok'}',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is TransactionLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GenericError();
                },
                error: (err, st) {
                  return GenericError();
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  String getMessage(TransactionType type) {
    return switch (type) {
      TransactionType.VOUCHERS => '${'you_got'.tr()}:',
      TransactionType.PAYMENT => 'payment_completed'.tr(),
      TransactionType.MIGRATION_IMPORT => '',
      TransactionType.MIGRATION_EXPORT => '',
      TransactionType.EXCHANGE_EXPORT => '',
      TransactionType.EXCHANGE_IMPORT => 'import_exchange_completed'.tr(),
    };
  }
}

class GenericError extends StatelessWidget {
  const GenericError({super.key});

  @override
  Widget build(BuildContext context) {
    return TransactionErrorWidget(
      message: 'somethings_wrong'.tr(),
      backToHome: () {
        context.maybePop();
      },
    );
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
  final String message;
  final String? errorKey;
  final Function()? backToHome;
  final Function()? tryAgain;

  const TransactionErrorWidget({
    required this.message,
    Key? key,
    this.backToHome,
    this.tryAgain,
    this.errorKey,
  }) : super(key: key);

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
              message,
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            if (errorKey == 'wrong_password') ...[
              SizedBox(height: 8.0),
              Text(
                'wrong_password_tip'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            ],
            SizedBox(height: 32.0),
            if (errorKey == 'request_timeout_exception' &&
                tryAgain != null) ...[
              TextButton(
                onPressed: backToHome,
                child: Text(
                  'cancel'.tr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: tryAgain,
                label: Text(
                  'transaction_screen.try_again'.tr(),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ] else
              FloatingActionButton.extended(
                onPressed: backToHome,
                label: Text(
                  'cancel'.tr(),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
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

  const TransactionWarningWidget({
    required this.title,
    required this.desc,
    Key? key,
    this.tryAgain,
  }) : super(key: key);

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
                fontWeight: FontWeight.bold,
              ),
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
                'try_again'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
