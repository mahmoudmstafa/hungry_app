import 'package:flutter/material.dart';


class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),

      margin: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.redAccent,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
