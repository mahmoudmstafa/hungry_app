import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';
import 'custom_button_profile_view.dart';

class ButtonsProfileViewSection extends StatefulWidget {
  const ButtonsProfileViewSection({super.key});

  @override
  State<ButtonsProfileViewSection> createState() =>
      _ButtonsProfileViewSectionState();
}

class _ButtonsProfileViewSectionState extends State<ButtonsProfileViewSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonProfileView(
            text: 'Edit Profile',
            textColor: kPrimaryColor,
            backgroundColor: Colors.white,
            image: Assets.assets.images.edit.path,
          ),
        ),
        Gap(10),
        Expanded(
          child: CustomButtonProfileView(
            text: 'Log out',
            textColor: Colors.white,
            backgroundColor: kPrimaryColor,
            image: Assets.assets.images.signOut.path,
          ),
        ),
      ],
    );
  }
}
