import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_dont_have_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_welcome_back_login_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';
import '../../../../home_feature/presentation/views/home_view.dart';
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
                  flex: 3,
                ),
                CustomAuthLogo(),
                Gap(10),
                TextWelcomeBackLoginView(),
                Spacer(
                  flex: 2,
                ),
                TextGetStartedLoginView(),
                TextFieldsLoginViewSection(),
                CustomButton(
                  onTap: () {
                    Get.offNamed(
                      AppRoutes.main,
                    );
                  },
                  text: 'Login',
                  textColor: kPrimaryColor,
                  textFontSize: 21,
                  height: 55,
                  backgroundColor: Colors.white,
                ),
                Gap(10),
                TextDontHaveAnAccount(),
                Gap(10),
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
