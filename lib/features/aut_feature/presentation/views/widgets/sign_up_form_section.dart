import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_already_hava_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_sign_up_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';



class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPadding),
      color: kPrimaryColor,
      child: Column(
        children: [
          Gap(20),
          TextGetStartedLoginView(
            isSignUp: true,
          ),
          TextFieldSignUpViewSection(),
          CustomButton(
            onTap: () {
              Get.offNamed(
                AppRoutes.rootView,
              );
            },
            text: 'Sign Up',
            textColor: kPrimaryColor,
            textFontSize: 20,
            height: 55,
            backgroundColor: Colors.white,
          ),
          Gap(10),
          TextAlreadyHavaAnAccount(),
          Gap(20),
        ],
      ),
    );
  }
}
