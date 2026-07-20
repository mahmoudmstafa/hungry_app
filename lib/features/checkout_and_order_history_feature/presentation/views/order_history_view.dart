import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/order_history_view_body.dart';

import '../manger/cubits/checkout_cubit.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  static const String id = 'OrderHistoryView';

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {


  @override
  void initState() {
    context.read<CheckoutCubit>().getOrders();    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrderHistoryViewBody(),
    );
  }
}