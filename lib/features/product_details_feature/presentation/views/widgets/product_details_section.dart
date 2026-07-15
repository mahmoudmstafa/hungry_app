import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/widgets/custom_cached_network_image.dart';
import 'package:hungry_app/features/home_feature/presentation/manager/cubits/get_category_cubit/get_category_cubit.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/product_details_text.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/spicy_section.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';
import '../../../../home_feature/domain/entities/product_entity.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });

  // أسماء الكاتيجوريز اللي مش عايزين نظهر فيها خانة الـ Spicy
  static const List<String> categoriesWithoutSpicyOption = [
    'Desserts',
    'Drinks',
  ];

  @override
  Widget build(BuildContext context) {
    final ProductEntity products = Get.arguments as ProductEntity;

    final categoryState = context.read<GetCategoryCubit>().state;

    String? productCategoryName;

    if (categoryState is GetCategoryLoaded) {
      for (final category in categoryState.categories) {
        if (category.id == products.categoryId) {
          productCategoryName = category.name;
          break;
        }
      }
    }

    final bool shouldShowSpicySection = productCategoryName == null
        ? true
        : !categoriesWithoutSpicyOption.contains(productCategoryName);

    return Padding(
      padding: const EdgeInsets.only(right: 25.0, top: 10, left: 25),
      child: Column(
        children: [
          CustomCachedNetworkImage(
            borderRadiusLoadingImage: BorderRadius.circular(16),
            width: double.infinity,
            colorCircleIndicator: kSecondaryColor,
            imageUrl: products.productImage,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: kSecondaryColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          Gap(10),
          Column(
            children: [
              ProductDetailsText(
                title: products.title,
                desc: products.desc,
              ),
              if (shouldShowSpicySection) SpicySection(),
            ],
          ),
        ],
      ),
    );
  }
}