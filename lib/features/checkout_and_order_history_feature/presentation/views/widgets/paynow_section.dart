import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/widgets/custom_add_or_pay_widget.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../../domain/entities/order_entity.dart';
import '../../manger/cubits/checkout_cubit.dart';

class PayNowSection extends StatelessWidget {
  const PayNowSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAddOrPayWidget(
      onTap: () {
        final cartCubit = context.read<CartCubit>();

        final order = OrderEntity(
          orderId: DateTime.now().millisecondsSinceEpoch.toString(),
          userId: FirebaseAuth.instance.currentUser!.uid,
          cartItems: List.from(cartCubit.cartItems),
          itemsCount: cartCubit.totalItemsCount,
          totalPrice: cartCubit.totalPrice,
          paymentMethod: '',
          orderDate: DateTime.now(),
        );

        context.read<CheckoutCubit>().placeOrder(order);
      },
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      textButton: 'Pay Now',
      text: 'Total price',
      textColor: 0xFF9E9E9E,
      textWeight: FontWeight.w400,
      price: context.watch<CartCubit>().totalPrice.toInt(),
      fontSize: 14,
    );
  }
}
