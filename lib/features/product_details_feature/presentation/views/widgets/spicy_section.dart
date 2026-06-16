import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/slider_widget.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'cold_and_spicy_icons.dart';

class SpicySection extends StatelessWidget {
  const SpicySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20),
        CustomText(
          text: 'Spicy',
          color: kIntSecondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        Gap(10),
        SliderWidget(),
        Gap(5),
        ColdAndSpicyIcons(),
      ],
    );
  }
}

