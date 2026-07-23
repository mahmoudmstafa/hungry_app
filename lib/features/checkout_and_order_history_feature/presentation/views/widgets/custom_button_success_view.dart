import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/bouncy_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/root_controller.dart';

class CustomButtonSuccessWidget extends StatelessWidget {
  const CustomButtonSuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: BouncyButton(
        child: CustomButton(
          onTap: () {
            Get.until((route) => route.settings.name == AppRoutes.rootView);
            Get.find<RootController>().changeTab(3);
          },
          text: 'To Order History',
          backgroundColor: AppColors.kPrimaryColor,
          height: 55,
          textFontSize: 16,
        ),
      ),
    );
  }
}
