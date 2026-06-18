import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/login_view.dart';
import 'package:hungry_app/features/home_feature/presentation/views/home_view.dart';

import 'animation_logo_splash_view.dart';
import 'animation_purger_splash_view.dart';
import 'animation_text_fast_fresh_deli_splash_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToLoginView();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          AnimationLogoSplashView(),
          const Gap(10),
          const AnimationTextFastFreshDeliSplashView(),
          const Spacer(),
          const AnimationPurgerSplashView(),
        ],
      ),
    );
  }

  Future<void> navigateToLoginView() async {
    await Future.delayed(
      const Duration(
        milliseconds: 4700,
      ),
      () {
        Get.offNamed(
          AppRoutes.login,
        );
      },
    );
  }
}
