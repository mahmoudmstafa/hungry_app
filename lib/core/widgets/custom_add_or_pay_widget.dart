import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';

import '../../generated/assets.dart';

class CustomAddOrPayWidget extends StatelessWidget {
  const CustomAddOrPayWidget({
    super.key,
    required this.textButton,
    required this.text,
    this.textColor,
    this.textWeight,
    this.price,
    this.fontSize,
  });

  final String textButton;

  final String text;

  final int? textColor;

  final FontWeight? textWeight;

  final double? price, fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            height: 55,
            text: textButton,
            backgroundColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
