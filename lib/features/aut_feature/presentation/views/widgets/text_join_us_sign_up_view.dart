


import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';


class TextJoinUsSignUpView extends StatelessWidget {
  const TextJoinUsSignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CustomText(
        text: 'Join Us Today and Discover Great Fast Food',
        color: AppColors.kIntPrimaryColor,
        fontSize: 13,
      ),
    );
  }
}
