import 'package:flutter/material.dart';

import '../../../domain/entities/order_entity.dart';
import 'order_history_details.dart';
import 'order_history_image.dart';

class OrderHistoryItemDetails extends StatelessWidget {
  const OrderHistoryItemDetails({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    if (order.cartItems.isEmpty) {
      return const SizedBox();
    }

    final item = order.cartItems.first;
    return Row(
      children: [
        Expanded(
          child: OrderHistoryImage(
            item: item,
          ),
        ),
        Expanded(
          child: OrderHistoryDetails(
            item: item,
            order: order,
          ),
        ),
      ],
    );
  }
}







