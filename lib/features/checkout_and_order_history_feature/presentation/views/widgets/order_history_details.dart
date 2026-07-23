import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../../../core/widgets/root_controller.dart';
import '../../../../cart_feature/domain/entities/cart_item_entity.dart';
import '../../../domain/entities/order_entity.dart';
import '../helpers/show_animated_re_order_dialog.dart';
import 'order_history_name.dart';
import 'order_history_price.dart';
import 'order_history_qty.dart';
import 'order_history_re_order_button.dart';
import 'order_history_time.dart';


class OrderHistoryDetails extends StatelessWidget {
  const OrderHistoryDetails({
    super.key,
    required this.item,
    required this.order,
  });

  final CartItemEntity item;
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(5),
          OrderHistoryName(
            item: item,
          ),
          const Gap(5),
          Row(
            children: [
              Expanded(
                child: OrderHistoryQty(
                  order: order,
                ),
              ),
              const Gap(5),
              Expanded(
                child: OrderHistoryPrice(
                  order: order,
                ),
              ),
            ],
          ),
          const Gap(10),
          OrderHistoryReOrderButton(
            onTap: () async {
              final result = await showAnimatedSuccessDialog(
                context,
                order: order,
              );
              if (result == true) {
                Get.find<RootController>().changeTab(1);
              }
            },
          ),
          const Gap(10),
          OrderHistoryTime(
            order: order,
          ),
        ],
      ),
    );
  }
}
