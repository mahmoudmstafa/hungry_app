import 'package:flutter/material.dart';



class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1 / .90,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              18,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
