import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_dont_have_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_modal_progress_hud.dart';
import '../../manager/cubits/auth_cubit.dart';
import 'button_login.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({
    super.key,
    this.onPasswordSaved,
    this.onEmailSaved,
    required this.isLoading,
    required this.onLoginPressed,
  });

  final Function(String?)? onPasswordSaved;
  final Function(String?)? onEmailSaved;
  final void Function() onLoginPressed;
  final bool isLoading;

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomModalProgressHud(
      circleColor: AppColors.kSecondaryColor,
      isLoading: widget.isLoading,
      child: Form(
        key: globalKey,
        child: Container(
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kPadding),
          color: Colors.white,
          child: Column(
            children: [
              const TextGetStartedLoginView(),
              TextFieldsLoginViewSection(
                onEmailSaved: widget.onEmailSaved,
                onPasswordSaved: widget.onPasswordSaved,
              ),
              ButtonLogin(
                globalKey: globalKey,
                onLoginPressed: widget.onLoginPressed,
              ),
              const Gap(10),
              const TextDontHaveAnAccount(),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
