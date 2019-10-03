import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/localization/app_localizations.dart';
import 'package:pocket/src/models/response_info_pay.dart';
import 'package:pocket/src/blocs/transaction/bloc.dart';
import 'package:pocket/src/utils/colors.dart';
import 'package:wom_package/wom_package.dart' show SimpleFilters;

class InfoPayment extends StatelessWidget {
  final ResponseInfoPay responseInfoPay;

  const InfoPayment(this.responseInfoPay, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionBloc bloc = BlocProvider.of<TransactionBloc>(context);

    final SimpleFilters simpleFilters = responseInfoPay.simpleFilter;

    final greyStyle = TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15.0);

    final valueStyle = TextStyle(
        color: darkPrimaryColor, fontWeight: FontWeight.w600, fontSize: 17.0);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('info_payment'),
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                ],
              ),
              Divider(
                height: 20.0,
                indent: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).translate('merchant'),
                          style: greyStyle,
                        ),
                        Text(
                          responseInfoPay.posName,
                          style: valueStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).translate('amount'),
                          style: greyStyle,
                        ),
                        Text(
                          responseInfoPay?.amount?.toString(),
                          style: valueStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              simpleFilters != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Aim',
                                style: greyStyle,
                              ),
                              Text(
                                simpleFilters?.aimCode ?? "",
                                style: valueStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Bounds',
                                style: greyStyle,
                              ),
                              Text(
                                simpleFilters?.bounds?.toString() ?? "-",
                                style: valueStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'MaxAge',
                                style: greyStyle,
                              ),
                              Text(
                                simpleFilters?.maxAge?.toString() ?? "-",
                                style: valueStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(),
              Divider(
                height: 20.0,
                indent: 10.0,
              ),
              Center(
                child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('confirm_payment'),
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    color: darkPrimaryColor,
                    onPressed: () {
                      bloc.dispatch(TransactionConfirmPayment(responseInfoPay));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
