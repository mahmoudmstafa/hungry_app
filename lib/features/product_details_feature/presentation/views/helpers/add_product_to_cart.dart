import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_setup/app_snackbar.dart';
import '../../../../cart_feature/domain/entities/cart_item_entity.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../../../home_feature/domain/entities/product_entity.dart';
import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/total_product_price_and_toppings_and_side_options_cubit.dart';



Future<void> addProductToCart(
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

  AppSnackBar.show(
    isError: false,
    context,
    message:
    "Added Successfully !!  😁💜\n Let's get cooking ... 🍟🌭🍔\n Go to Cart  ...",
  );
}