import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';



class TextSuccessView extends StatelessWidget {
  const TextSuccessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'Success !',
          color: kIntPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 28,
          fontFamily: 'Poppins',
        ),
        Gap(5),
        CustomText(
          textAlign: TextAlign.center,
          text:
          '😋🎉 Yummy news ! 🎉😋\nYour payment was successful \n and your order has been placed ....',
          color: kIntSecondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ],
    );
  }
}
