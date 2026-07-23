import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circle_loading.dart';
import '../../manger/cubits/checkout_cubit.dart';
import 'empty_order_widget.dart';
import 'order_history_item_list_view.dart';


class OrderHistoryItemBlocBuilder extends StatelessWidget {
  const OrderHistoryItemBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoaded) {
          final orders = state.orders.reversed.toList();
          if (orders.isEmpty) {
            return const EmptyOrdersWidget();
          }
          return OrderHistoryListView(
            orders: orders,
          );
        } else {
          return const CustomCircleLoading();
        }
      },
    );
  }
}
