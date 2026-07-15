import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/success_widget.dart';

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
          onTap: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return SuccessWidget();
              },
            );
          },
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          textButton: 'Pay Now',
          text: 'Total price',
          textColor: 0xFF9E9E9E,
          textWeight: FontWeight.w400,
          price: 18,
          fontSize: 14,
        ),
      ],
    );
  }
}
