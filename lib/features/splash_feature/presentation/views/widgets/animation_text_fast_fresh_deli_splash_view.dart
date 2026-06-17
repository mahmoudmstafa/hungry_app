import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/widgets/custom_text.dart';

class AnimationTextFastFreshDeliSplashView extends StatelessWidget {
  const AnimationTextFastFreshDeliSplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
          text: 'Fast ⚡ , Fresh 🌿 & Delicious 🍽️ !',
          color: 0xFFFFFFFF,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        )
        .animate(delay: 800.ms)
        .fadeIn(duration: 800.ms)
        .slideY(
          begin: 0.5,
          end: 0,
          duration: 800.ms,
          curve: Curves.easeOut,
        );
  }
}
