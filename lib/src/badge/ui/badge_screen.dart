import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/badge/application/badge_notifier.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(badgeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          appName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: state.when(
        data: (list) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              return BadgeTile();
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          );
        },
        error: (ex, st) {
          return Center();
        },
        loading: () => SizedBox(),
      ),
    );
  }
}

class BadgeTile extends ConsumerWidget {
  const BadgeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.abc_rounded),
          Text('Badge'),
        ],
      ),
    );
  }
}
