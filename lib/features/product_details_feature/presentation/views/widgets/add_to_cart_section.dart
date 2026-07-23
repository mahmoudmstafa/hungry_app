import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

import '../../../../../core/widgets/custom_add_or_pay_widget.dart';
import '../../../../home_feature/domain/entities/product_entity.dart';
import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/total_product_price_and_toppings_and_side_options_cubit.dart';
import '../helpers/add_product_to_cart.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductEntity;

    return BlocBuilder<
      TotalProductPriceAndToppingsAndSideOptionsCubit,
      TotalProductPriceAndToppingsAndSideOptionsState
    >(
      builder: (context, state) {
        double total = product.price.toDouble();
        if (state is ProductDetailsChanged) {
          total = state.totalPrice;
        }
        return CustomAddOrPayWidget(
          onTap: () => addProductToCart(context, product, total),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          textButton: 'Add To Cart',
          textColor: AppColors.kIntSecondaryColor,
          price: total.toInt(),
        );
      },
    );
  }

}
