import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../sign_up_view.dart';

class TextDontHaveAnAccount extends StatelessWidget {
  const TextDontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
              text: "Don't have an account ?  ",
              color: 0xFFFF9100,
              fontSize: 15,
          fontWeight: FontWeight.w500,
            )
            .animate(delay: 600.ms)
            .fadeIn(duration: 500.ms)
            .slideX(
              begin: -0.2,
              end: 0,
              duration: 500.ms,
              curve: Curves.easeOut,
            ),
        GestureDetector(
          onTap: () {
            Get.offNamed(
              AppRoutes.signUp,
            );
          },
          child:
              CustomText(
                    text: ">>> Sign Up <<<",
                    color: kIntPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
                  .animate(delay: 800.ms)
                  .fadeIn(duration: 500.ms)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                    duration: 500.ms,
                    curve: Curves.easeOutBack,
                  ),
        ),
      ],
    );
  }
}
