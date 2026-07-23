import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_welcome_back_login_view.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/bottom_curve_clipper.dart';
import '../../../../../generated/assets.dart';
import 'custom_auth_logo.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.1,
        ),
        color: AppColors.kPrimaryColor,
        child: Column(
          children: [
            const CustomAuthLogo(
              isSignView: false,
            ),
            const Gap(10),
            const TextWelcomeBackLoginView(),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Image.asset(
                Assets.assets.images.burgerPreview.path,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
