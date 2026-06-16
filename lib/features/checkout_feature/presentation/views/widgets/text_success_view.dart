import 'package:flutter/material.dart';

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
        CustomText(
          textAlign: TextAlign.center,
          text:
          'Your payment was successful.\nA receipt for this purchase\nhas been sent to your email.',
          color: 0xffBCBBBB,
          fontSize: 12,
        ),
      ],
    );
  }
}
