import 'package:flutter/material.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/success_view.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const String id = 'CheckoutView';

  @override
  Widget build(BuildContext context) {
    // return SuccessView();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CheckoutViewBody(),
    );
  }
}
