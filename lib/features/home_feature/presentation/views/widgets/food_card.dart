import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            Assets.assets.images.smallPurgerPng.path,
          ),
          Gap(8),
          CustomText(
            text: 'Cheeseburger',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: 0xff3C2F2F,
          ),
          CustomText(
            text: "Wendy's Burger",
            fontSize: 16,
            color: 0xff3C2F2F,
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assets.images.star.path,
              ),
              Gap(8),
              CustomText(
                text: '4.9',
                color: kIntSecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
