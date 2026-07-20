import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/custom_shadow_widget.dart';

import '../../../../cart_feature/presentation/views/widgets/shopping_cart_item_details.dart';
import '../../../../cart_feature/presentation/views/widgets/shopping_cart_item_quantity_counter.dart';
import 'order_history_item_list_view.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderHistoryItemListView();
  }
}


