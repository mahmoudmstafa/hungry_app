import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/product_details_section.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/toppings_and_side_options_sections.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/custom_add_or_pay_widget.dart';
import '../../../../core/widgets/custom_back_button.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(),
        ProductDetailsSection(),
        Gap(30),
        ToppingsAndSideOptionsSections(),
        Spacer(),
        CustomAddOrPayWidget(
          textButton: 'Add To Cart',
          text: 'Total',
          textColor: kIntSecondaryColor,
          price: 18.19,
        ),
        Gap(30),
      ],
    );
  }
}




