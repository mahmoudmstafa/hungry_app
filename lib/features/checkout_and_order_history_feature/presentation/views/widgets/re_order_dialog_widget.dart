import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/re_order_icon.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/text_re_order_view.dart';

import '../../../../cart_feature/domain/entities/cart_item_entity.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'custom_button_re_order.dart';
import 'custom_buttons_add_order_and_cancel.dart';

class ReOrderDialogWidget extends StatelessWidget {
  const ReOrderDialogWidget({
    super.key,
    required this.hasItemsInCart,
    required this.items,
  });

  final bool hasItemsInCart;
  final List<CartItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * .4,
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Column(
          children: [
            const ReOrderIcon(),
            TextReOrderView(
              text: hasItemsInCart
                  ? 'Items already exist in your cart .\nWould you like to add this\n order to them ?'
                  : 'Ready to re order! 🎉\nAdd these items\nto your cart ?\n😊',
            ),
            const Spacer(),
            hasItemsInCart
                ? CustomButtonsAddOrderAndCancel(
                    onTap: () async {
                      await context.read<CartCubit>().reOrder(
                        items,
                        replace: false,
                      );
                      Get.back(result: true);
                    },
                  )
                : CustomButtonReOrder(
                    onTap: () async {
                      await context.read<CartCubit>().reOrder(
                        items,
                        replace: true,
                      );

                      Get.back(result: true);
                    },
                  ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
