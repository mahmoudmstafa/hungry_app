import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/login_view.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../sign_up_view.dart';

class TextAlreadyHavaAnAccount extends StatelessWidget {
  const TextAlreadyHavaAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
              text: "Already have an account ? ",
              color: 0xFFFFFFFF,
              fontSize: 15,
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
                  AppRoutes.login,
                );
              },
              child: CustomText(
                text: ">>> Log In <<<",
                color: 0xFFFFAB40,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
            .animate(delay: 800.ms)
            .fadeIn(duration: 500.ms)
            .scale(
              begin: const Offset(0.8, 0.8),
              end: const Offset(1, 1),
              duration: 500.ms,
              curve: Curves.easeOutBack,
            ),
      ],
    );
  }
}
