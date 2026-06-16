import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
class EstimatedDeliveryTime extends StatelessWidget {
  const EstimatedDeliveryTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'Estimated delivery time:',
          fontSize: 15,
          color: kIntSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
        CustomText(
          text: '15 - 30 mins',
          fontSize: 13,
          color: kIntSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
