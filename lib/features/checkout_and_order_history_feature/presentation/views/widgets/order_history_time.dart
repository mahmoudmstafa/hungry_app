import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entities/order_entity.dart';


class OrderHistoryTime extends StatelessWidget {
  const OrderHistoryTime({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.center,
      text: DateFormat(
        'dd-MM-yyyy hh:mm a',
      ).format(order.orderDate),
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: 0xff3C2F2F,
    );
  }
}
