import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entities/order_entity.dart';


class OrderHistoryPrice extends StatelessWidget {
  const OrderHistoryPrice({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomText(
          textAlign: TextAlign.center,
          text: '\$ ${order.totalPrice.round()}',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: 0xFFFFFFFF,
        ),
      ),
    );
  }
}
