import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../domain/entities/product_entity.dart';


class FoodCardImage extends StatelessWidget {
  const FoodCardImage({
    super.key,
    required this.products,
  });

  final ProductEntity products;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      height: 120,
      width: double.infinity,
      colorCircleIndicator: AppColors.kSecondaryColor,
      imageUrl: products.productImage,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
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
