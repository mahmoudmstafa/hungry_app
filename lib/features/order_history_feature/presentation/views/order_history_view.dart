import 'package:flutter/material.dart';
import 'package:hungry_app/features/order_history_feature/presentation/views/widgets/order_history_view_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  static const String id = 'OrderHistoryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrderHistoryViewBody(),
    );
  }
}