import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionTitle extends ConsumerWidget {
  final Function()? onTap;
  final String? text;
  final String title;
  final double leftPadding;

  const SectionTitle({
    Key? key,
    required this.title,
    this.onTap,
    this.text,
    this.leftPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (text != null)
            TextButton(
              onPressed: () {
                onTap?.call();
              },
              child: Text(text!),
            )
        ],
      ),
    );
  }
}
