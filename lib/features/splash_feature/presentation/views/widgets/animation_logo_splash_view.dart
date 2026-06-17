import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          duration: 1200.ms,
          curve: Curves.easeOutBack,
        )
        .then(
          delay: 1700.ms,
        )
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.08, 1.08),
          duration: 600.ms,
          curve: Curves.easeOut,
        )
        .then()
        .fadeOut(
          duration: 600.ms,
        )
        .scale(
          begin: const Offset(1.08, 1.08),
          end: const Offset(.7, .7),
          duration: 300.ms,
          curve: Curves.easeInBack,
        )
        .fadeOut(
          duration: 800.ms,
        );
    ;
  }
}
