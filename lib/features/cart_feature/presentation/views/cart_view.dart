import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String id = 'CartView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CartViewBody(),
    );
  }
}