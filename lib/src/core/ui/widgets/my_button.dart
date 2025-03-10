import 'package:flutter/material.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Widget? child;

  const MyButton({
    this.text,
    super.key,
    this.onPressed,
    this.child,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: child ?? Text(text ?? ''),
    );
  }
}
