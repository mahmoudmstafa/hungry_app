import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/widgets/custom_text_field_password_icon.dart';
import 'custom_auth_text_form_field.dart';

class TextFieldsLoginViewSection extends StatefulWidget {
  const TextFieldsLoginViewSection({
    super.key,
  });

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
          hintText: 'Email Address',
        ),
        Gap(
          10,
        ),
        CustomAuthTextFormField(
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
