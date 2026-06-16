

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_add_or_pay_widget.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          CustomAddOrPayWidget(
            textButton: 'Add To Cart',
            text: 'Total',
            textColor: kIntSecondaryColor,
            price: 18.19,
          ),
          Gap(30),
        ],
      ),
    );
  }
}
