import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/widgets/custom_cached_network_image.dart';
import 'package:hungry_app/features/cart_feature/domain/entities/cart_item_entity.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

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
          color: kSecondaryColor.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
