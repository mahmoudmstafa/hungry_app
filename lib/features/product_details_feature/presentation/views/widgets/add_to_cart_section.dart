import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/func/snacbar_message.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_add_or_pay_widget.dart';
import '../../../../cart_feature/domain/entities/cart_item_entity.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../../../home_feature/domain/entities/product_entity.dart';
import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/_total_product_price_and_toppings_and_side_options_cubit.dart';
import '../../manger/cubits/get_side_options_cubit/get_side_options_cubit.dart';
import '../../manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';

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
          onTap: () => _addProductToCart(context, product, total),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          textButton: 'Add To Cart',
          textColor: kIntSecondaryColor,
          price: total.toInt(),
        );
      },
    );
  }

  Future<void> _addProductToCart(
    BuildContext context,
    ProductEntity product,
    double total,
  ) async {
    final detailsCubit = context
        .read<TotalProductPriceAndToppingsAndSideOptionsCubit>();

    await context.read<CartCubit>().addToCart(
      CartItemEntity(
        userId: FirebaseAuth.instance.currentUser!.uid,
        productId: product.id,
        name: product.title,
        image: product.productImage,
        basePrice: product.price.toDouble(),
        toppings: detailsCubit.selectedToppings,
        sideOptions: detailsCubit.selectedSideOptions,
        totalPrice: total,
        quantity: 1,
      ),
    );

    snackBarMessage(
      isError: false,
      context,
      message:
          "Added Successfully !!  😁💜\n Let's get cooking ... 🍟🌭🍔\n Go to Cart  ...",
    );
  }
}
