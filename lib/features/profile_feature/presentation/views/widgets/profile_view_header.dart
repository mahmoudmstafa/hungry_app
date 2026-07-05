import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/profile_photo_widget.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/bottom_curve_clipper.dart';
import '../../../../../core/widgets/custom_back_button.dart';



class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        color: kPrimaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomBackButton(
                settings: true,
                colorOfBackIcon: Colors.white,
              ),
            ),
            Gap(10),
            ProfilePhotoWidget(
              width: 120,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
