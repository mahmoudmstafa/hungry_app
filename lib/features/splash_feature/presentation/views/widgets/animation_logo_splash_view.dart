import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
class AnimationLogoSplashView extends StatelessWidget {
  const AnimationLogoSplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      kLogo,
    )
        .animate()
        .fadeIn(
      duration: 1200.ms,
    )
        .scale(
      begin: const Offset(.7, .7),
      end: const Offset(1, 1),
      duration: 800.ms,
      curve: Curves.easeOutBack,
    );
  }
}
