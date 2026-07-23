import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';


class PaymentMethodText extends StatelessWidget {
  const PaymentMethodText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 3.0),
      child: CustomText(
        text: 'Payment methods',
        color: AppColors.kIntSecondaryColor,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
