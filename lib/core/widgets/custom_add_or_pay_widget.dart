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
    this.text,
    this.textColor,
    this.textWeight,
    this.price,
    this.fontSize,
    this.padding,
    this.onTap,
  });

  final String textButton;
  final String? text;
  final int? textColor;
  final FontWeight? textWeight;
  final double? fontSize;

  final int? price;
  final EdgeInsets? padding;

  final VoidCallback? onTap;

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
        padding: const EdgeInsets.only(bottom: 25.0 , top: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.7,
                            end: 1.0,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: CustomText(
                      key: ValueKey<int?>(price),
                      fontFamily: 'ReemKufiInk',
                      text: '\$ $price',
                      color: 0xFFFFFFFF,
                      fontWeight: textWeight,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomButton(
                borderRadius: 20,
                onTap: onTap,
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