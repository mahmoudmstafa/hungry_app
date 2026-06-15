import 'package:flutter/material.dart';


class ColdAndSpicyIcons extends StatelessWidget {
  const ColdAndSpicyIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '🥶',
        ),
        Text(
          '🌶️',
        ),
      ],
    );
  }
}
