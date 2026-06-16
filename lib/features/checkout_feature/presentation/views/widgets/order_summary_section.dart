import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/price_breakdown_widget_list_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';


class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Order summary',
          color: kIntSecondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        Gap(10),
        PriceBreakdownWidgetListView(),
        Gap(10),
      ],
    );
  }
}
