import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../cart_feature/domain/entities/cart_item_entity.dart';


class OrderHistoryImage extends StatelessWidget {
  const OrderHistoryImage({
    super.key,
    required this.item,
  });

  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      height: 150,
      width: double.infinity,
      colorCircleIndicator: AppColors.kSecondaryColor,
      imageUrl: item.image,
      borderRadiusLoadingImage: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
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
