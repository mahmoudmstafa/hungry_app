import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/widgets/custom_add_or_pay_widget.dart';

class PayNowSection extends StatelessWidget {
  const PayNowSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAddOrPayWidget(
          textButton: 'Pay Now',
          text: 'Total price',
          textColor: 0xFF9E9E9E,
          textWeight: FontWeight.w400,
          price: 18.19,
          fontSize: 14,
        ),
        Gap(8),
      ],
    );
  }
}
