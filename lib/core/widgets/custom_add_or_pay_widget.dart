import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';

import '../../generated/assets.dart';
import '../utils/app_routes.dart';

class CustomAddOrPayWidget extends StatelessWidget {
  const CustomAddOrPayWidget({
    super.key,
    required this.textButton,
    required this.text,
    this.textColor,
    this.textWeight,
    this.price,
    this.fontSize, this.padding, this.onTap,
  });

  final String textButton;
  final String text;
  final int? textColor;
  final FontWeight? textWeight;
  final double? price, fontSize;

  final EdgeInsets? padding ;

  final VoidCallback? onTap ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  CustomText(
                    text: text,
                    color: textColor ?? kIntSecondaryColor,
                    fontSize: fontSize ?? 18,
                    fontWeight: textWeight ?? FontWeight.bold,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Assets.assets.images.dollar.path,
                      ),
                      CustomText(
                        fontFamily: 'ReemKufiInk',
                        text: ' $price',
                        color: 0xFF000000,
                        fontWeight: textWeight,
                        fontSize: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomButton(
                onTap: onTap ,
                height: 55,
                text: textButton,
                backgroundColor: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}