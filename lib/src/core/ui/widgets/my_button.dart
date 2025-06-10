import 'package:flutter/material.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Widget? child;
  final bool isLoading;
  final Color? backgroundColor;

  const MyButton({
    this.text,
    super.key,
    this.onPressed,
    this.child,
    this.backgroundColor,
    this.isLoading = false,
  }) : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      label: child ?? Text(text ?? ''),
      icon: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : null,
    );
  }
}
