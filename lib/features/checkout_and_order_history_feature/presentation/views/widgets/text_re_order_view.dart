import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
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
        CustomText(
          text: 'Re Order !',
          color: kIntPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 26,
          fontFamily: 'Poppins',
        ),
        Gap(10),
        CustomText(
          textAlign: TextAlign.center,
          text: text,
          color: kIntSecondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ],
    );
  }
}

//           ' Your cart already contains items ! \nReplace current cart \n with this order ? ',
// 'Ready to reorder! 🎉\nAdd these items\nto your cart?',
