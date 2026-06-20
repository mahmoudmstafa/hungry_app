import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_back_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/payment_method_with_delivery.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/payment_method_with_debit_card.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/payment_methods_section.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/paynow_section.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/total_and_delivery_time_section.dart';

import '../../../../../core/widgets/custom_add_or_pay_widget.dart';
import '../../../../../generated/assets.dart';
import 'estimated_delivery_time.dart';
import 'order_summary_section.dart';
import 'price_break_down_widget.dart';
import 'price_breakdown_widget_list_view.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomBackButton(),
                      OrderSummarySection(),
                      TotalAndDeliveryTimeSection(),
                      PaymentMethodsSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        PayNowSection(),
      ],
    );
  }
}
