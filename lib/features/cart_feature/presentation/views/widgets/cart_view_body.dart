import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/widgets/custom_add_or_pay_widget.dart';
import 'package:hungry_app/core/widgets/custom_back_button.dart';
import 'package:hungry_app/core/widgets/custom_bottom_bar.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_list_view.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(kTopSpace),
        Expanded(
          child: ShoppingCartItemListView(),
        ),
        CustomAddOrPayWidget(
          onTap: () {
            Get.toNamed(
              AppRoutes.checkout,
            );
          },
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          textButton: 'Checkout',
          text: 'Total',
          price: 99,
        ),
      ],
    );
  }
}
