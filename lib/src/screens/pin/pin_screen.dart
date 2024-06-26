import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wom_pocket/src/application/pin_notifier.dart';
import 'package:wom_pocket/src/application/transaction_notifier.dart';
import 'package:wom_pocket/src/blocs/pin/bloc.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/screens/pin/widgets/code_panel.dart';
import 'package:wom_pocket/src/screens/pin/widgets/keyboard.dart';
import 'package:wom_pocket/src/screens/transaction/transaction_screen.dart';
import 'package:wom_pocket/src/utils/colors.dart';

final deeplinkProvider = Provider<DeepLinkModel>((ref) {
  throw UnimplementedError();
});

class PinScreen extends ConsumerWidget {
  // late PinBloc bloc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    final pinState = ref.watch(pinNotifierProvider);
    final deeplinkModel = ref.watch(deeplinkProvider);
    ref.listen<PinState>(pinNotifierProvider, (previous, next) {
      if (next is PinVerified) {
        goToAcceptCredits(context, next.pin, deeplinkModel);
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

  goToAcceptCredits(
    BuildContext context,
    String password,
    DeepLinkModel deepLinkModel,
  ) {
    logger.i('goToAcceptCredits');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<bool>(
        builder: (context) => TransactionScreen(
          params: TransactionNotifierParams(deepLinkModel, password),
        ),
      ),
    );
  }
}
