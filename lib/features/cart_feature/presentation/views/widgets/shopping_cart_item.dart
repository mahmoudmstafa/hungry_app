import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_details.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_quantity_counter.dart';

import '../../../../../core/widgets/custom_shadow_widget.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../manager/cubits/cart_cubit/cart_cubit.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({
    super.key,
    required this.cartItem,
    required this.index,
  });

  final CartItemEntity cartItem;

  final int index;

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  bool isRemoving = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isRemoving ? .75 : 1,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: isRemoving ? 0 : 1,
        duration: const Duration(milliseconds: 280),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: CustomShadowWidget(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ShoppingCartItemDetails(
                    cartItem: widget.cartItem,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ShoppingCartItemQuantityCounter(
                    removeItem: removeItem,
                    cartItem: widget.cartItem,
                    index: widget.index,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> removeItem() async {
    setState(() {
      isRemoving = true;
    });

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    if (!mounted) return;

    context.read<CartCubit>().deleteItem(widget.index);
  }
}
