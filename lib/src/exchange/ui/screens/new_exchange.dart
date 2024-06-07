import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wom_pocket/src/exchange/application/exchange_notifier.dart';
import 'package:wom_pocket/src/exchange/ui/screens/exchange_receipt.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class NewExchangeWidget extends HookConsumerWidget {
  const NewExchangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeState = ref.watch(exchangeNotifierProvider);
    return exchangeState.when(
      error: (ex, st) {
        logger.e(ex);
        return Text(
          ex.toString(),
        );
      },
      loading: () => SizedBox(
        height: 150,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      initial: (dailyAvailableWom, totalAvailableWom) => NewExchange(
        dailyAvailableWom: dailyAvailableWom,
        totalAvailableWom: totalAvailableWom,
      ),
    );
  }
}

class NewExchange extends HookConsumerWidget {
  final int dailyAvailableWom;
  final int totalAvailableWom;

  const NewExchange({
    super.key,
    required this.dailyAvailableWom,
    required this.totalAvailableWom,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wom = useState<int>(min(totalAvailableWom, dailyAvailableWom));

    // if (min(totalAvailableWom, dailyAvailableWom) == 0) {
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Center(
    //       child: Text('Non hai WOM da poter scambiare oggi, torna domani',style: TextS,),
    //     ),
    //   );
    // }
    final maxS = min(totalAvailableWom, dailyAvailableWom).toDouble();
    final minS = min(1, dailyAvailableWom).toDouble();
    print(maxS);
    print(minS);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'donationInfo'.tr(),
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          if (totalAvailableWom == 0)
            Text(
              'noWomToDonate'.tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          else ...[
            Text(
              getMessage(context, 60 - dailyAvailableWom,
                  min(totalAvailableWom, dailyAvailableWom), totalAvailableWom),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (dailyAvailableWom > 0) ...[
              Text('donationSliderTip'.tr()),
              Slider(
                max: maxS,
                min: minS,
                activeColor: primaryColor,
                divisions: dailyAvailableWom - 1,
                label: '${wom.value} WOM',
                value: wom.value.toDouble(),
                onChanged: (value) {
                  wom.value = value.toInt();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NewExchangeScreen(womCount: wom.value),
                    ),
                  );
                },
                child: Text(
                  '${'donate'.tr()} ${wom.value} WOM',
                ),
              ),
            ] else
              Text(
                'noWomToDonateToday'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              )
          ]
        ],
      ),
    );
  }

  getMessage(BuildContext context, int womCount, int womLeft, int womTotal) {
    if(womCount == 0) {
      // The user hasn't donated anything yet today
      if (context.locale.languageCode == 'en') {
        return 'You have $womLeft WOMs available to donate today.';
      } else {
        return 'Ti rimangono $womLeft WOM da donare oggi.';
      }
    }
    else {
      if (context.locale.languageCode == 'en') {
        return 'You have donated $womCount WOMs today, leaving you with $womLeft (out of $womTotal total).';
      } else {
        return 'Oggi hai già donato $womCount WOM, te ne restano $womLeft (su $womTotal totali).';
      }
    }
  }
}
