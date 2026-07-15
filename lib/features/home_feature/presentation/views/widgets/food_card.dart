import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_cached_network_image.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/rating_widget.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import 'favourite_button.dart';

class FoodCard extends StatelessWidget {
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
            CustomCachedNetworkImage(
              height: 120,
              width: double.infinity,
              colorCircleIndicator: kSecondaryColor,
              imageUrl: products.productImage,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: products.title.length > 15
                            ? (products.title.substring(0, 15))
                            : products.title,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: 0xff3C2F2F,
                      ),
                      CustomText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: products.desc.length > 20
                            ? products.desc.substring(0, 20)
                            : products.desc,
                        fontSize: 16,
                        color: 0xff3C2F2F,
                      ),
                    ],
                  ),
                ),
                RatingWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
