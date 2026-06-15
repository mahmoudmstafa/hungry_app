import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/utils/assets.dart';
import '../core/utils/constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              Assets.assets.images.logo.path,
            ),
            Spacer(),
            Image.asset(
              Assets.assets.images.image1Png.path,
            ),
          ],
        ),
      ),
    );
  }
}
