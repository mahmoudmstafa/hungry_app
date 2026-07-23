import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

import '../../../../../core/app_setup/app_routes.dart';
import 'food_card_details.dart';
import 'food_card_image.dart';

class FoodCard extends StatelessWidget{
  const FoodCard({super.key, required this.products});

  final ProductEntity products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.productDetails,
          arguments: products,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            FoodCardImage(products: products),
            const Gap(20),
            FoodCardDetails(products: products),
          ],
        ),
      ),
    );
  }
}


