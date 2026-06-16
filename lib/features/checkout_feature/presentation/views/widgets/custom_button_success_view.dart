import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomButtonSuccessView extends StatelessWidget {
  const CustomButtonSuccessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: CustomButton(
        text: 'Go Back',
        backgroundColor: kPrimaryColor,
        height: 55,
        textFontSize: 16,
      ),
    );
  }
}
