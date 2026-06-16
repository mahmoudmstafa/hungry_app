import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class PriceBreakdownWidget extends StatelessWidget {
  const PriceBreakdownWidget({
    super.key,
    required this.text,
    this.isTotal = false,
    this.fontWeightText,
    this.fontWeightPrice,
  });

  final String text;

  final bool isTotal;

  final FontWeight? fontWeightText, fontWeightPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontSize: 18,
          color: isTotal ? kIntSecondaryColor : 0xFF9E9E9E,
          fontWeight: fontWeightText,
        ),
        Row(
          children: [
            Image.asset(
              Assets.assets.images.greyDollar.path,
              color: Color(
                isTotal ? kIntSecondaryColor : 0xff7D7D7D,
              ),
            ),
            CustomText(
              text: '16.48',
              fontSize: 18,
              color: isTotal ? kIntSecondaryColor : 0xff7D7D7D,
              fontWeight: fontWeightText ?? FontWeight.w500,
              fontFamily: 'ReemKufiInk',
            ),
          ],
        ),
      ],
    );
  }
}
