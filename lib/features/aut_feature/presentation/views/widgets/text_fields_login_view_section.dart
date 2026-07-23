import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text_field_password_icon.dart';
import 'custom_auth_text_form_field.dart';

class TextFieldsLoginViewSection extends StatefulWidget {
  const TextFieldsLoginViewSection({
    super.key,
    this.onEmailSaved,
    this.onPasswordSaved,
  });

  final Function(String?)? onEmailSaved, onPasswordSaved;

  @override
  State<TextFieldsLoginViewSection> createState() =>
      _TextFieldsLoginViewSectionState();
}

class _TextFieldsLoginViewSectionState
    extends State<TextFieldsLoginViewSection> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(
          10,
        ),
        CustomAuthTextFormField(
          focusedErrorBorder: Colors.green,
          errorBorderColor: Colors.green,
          errorStyle: const TextStyle(
            color: AppColors.kSecondaryColor,
            fontWeight: FontWeight.w500,
          ),
          onSaved: widget.onEmailSaved,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          hintText: 'Email Address',
        ),
        const Gap(
          10,
        ),
        CustomAuthTextFormField(
          focusedErrorBorder: Colors.green,
          errorBorderColor: Colors.green,
          errorStyle: const TextStyle(
            color: AppColors.kSecondaryColor,
            fontWeight: FontWeight.w500,
          ),
          onSaved: widget.onPasswordSaved,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
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
          40,
        ),
      ],
    );
  }
}
