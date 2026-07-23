import 'package:flutter/material.dart';


class ColdAndSpicyIcons extends StatelessWidget {
  const ColdAndSpicyIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
