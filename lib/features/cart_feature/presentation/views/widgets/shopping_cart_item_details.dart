
import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/custom_cached_network_image.dart';
import 'package:hungry_app/features/cart_feature/domain/entities/cart_item_entity.dart';

import '../../../../../core/constants/app_colors.dart';

class ShoppingCartItemDetails extends StatelessWidget {
  const ShoppingCartItemDetails({
    super.key,
    required this.cartItem,
  });

  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      borderRadiusLoadingImage: BorderRadius.circular(16),
      height: 150,
      imageUrl: cartItem.image,
      width: double.infinity,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppColors.kSecondaryColor.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
