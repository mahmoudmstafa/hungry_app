import 'package:flutter/material.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/checkout_view_body.dart';


class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const String id = 'CheckoutView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CheckoutViewBody(),
    );
  }

}
