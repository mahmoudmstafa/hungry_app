import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/slider_widget.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'cold_and_spicy_icons.dart';

class SpicySection extends StatelessWidget {
  const SpicySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),
        CustomText(
          text: 'Spicy',
          color: AppColors.kIntSecondaryColor,
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

