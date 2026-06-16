import 'package:flutter/material.dart';

import 'custom_text_form_field_profile_view.dart';

class CustomPasswordTextFormFieldProfileView extends StatefulWidget {
  const CustomPasswordTextFormFieldProfileView({super.key});

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
      labelText: 'Password',
      suffixIcon: IconButton(
        padding: EdgeInsets.only(right: 20),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.lock_outline_rounded : Icons.lock_open_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
