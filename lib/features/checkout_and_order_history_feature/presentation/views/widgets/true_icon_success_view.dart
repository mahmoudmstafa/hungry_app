import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';

class TrueIconSuccessView extends StatelessWidget {
  const TrueIconSuccessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 24),
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
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
