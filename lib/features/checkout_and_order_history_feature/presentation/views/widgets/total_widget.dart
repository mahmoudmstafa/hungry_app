import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
          text: 'Total',
          fontSize: 20,
          color: 0xFF2E7D32,
          fontWeight: FontWeight.bold,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 3,
          ),
          decoration: BoxDecoration(
            color: AppColors.kSecondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomText(
            text: '\$ ${ context
                .watch<CartCubit>()
                .totalPrice.round()
            }',
          fontSize: 18,
          color: 0xFFFFFFFF,
            fontWeight: FontWeight.w700,
            fontFamily: 'ReemKufiInk',
          ),
        ),
      ],
    );
  }
}
