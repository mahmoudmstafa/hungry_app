import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entities/order_entity.dart';



class OrderHistoryQty extends StatelessWidget {
  const OrderHistoryQty({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomText(
        text: "Qty : ${order.itemsCount}",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: 0xff3C2F2F,
      ),
    );
  }
}
