import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

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
      child: CustomButton(
        onTap: () => Get.back(),
        text: 'Go Back',
        backgroundColor: kPrimaryColor,
        height: 55,
        textFontSize: 16,
      ),
    );
  }
}
