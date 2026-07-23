import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/price_break_down_section.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/total_and_delivery_time_section.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../manger/cubits/checkout_cubit.dart';
import '../helpers/show_animated_success_dialog.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          showAnimatedReOrderDialog(context);

          context.read<CartCubit>().getCartItems();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Order summary',
            color: AppColors.kIntSecondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const Gap(10),
          PriceBreakdownSection(
            itemsCount: context.watch<CartCubit>().totalItemsCount,
          ),
          const Gap(10),
          const TotalAndDeliveryTimeSection(),
        ],
      ),
    );
  }
}
