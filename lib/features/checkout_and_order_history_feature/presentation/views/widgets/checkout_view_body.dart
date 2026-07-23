import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/custom_back_button.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/payment_methods_section.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/paynow_section.dart';

import 'order_summary_section.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomBackButton(),
                      OrderSummarySection(),
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
