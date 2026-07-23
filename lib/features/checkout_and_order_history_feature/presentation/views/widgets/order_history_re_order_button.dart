import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/bouncy_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';



class OrderHistoryReOrderButton extends StatelessWidget {
  const OrderHistoryReOrderButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BouncyButton(
      child: CustomButton(
        onTap: onTap,
        height: 40,
        textFontSize: 15,
        text: 'Re Order',
        backgroundColor: AppColors.kPrimaryColor,
        borderRadius: 16,
      ),
    );
  }
}
