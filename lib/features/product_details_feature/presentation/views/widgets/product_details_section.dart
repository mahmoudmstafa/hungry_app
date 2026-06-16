import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/product_details_text.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/spicy_section.dart';

import '../../../../../generated/assets.dart';


class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
