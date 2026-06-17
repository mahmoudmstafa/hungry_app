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
        .animate(delay: 800.ms)
        .fadeIn(
      duration: 800.ms,
    )
        .slideY(
      begin: 0.5,
      end: 0,
      duration: 800.ms,
      curve: Curves.easeOut,
    )
        .then(
      delay: 600.ms,
    )
        .slideY(
      begin: 0,
      end: 0.5,
      duration: 800.ms,
      curve: Curves.easeInBack,
    )
        .fadeOut(
      duration: 800.ms,
    );
  }
}