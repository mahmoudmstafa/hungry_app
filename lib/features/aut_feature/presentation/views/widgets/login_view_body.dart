import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/login_form_section_bloc_listener.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_dont_have_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_welcome_back_login_view.dart';

import 'login_form_section.dart';
import 'login_header_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // header
              Expanded(
                flex: 3,
                child: LoginHeaderSection(),
              ),

              // form
              Expanded(
                flex: 4,
                child: LoginFormSectionBlocListener(),
              ),
            ],
          ),
        )
      ],
    );
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: LoginHeaderSection(),
              ),
              Expanded(
                flex: 4,
                child: LoginFormSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
