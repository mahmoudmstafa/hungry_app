import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../manager/cubits/cart_cubit/cart_cubit.dart';
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
              color: kSecondaryColor,
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
                    backgroundColor: kPrimaryColor,
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

class AnimatedPressWrapper extends StatefulWidget {
  const AnimatedPressWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AnimatedPressWrapper> createState() => _AnimatedPressWrapperState();
}

class _AnimatedPressWrapperState extends State<AnimatedPressWrapper> {
  double _scale = 1.0;

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _scale = 0.70);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _scale = 1.0);
  }

  void _onPointerCancel(PointerCancelEvent event) {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
