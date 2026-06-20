import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field_password_icon.dart';
import 'custom_text_form_field_profile_view.dart';

class CustomPasswordTextFormFieldProfileView extends StatefulWidget {
  const CustomPasswordTextFormFieldProfileView({super.key, this.iconColor});

  final Color? iconColor;

  @override
  State<CustomPasswordTextFormFieldProfileView> createState() =>
      _CustomPasswordTextFormFieldProfileViewState();
}

class _CustomPasswordTextFormFieldProfileViewState
    extends State<CustomPasswordTextFormFieldProfileView> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldProfileView(
      obscureText: obscureText,
      hintText: 'Password',
      suffixIcon: CustomTextFieldPasswordIcon(
        obscureText: obscureText,
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}
