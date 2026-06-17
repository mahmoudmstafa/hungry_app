import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_welcome_back_login_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';
import 'custom_auth_logo.dart';
import 'custom_auth_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
                Spacer(
                  flex: 2,
                ),
                CustomAuthLogo(),
                Gap(10),
                TextWelcomeBackLoginView(),
                Spacer(),
                TextGetStartedLoginView(),
                TextFieldsLoginViewSection(),
                CustomButton(
                  text: 'Login',
                  textColor: kPrimaryColor,
                  textFontSize: 22,
                  height: 55,
                  backgroundColor: Colors.white,
                ),
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
