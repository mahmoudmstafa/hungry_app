import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomTextFormFieldProfileView extends StatelessWidget {
  const CustomTextFormFieldProfileView({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.enable,
    this.onChanged,
  });

  final String hintText;
  final Widget? suffixIcon;

  final bool? enable;

  final bool obscureText;

  final TextEditingController? controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: onChanged,
      enable: enable,
      controller: controller,
      hintFontWeight: FontWeight.w500,
      hintFontSize: 18,
      obscureText: obscureText,
      textStyle: const TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      hintText: hintText,
      filled: false,
      borderRadius: 14,
      enabledBorderColor: AppColors.kPrimaryColor,
      focusedBorderColor: AppColors.kPrimaryColor,
      cursorColor: AppColors.kPrimaryColor,
      suffixIcon: suffixIcon,
      hintColor: Colors.grey.shade600,
    );
  }
}
