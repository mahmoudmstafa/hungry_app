import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';


class CustomAddOrRemoveWidget extends StatelessWidget {
  const CustomAddOrRemoveWidget({
    super.key,
    this.onTap, this.icon,
  });

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
