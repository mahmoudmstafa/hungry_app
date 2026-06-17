import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../generated/assets.dart';
class AnimationPurgerSplashView extends StatelessWidget {
  const AnimationPurgerSplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.assets.images.image1Png.path,
    )
        .animate(delay: 1300.ms)
        .fadeIn(
      duration: 1300.ms,
    )
        .slideY(
      begin: 0.5,
      end: 0,
      duration: 1300.ms,
      curve: Curves.easeOut,
    );
  }
}
