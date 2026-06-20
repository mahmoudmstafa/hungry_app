import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';

import 'order_history_item.dart';
import 'order_history_view_body.dart';


class OrderHistoryItemListView extends StatelessWidget {
  const OrderHistoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kTopSpace),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 25),
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return OrderHistoryItem();
        }, separatorBuilder: (BuildContext context, int index) {
        return Gap(25);
      },
      ),
    );
  }
}
