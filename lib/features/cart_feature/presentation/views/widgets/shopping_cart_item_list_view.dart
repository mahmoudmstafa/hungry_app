import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item.dart';




class ShoppingCartItemListView extends StatelessWidget {
  const ShoppingCartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 25),
      itemCount: 10,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ShoppingCartItem();
      }, separatorBuilder: (BuildContext context, int index) {
      return Gap(25);
    },
    );
  }
}
