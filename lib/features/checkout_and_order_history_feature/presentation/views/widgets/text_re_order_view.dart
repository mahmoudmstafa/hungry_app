import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';

class TextReOrderView extends StatelessWidget {
  const TextReOrderView({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          text: 'Re Order !',
          color: AppColors.kIntPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 26,
          fontFamily: 'Poppins',
        ),
        const Gap(10),
        CustomText(
          textAlign: TextAlign.center,
          text: text,
          color: AppColors.kIntSecondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ],
    );
  }
}
