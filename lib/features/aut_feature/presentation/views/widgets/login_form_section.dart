


import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_dont_have_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.symmetric(horizontal: kPadding),
      color: Colors.white,
      child: Column(
        children: [
          TextGetStartedLoginView(),
          TextFieldsLoginViewSection(),
          CustomButton(
            onTap: () {
              Get.offNamed(
                AppRoutes.rootView,
              );
            },
            text: 'Login',
            textColor: Colors.white,
            textFontSize: 21,
            height: 55,
            backgroundColor: kPrimaryColor,
          ),
          Gap(10),
          TextDontHaveAnAccount(),
          Gap(10),
        ],
      ),
    );
  }
}
