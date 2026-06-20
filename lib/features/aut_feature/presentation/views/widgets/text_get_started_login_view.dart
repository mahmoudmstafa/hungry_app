import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class TextGetStartedLoginView extends StatelessWidget {
  const TextGetStartedLoginView({
    super.key,
    this.isSignUp,
  });

  final bool? isSignUp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: isSignUp == true ? "Let's Join Us " : "Let's Get Started ",
          color: isSignUp == true ? 0xFFFFFFFF : kIntPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        // Image.asset(
        //   Assets.assets.images.hamburger.path,
        //   width: 50,
        // ),
        CustomText(
          text: " :",
          color: isSignUp == true ? 0xFFFFFFFF : kIntPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
