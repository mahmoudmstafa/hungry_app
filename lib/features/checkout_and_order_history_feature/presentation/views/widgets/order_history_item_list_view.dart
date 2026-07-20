import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../manger/cubits/checkout_cubit.dart';
import 'empty_order_widget.dart';
import 'order_history_item.dart';
import 'order_history_view_body.dart';

class OrderHistoryItemListView extends StatelessWidget {
  const OrderHistoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoaded) {
          final orders = state.orders.reversed.toList();
          if (orders.isEmpty) {
            return const EmptyOrdersWidget();
          }
          return Padding(
            padding: const EdgeInsets.only(top: kTopSpace),
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 25),
              itemCount: orders.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                log(orders[index].cartItems.length.toString());
                return OrderHistoryItem(

                  order: orders[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Gap(25);
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
