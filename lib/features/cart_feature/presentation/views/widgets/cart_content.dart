import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_list_view.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_add_or_pay_widget.dart';
import '../../manager/cubits/cart_cubit/cart_cubit.dart';


class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();

    return Column(
      key: const ValueKey('cartView'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(AppSpaces.kTopSpace),

        const Expanded(
          child: ShoppingCartItemListView(),
        ),

        CustomAddOrPayWidget(
          onTap: () {
            Get.toNamed(AppRoutes.checkout);
          },
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          textButton: 'Checkout',
          text: 'Total',
          price: cartCubit.totalPrice.round(),
        ),
      ],
    );
  }
}
