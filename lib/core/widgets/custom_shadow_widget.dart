import 'package:flutter/material.dart';


class CustomShadowWidget extends StatelessWidget {
  const CustomShadowWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 9,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
