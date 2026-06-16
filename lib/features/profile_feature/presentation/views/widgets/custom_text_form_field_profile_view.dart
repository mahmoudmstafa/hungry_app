import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomTextFormFieldProfileView extends StatelessWidget {
  const CustomTextFormFieldProfileView({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
  });

  final String labelText;
  final Widget? suffixIcon;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      labelText: labelText,
      filled: false,
      borderRadius: 18,
      enabledBorderColor: Colors.white,
      focusedBorderColor: Colors.white,
      cursorColor: Colors.white,
      suffixIcon: suffixIcon,
      hintColor: Colors.white,
    );
  }
}
