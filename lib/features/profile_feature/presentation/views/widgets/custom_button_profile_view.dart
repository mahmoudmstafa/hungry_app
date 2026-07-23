import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';

class CustomButtonProfileView extends StatelessWidget {
  const CustomButtonProfileView({
    super.key,
    this.onTap,
    required this.text,
    required this.backgroundColor,
    this.textColor,
    required this.image,
    required this.outBorderColor ,
  });

  final VoidCallback? onTap;

  final String text;
  final Color backgroundColor;
  final Color? textColor;

  final String image;

  final bool outBorderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: outBorderColor ? AppColors.kPrimaryColor : Colors.white,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            Image.asset(
              image,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
