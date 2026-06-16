import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/price_break_down_widget.dart';

import 'estimated_delivery_time.dart';



class TotalAndDeliveryTimeSection extends StatelessWidget {
  const TotalAndDeliveryTimeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Color(
            0xffF0F0F0,
          ),
        ),
        Gap(15),
        PriceBreakdownWidget(
          isTotal: true,
          text: 'Total',
          fontWeightText: FontWeight.bold,
          fontWeightPrice: FontWeight.w700,
        ),
        Gap(20),
        EstimatedDeliveryTime(),
        Gap(50),
      ],
    );
  }
}
