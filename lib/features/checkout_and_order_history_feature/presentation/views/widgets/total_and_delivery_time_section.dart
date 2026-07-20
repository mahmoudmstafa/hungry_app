import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/total_widget.dart';

import '../../../../../core/widgets/custom_text.dart';
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
        TotalWidget(),
        Gap(20),
        EstimatedDeliveryTime(),
        Gap(50),
      ],
    );
  }
}

