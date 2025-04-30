import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/pin/application/pin_notifier.dart';
import 'package:wom_pocket/src/features/pin/application/pin_state.dart';
import 'package:wom_pocket/src/features/pin/widgets/code_panel.dart';
import 'package:wom_pocket/src/features/pin/widgets/keyboard.dart';
import 'package:wom_pocket/src/features/transaction/application/transaction_notifier.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class PinScreen extends ConsumerWidget {
  // late PinBloc bloc;
  final DeepLinkModel deepLinkModel;

  PinScreen({
    required this.deepLinkModel,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    final pinState = ref.watch(pinNotifierProvider);
    ref.listen<PinState>(pinNotifierProvider, (previous, next) {
      if (next is PinVerified) {
        goToAcceptCredits(context, next.pin);
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryColor, // Status bar
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'pin_title'.tr(),
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'pin_screen.tip'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
          CodePanel(
            codeLength: 4,
            currentLength: pinState.pin.length,
            borderColor: Colors.white,
            foregroundColor: Colors.transparent,
            status: pinState is PinVerified ? 1 : 2,
          ),
          Spacer(),
          Expanded(
            flex: Platform.isIOS ? 5 : 8,
            child: PinKeyboard(),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void goToAcceptCredits(BuildContext context, String password) {
    logger.i('goToAcceptCredits');
    context.go(
      '/transaction',
      extra: TransactionNotifierParams(deepLinkModel, password),
    );
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute<bool>(
    //     builder: (context) => TransactionScreen(
    //       params: TransactionNotifierParams(deepLinkModel, password),
    //     ),
    //   ),
    // );
  }
}
