import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/price_break_down_section.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/success_widget.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/total_and_delivery_time_section.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../manger/cubits/checkout_cubit.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          _showAnimatedSuccessDialog(context);

          context.read<CartCubit>().getCartItems();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Order summary',
            color: kIntSecondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          Gap(10),
          PriceBreakdownSection(
            itemsCount: context.watch<CartCubit>().totalItemsCount,
          ),
          Gap(10),
          TotalAndDeliveryTimeSection(),
        ],
      ),
    );
  }

  void _showAnimatedSuccessDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const Material(
          type: MaterialType.transparency,
          child: PopScope(
            canPop: false,
            child: SuccessWidget(),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
          reverseCurve: Curves.easeIn,
        );

        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.75, end: 1.0).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
