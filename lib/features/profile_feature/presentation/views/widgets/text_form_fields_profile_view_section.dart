import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import 'custom_password_text_form_field_profile_view.dart';
import 'custom_text_form_field_profile_view.dart';

class TextFormFieldsProfileViewSection extends StatelessWidget {
  const TextFormFieldsProfileViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldProfileView(
          hintText: 'Name',
        ),
        Gap(15),
        CustomTextFormFieldProfileView(
          hintText: 'Email',
        ),
        Gap(15),
        CustomTextFormFieldProfileView(
          hintText: 'Delivery address',
        ),
        Gap(15),
        CustomPasswordTextFormFieldProfileView(),
      ],
    );
  }
}
