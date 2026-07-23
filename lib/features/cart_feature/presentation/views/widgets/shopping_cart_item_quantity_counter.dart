import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../manager/cubits/cart_cubit/cart_cubit.dart';
import 'animated_press_wrapper.dart';
import 'custom_add_or_remove_widget.dart';

class ShoppingCartItemQuantityCounter extends StatelessWidget {
  const ShoppingCartItemQuantityCounter({
    super.key,
    required this.cartItem,
    required this.index,
    this.removeItem,
  });

  final CartItemEntity cartItem;
  final void Function()? removeItem;

  final int index;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.fade,
            text: cartItem.name,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: 0xff3C2F2F,
          ),

          const Gap(15),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.kSecondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: CustomText(
                key: ValueKey(cartItem.quantity),
                text: "${cartItem.quantity}",
                color: 0xffffffff,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const Gap(15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedPressWrapper(
                child: CustomAddOrRemoveWidget(
                  onTap: () {
                    cartCubit.decreaseQuantity(index);
                  },
                  icon: Icons.remove,
                ),
              ),

              AnimatedPressWrapper(
                child: CustomAddOrRemoveWidget(
                  onTap: () {
                    cartCubit.increaseQuantity(index);
                  },
                  icon: Icons.add,
                ),
              ),

              GestureDetector(
                onTap: removeItem,
                child: const AnimatedPressWrapper(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.kPrimaryColor,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
