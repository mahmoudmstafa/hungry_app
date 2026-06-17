import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_already_hava_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_sign_up_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_join_us_sign_up_view.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_welcome_back_login_view.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import 'custom_auth_logo.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(10),
                Spacer(
                  flex: 3,
                ),
                CustomAuthLogo(),
                Gap(10),
                TextJoinUsSignUpView(),
                Gap(10),
                Spacer(
                  flex: 2,
                ),
                TextGetStartedLoginView(
                  isSignUp: true,
                ),
                TextFieldSignUpViewSection(),
                CustomButton(
                  text: 'Sign Up',
                  textColor: kPrimaryColor,
                  textFontSize: 20,
                  height: 55,
                  backgroundColor: Colors.white,
                ),
                Gap(10),
                TextAlreadyHavaAnAccount(),
                Gap(20),
                Spacer(
                  flex: 7,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}