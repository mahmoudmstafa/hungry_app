import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_photos.dart';

import '../constants/app_colors.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
    required this.width,
    required this.height,
    this.onTap, this.photo,
  });

  final double width, height;

  final Function()? onTap;

  final String? photo ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: photo == null || photo!.isEmpty
                    ? AssetImage(AppPhotos.kProfilePhoto)
                    : NetworkImage(photo!) as ImageProvider,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.9),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.add,
                size: width * 0.18,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ProfilePhotoWidgetWithoutAdd extends StatelessWidget {
  const ProfilePhotoWidgetWithoutAdd({
    super.key,
    required this.width,
    required this.height,
    this.onTap, this.photo,
  });

  final double width, height;

  final Function()? onTap;

  final String? photo ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            image: photo == null || photo!.isEmpty
                ? AssetImage(AppPhotos.kProfilePhoto)
                : NetworkImage(photo!) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
