
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/domain/entities/order_entity.dart';

import '../../../../../core/constants/app_spaces.dart';
import 'order_history_item.dart';


class OrderHistoryListView extends StatelessWidget {
  const OrderHistoryListView({
    super.key,
    required this.orders,
  });

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpaces.kTopSpace),
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 25),
        itemCount: orders.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return OrderHistoryItem(
            order: orders[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Gap(25);
        },
      ),
    );
  }
}
