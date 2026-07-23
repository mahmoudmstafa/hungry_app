
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_shadow_widget.dart';
import '../../../domain/entities/order_entity.dart';
import 'order_history_item_details.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    super.key, required this.order,
  });

  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomShadowWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
          child: OrderHistoryItemDetails(
            order: order,
          ),
        ),
      ),
    );
  }
}

