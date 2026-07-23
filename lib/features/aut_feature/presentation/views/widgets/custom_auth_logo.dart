import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_photos.dart';

import '../../../../../core/constants/app_colors.dart';


class CustomAuthLogo extends StatelessWidget {
  const CustomAuthLogo({
    super.key, this.isSignView = true,
  });

  final bool isSignView;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppPhotos.kLogo,
      width: 250,
      color: isSignView ? AppColors.kPrimaryColor : Colors.white,
    );
  }
}
