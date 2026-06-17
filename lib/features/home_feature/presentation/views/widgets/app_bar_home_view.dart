import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/utils/constant.dart';

import '../../../../../generated/assets.dart';



class AppBarHomeView extends StatelessWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          kLogo,
          color: kPrimaryColor,
          width: 180,
        ),
        Image.asset(
          Assets.assets.images.profilePng.path,
        ),
      ],
    );
  }
}
