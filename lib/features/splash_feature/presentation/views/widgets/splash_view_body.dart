import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/login_view.dart';

import '../../../../home_feature/presentation/views/home_view.dart';
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

    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, LoginView.id);
      },
    );
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
}
