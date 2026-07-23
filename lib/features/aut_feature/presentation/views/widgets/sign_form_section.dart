import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_already_hava_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_sign_up_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_modal_progress_hud.dart';
import 'button_sign_up.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key, required this.isLoading, this.name, this.email, this.password, this.onSavedName, this.onSavedEmail, this.onSavedPassword});

  final bool isLoading;
  final Function(String?)? onSavedName, onSavedEmail, onSavedPassword;
  final String? name , email , password;
  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomModalProgressHud(
      isLoading: widget.isLoading,
      child: Form(
        key: globalKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kPadding),
          color: AppColors.kPrimaryColor,
          child: Column(
            children: [
              const Gap(20),
              const TextGetStartedLoginView(
                isSignUp: true,
              ),
              TextFieldSignUpViewSection(
                onSavedEmail: widget.onSavedEmail,
                onSavedName: widget.onSavedName,
                onSavedPassword: widget.onSavedPassword,
              ),
              ButtonSignUp(
                globalKey: globalKey,
                name: widget.name,
                email: widget.email,
                password: widget.password,
              ),
              const Gap(10),
              const TextAlreadyHavaAnAccount(),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
