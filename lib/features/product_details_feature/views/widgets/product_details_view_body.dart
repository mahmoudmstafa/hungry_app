import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/product_details_section.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/product_details_text.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/side_options_section.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/spicy_section.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/toppings_and_side_options_sections.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/toppings_list_view.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/toppings_section.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/assets.dart';
import 'editing_widget.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(),
        ProductDetailsSection(),
        Gap(50),
        ToppingsAndSideOptionsSections(),
      ],
    );
  }
}



