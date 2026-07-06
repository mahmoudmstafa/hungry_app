import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    super.key,
    this.suffixIcon,
    this.obscureText = false,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.errorStyle,
    this.errorBorderColor,
    this.focusedErrorBorder,
  });

  final Widget? suffixIcon;

  final TextStyle? errorStyle;
  final Color? errorBorderColor;

  final bool obscureText;
  final Function(String?)? onSaved;
  final String hintText;

  final String? Function(String?)? validator;
  final Color? focusedErrorBorder;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusedErrorBorder: focusedErrorBorder,
      errorBorderColor: errorBorderColor,
      errorStyle: errorStyle,
      validator: validator,
      onSaved: onSaved,
      suffixIcon: suffixIcon,
      obscureText: obscureText,
      cursorColor: kSecondaryColor,
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      borderRadius: 14,
      hintText: hintText,
      hintColor: kPrimaryColor,
      hintFontSize: 18,
      hintFontWeight: FontWeight.w400,
      focusedBorderColor: kPrimaryColor,
      enabledBorderColor: kPrimaryColor,
    );
  }
}
