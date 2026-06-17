import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hungry_app/features/splash_feature/presentation/views/widgets/animation_logo_splash_view.dart';
import 'package:hungry_app/features/splash_feature/presentation/views/widgets/animation_purger_splash_view.dart';
import 'package:hungry_app/features/splash_feature/presentation/views/widgets/animation_text_fast_fresh_deli_splash_view.dart';
import '../../../../core/utils/constant.dart';
import '../../../../generated/assets.dart';
import '../../../home_feature/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String id = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeView.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
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
      ),
    );
  }
}


