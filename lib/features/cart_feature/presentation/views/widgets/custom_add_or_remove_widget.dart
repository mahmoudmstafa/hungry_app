import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';



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
        decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          shape: BoxShape.circle,
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
