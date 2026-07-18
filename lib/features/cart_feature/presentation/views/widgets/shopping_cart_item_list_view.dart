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
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 25),
      itemCount: cartCubit.cartItems.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ShoppingCartItem(
          key: ObjectKey(cartCubit.cartItems[index]),
          index: index,
          cartItem: cartCubit.cartItems[index],
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return Gap(25);
    },
    );
  }
}
