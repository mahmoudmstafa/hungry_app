import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
