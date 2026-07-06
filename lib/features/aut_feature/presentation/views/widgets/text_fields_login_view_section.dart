import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';

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
        Gap(
          10,
        ),
        CustomAuthTextFormField(
          focusedErrorBorder: Colors.green,
          errorBorderColor: Colors.green,
          errorStyle: TextStyle(
            color: kSecondaryColor,
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
        Gap(
          10,
        ),
        CustomAuthTextFormField(
          focusedErrorBorder: Colors.green,
          errorBorderColor: Colors.green,
          errorStyle: TextStyle(
            color: kSecondaryColor,
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
            iconColor: kSecondaryColor,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        Gap(
          40,
        ),
      ],
    );
  }
}
