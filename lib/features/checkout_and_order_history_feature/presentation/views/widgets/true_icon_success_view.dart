import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../generated/assets.dart';

class TrueIconSuccessView extends StatelessWidget {
  const TrueIconSuccessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 24),
      width: 65,
      height: 65,
      decoration: const BoxDecoration(
        color: AppColors.kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 30,
            maxHeight: 30,
          ),
          child: SvgPicture.asset(
            Assets.assets.images.check.path,
          ),
        ),
      ),
    );
  }
}
