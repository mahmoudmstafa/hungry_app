import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'bouncy_button.dart';

class CustomButtonReOrder extends StatelessWidget {
  const CustomButtonReOrder({super.key, this.onTap});
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BouncyButton(
        child: CustomButton(
          onTap: onTap,
          text: 'Re Order',
          backgroundColor: kPrimaryColor,
          height: 50,
          textFontSize: 17,
        ),
      ),
    );
  }
}
