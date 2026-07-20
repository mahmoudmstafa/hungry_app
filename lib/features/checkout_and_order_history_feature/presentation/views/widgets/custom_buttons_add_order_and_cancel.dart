import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'bouncy_button.dart';

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
                backgroundColor: kPrimaryColor,
                height: 50,
                textFontSize: 16,
              ),
            ),
          ),
          Gap(2),
          Expanded(
            child: BouncyButton(
              child: CustomButton(
                onTap: () => Get.back(),
                text: 'Cancel',
                backgroundColor: kPrimaryColor,
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
