import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:hungry_app/core/widgets/custom_add_or_pay_widget.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../manager/cubits/cart_cubit/cart_cubit.dart';
import 'shopping_cart_item_list_view.dart';

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
            child: CircularProgressIndicator(),
          );
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: state is CartLoaded && state.items.isEmpty
              ? const _EmptyCartView(
            key: ValueKey('empty'),
          )
              : const _CartContent(
            key: ValueKey('cart'),
          ),
        );
      },
    );
  }
}

class _EmptyCartView extends StatelessWidget {
  const _EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const ValueKey('emptyView'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 90,
            color: Colors.grey.shade400,
          ),
          const Gap(20),
          const CustomText(
            text: "Your cart is empty",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kIntSecondaryColor,
          ),
          const Gap(10),
          const CustomText(
            text: "Let's add something delicious 🍔🍟",
            textAlign: TextAlign.center,
            fontSize: 16,
            color: 0xff8A8A8A,
          ),
        ],
      ),
    );
  }
}

class _CartContent extends StatelessWidget {
  const _CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();

    return Column(
      key: const ValueKey('cartView'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(kTopSpace),

        const Expanded(
          child: ShoppingCartItemListView(),
        ),

        CustomAddOrPayWidget(
          onTap: () {
            Get.toNamed(AppRoutes.checkout);
          },
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          textButton: 'Checkout',
          text: 'Total',
          price: cartCubit.totalPrice.round(),
        ),
      ],
    );
  }
}