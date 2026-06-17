import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';

class CustomAuthLogo extends StatelessWidget {
  const CustomAuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      kLogo,
      width: 250,
    );
  }
}
