import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/bouncy_button.dart';

class CustomButtonsAddOrderAndCancel extends StatelessWidget {
  const CustomButtonsAddOrderAndCancel({
    super.key, this.onTap,
  });

  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: BouncyButton(
              child: CustomButton(
                onTap: onTap,
                text: 'Add Order',
                backgroundColor: AppColors.kPrimaryColor,
                height: 50,
                textFontSize: 16,
              ),
            ),
          ),
          const Gap(2),
          Expanded(
            child: BouncyButton(
              child: CustomButton(
                onTap: () => Get.back(),
                text: 'Cancel',
                backgroundColor: AppColors.kPrimaryColor,
                height: 50,
                textFontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
