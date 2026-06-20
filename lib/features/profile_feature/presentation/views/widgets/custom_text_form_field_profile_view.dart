import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomTextFormFieldProfileView extends StatelessWidget {
  const CustomTextFormFieldProfileView({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });

  final String hintText;
  final Widget? suffixIcon;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintFontWeight: FontWeight.w500,
      hintFontSize: 18,
      obscureText: obscureText,
      textStyle: TextStyle(
        color: kPrimaryColor,
        fontSize: 18,
      ),
      hintText: hintText,
      filled: false,
      borderRadius: 18,
      enabledBorderColor: kPrimaryColor,
      focusedBorderColor: kPrimaryColor,
      cursorColor: kPrimaryColor,
      suffixIcon: suffixIcon,
      hintColor: Colors.grey.shade600,
    );
  }
}
