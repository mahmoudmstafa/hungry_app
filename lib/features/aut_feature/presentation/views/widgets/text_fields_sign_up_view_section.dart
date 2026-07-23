import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text_field_password_icon.dart';
import 'custom_auth_text_form_field.dart';

class TextFieldSignUpViewSection extends StatefulWidget {
  const TextFieldSignUpViewSection({
    super.key,
    this.onSavedName,
    this.onSavedEmail,
    this.onSavedPassword,
  });

  final Function(String?)? onSavedName, onSavedEmail, onSavedPassword;

  @override
  State<TextFieldSignUpViewSection> createState() =>
      _TextFieldSignUpViewSectionState();
}

class _TextFieldSignUpViewSectionState
    extends State<TextFieldSignUpViewSection> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(
          10,
        ),
        CustomAuthTextFormField(
          focusedErrorBorder: Colors.orange[700],
          errorBorderColor: Colors.orange[700],
          errorStyle: const TextStyle(
            color: Colors.white,
          ),
          validator: (data) {
            if (data?.isEmpty ?? true) {
              return 'Name is required';
            } else {
              return null;
            }
          },
          onSaved: widget.onSavedName,
          hintText: 'Name',
        ),
        const Gap(
          10,
        ),
        CustomAuthTextFormField(
          errorBorderColor: Colors.orange[700],
          focusedErrorBorder: Colors.orange[700],
          errorStyle: const TextStyle(
            color: Colors.white,
          ),
          validator: (data) {
            if (data?.isEmpty ?? true) {
              return 'Email is required';
            } else {
              return null;
            }
          },
          onSaved: widget.onSavedEmail,
          hintText: 'Email Address',
        ),
        const Gap(
          10,
        ),
        CustomAuthTextFormField(
          errorBorderColor: Colors.orange[700],
          focusedErrorBorder: Colors.orange[700],
          errorStyle: const TextStyle(
            color: Colors.white,
          ),
          validator: (data) {
            if (data?.isEmpty ?? true) {
              return 'Password is required';
            } else {
              return null;
            }
          },
          onSaved: widget.onSavedPassword,
          obscureText: obscureText,
          hintText: 'Password',
          suffixIcon: CustomTextFieldPasswordIcon(
            obscureText: obscureText,
            iconColor: AppColors.kSecondaryColor,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        const Gap(
          35,
        ),
      ],
    );
  }
}
