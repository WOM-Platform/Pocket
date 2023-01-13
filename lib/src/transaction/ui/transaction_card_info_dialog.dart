import 'package:flutter/material.dart';

class TransactionTypeInfo extends StatelessWidget {
  final String text;
  final String description;
  final IconData iconData;
  final Color color;

  const TransactionTypeInfo({
    Key? key,
    required this.text,
    required this.iconData,
    required this.color,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(description, style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}