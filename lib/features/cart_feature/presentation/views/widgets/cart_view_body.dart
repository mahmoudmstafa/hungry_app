import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/widgets/custom_circle_loading.dart';

import '../../manager/cubits/cart_cubit/cart_cubit.dart';
import 'cart_animation_switcher.dart';
import 'cart_content.dart';
import 'empty_cart_view.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          return const Center(
            child: CustomCircleLoading(),
          );
        }

        return CartAnimatedSwitcher(
          child: state is CartLoaded && state.items.isNotEmpty
              ? const CartContent(
                  key: ValueKey('cartView'),
                )
              : const EmptyCartView(
                  key: ValueKey('emptyView'),
                ),
        );
      },
    );
  }
}

