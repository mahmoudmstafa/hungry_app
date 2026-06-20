import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_join_us_sign_up_view.dart';

import '../../../../../core/widgets/bottom_curve_clipper.dart';
import '../../../../../generated/assets.dart';
import 'custom_auth_logo.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Column(
          children: [
            CustomAuthLogo(),
            Gap(10),
            TextJoinUsSignUpView(),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Image.asset(
                Assets.assets.images.chesseBurger.path,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
