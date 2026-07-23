import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';


class ProductDetailsText extends StatelessWidget {
  const ProductDetailsText({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(5),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.kSecondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Gap(5),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.kSecondaryColor.withOpacity(.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
