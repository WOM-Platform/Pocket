import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wom_pocket/constants.dart';

class MyErrorWidget extends StatelessWidget {
  final Object? ex;

  const MyErrorWidget({Key? key, this.ex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            'Si è verificato un errore!',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          if (kDebugMode || isDev) Text(ex.toString()),
        ],
      ),
    );
  }
}
