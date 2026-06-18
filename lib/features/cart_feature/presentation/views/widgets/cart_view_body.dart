import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/widgets/custom_add_or_pay_widget.dart';
import 'package:hungry_app/core/widgets/custom_back_button.dart';
import 'package:hungry_app/core/widgets/custom_bottom_bar.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_list_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(),
                Expanded(
                  child: ShoppingCartItemListView(),
                ),
                CustomAddOrPayWidget(
                  textButton: 'Checkout',
                  text: 'Total',
                  price: 99.19,
                ),
              ],
            ),
          ),
        ),
        Gap(8),
      ],
    );
  }
}
