import 'package:flutter/material.dart';

class CustomTextFieldPasswordIcon extends StatelessWidget {
  const CustomTextFieldPasswordIcon({
    super.key,
    required this.obscureText,
    this.onPressed,
    this.iconColor,
  });

  final bool obscureText;
  final VoidCallback? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(right: 20),
      onPressed: onPressed,
      icon: Icon(
        obscureText ? Icons.lock_outline_rounded : Icons.lock_open_outlined,
        size: 26,
        color: iconColor ?? Colors.white,
      ),
    );
  }
}
