import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../utils/constant.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.settings = false,
    this.colorOfBackIcon,
  });

  final bool settings;

  final Color? colorOfBackIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(kTopSpace),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.assets.images.back.path,
              color: colorOfBackIcon,
            ),
            settings
                ? SvgPicture.asset(
                    Assets.assets.images.settings.path,
                  )
                : SizedBox(),
          ],
        ),
        Gap(20),
      ],
    );
  }
}
