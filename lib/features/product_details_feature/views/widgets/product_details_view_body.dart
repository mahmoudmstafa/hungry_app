import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/product_details_text.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/spicy_section.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/assets.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  Assets.assets.images.productDetails.path,
                ),
              ),
              Gap(30),
              Expanded(
                child: Column(
                  children: [
                    ProductDetailsText(),
                    SpicySection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
