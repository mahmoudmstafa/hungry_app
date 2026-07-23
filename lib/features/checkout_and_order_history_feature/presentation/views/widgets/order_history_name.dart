import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../cart_feature/domain/entities/cart_item_entity.dart';


class OrderHistoryName extends StatelessWidget {
  const OrderHistoryName({
    super.key,
    required this.item,
  });

  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.center,
      text: item.name,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: 0xff3C2F2F,
    );
  }
}
