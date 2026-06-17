import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    super.key,
    this.suffixIcon,
    this.obscureText = false, required this.hintText,
  });

  final Widget? suffixIcon;

  final bool obscureText;

  final String hintText ;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      suffixIcon: suffixIcon,
      obscureText: obscureText,
      cursorColor: kSecondaryColor,
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      borderRadius: 14,
      hintText: hintText,
      hintColor: kSecondaryColor,
      hintFontSize: 18,
      hintFontWeight: FontWeight.w400,
      focusedBorderColor: kSecondaryColor,
      enabledBorderColor: Colors.white,
    );
  }
}
