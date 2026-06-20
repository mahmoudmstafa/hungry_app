import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';


class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: BoxBorder.all(
          color: Colors.white,
          width: 1.5,
        ),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.assets.images.profileProfile.path,
          ),
        ),
      ),
    );
  }
}
