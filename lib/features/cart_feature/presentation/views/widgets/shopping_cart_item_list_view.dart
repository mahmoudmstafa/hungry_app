import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item.dart';

import '../../manager/cubits/cart_cubit/cart_cubit.dart';




class ShoppingCartItemListView extends StatelessWidget {
  const ShoppingCartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final items = cartCubit.cartItems.reversed.toList();

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 25),
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ShoppingCartItem(
          key: ObjectKey(items[index]),
          index: index,
          cartItem: items[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Gap(25);
      },
    );
  }
}