import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import 'favourite_button.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 10),
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
            SizedBox(
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 5,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: SvgPicture.asset(
                        Assets.assets.images.shadow.path,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Image.asset(
                      Assets.assets.images.smallPurgerPng.path,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.assets.images.star.path,
                          ),
                          Gap(5),
                          CustomText(
                            text: '4.9',
                            color: kIntSecondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      FavouriteButton(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
