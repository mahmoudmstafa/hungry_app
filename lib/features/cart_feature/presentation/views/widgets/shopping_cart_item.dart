import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_details.dart';
import 'package:hungry_app/features/cart_feature/presentation/views/widgets/shopping_cart_item_quantity_counter.dart';

import '../../../../../core/widgets/custom_shadow_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CustomShadowWidget(
        child: Row(
          children: [
            Expanded(
              child: ShoppingCartItemDetails(),
            ),
            Gap(10),
            Expanded(
              child: ShoppingCartItemQuantityCounter(),
            ),
          ],
        ),
      ),
    );
  }
}
