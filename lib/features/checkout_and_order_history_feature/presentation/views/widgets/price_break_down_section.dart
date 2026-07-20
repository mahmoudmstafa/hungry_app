import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/cart_feature/domain/entities/cart_item_entity.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entities/order_entity.dart';

class PriceBreakdownSection extends StatelessWidget {
  const PriceBreakdownSection({
    super.key,
    this.fontWeightText,
    this.fontWeightPrice, required this.itemsCount,
  });



  final int itemsCount;
  final FontWeight? fontWeightText, fontWeightPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Order Number',
              fontSize: 18,
              color:  0xFF9E9E9E,
              fontWeight: fontWeightText,
            ),
            CustomText(
              text: itemsCount.toString(),
              fontSize: 18,
              color: 0xff7D7D7D,
              fontWeight: fontWeightText ?? FontWeight.w500,
              fontFamily: 'ReemKufiInk',
            ),
          ],
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Carts',
              fontSize: 18,
              color:  0xFF9E9E9E,
              fontWeight: fontWeightText,
            ),
            CustomText(
              text: itemsCount.toString(),
              fontSize: 18,
              color:  0xff7D7D7D,
              fontWeight: fontWeightText ?? FontWeight.w500,
              fontFamily: 'ReemKufiInk',
            ),
          ],
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Value - Added',
              fontSize: 18,
              color: 0xFF9E9E9E,
              fontWeight: fontWeightText,
            ),
            CustomText(
              text: '\$ 0.0',
              fontSize: 18,
              color:  0xff7D7D7D,
              fontWeight: fontWeightText ?? FontWeight.w500,
              fontFamily: 'ReemKufiInk',
            ),
          ],
        ),
        Gap(10),
      ],
    );
  }
}
