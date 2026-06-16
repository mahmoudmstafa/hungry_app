import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../utils/constant.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(kTopSpace),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: SvgPicture.asset(Assets.assets.images.back.path),
        ),
        Gap(20),
      ],
    );
  }
}
