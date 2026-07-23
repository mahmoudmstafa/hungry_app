import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';


class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

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
            color: AppColors.kIntSecondaryColor,
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
