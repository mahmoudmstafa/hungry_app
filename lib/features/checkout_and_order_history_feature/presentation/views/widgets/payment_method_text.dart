import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';


class PaymentMethodText extends StatelessWidget {
  const PaymentMethodText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: CustomText(
        text: 'Payment methods',
        color: kIntSecondaryColor,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
