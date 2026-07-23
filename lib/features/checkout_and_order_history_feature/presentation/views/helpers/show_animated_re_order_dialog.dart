

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../../domain/entities/order_entity.dart';
import '../widgets/re_order_dialog_widget.dart';

Future<bool?> showAnimatedSuccessDialog(
    BuildContext context, {
      required OrderEntity order,
    }) {
  final cartCubit = context.read<CartCubit>();
  return showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Material(
        type: MaterialType.transparency,
        child: ReOrderDialogWidget(
          items: order.cartItems,
          hasItemsInCart: cartCubit.cartItems.isNotEmpty,
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeIn,
      );

      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
        ),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.75, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}
