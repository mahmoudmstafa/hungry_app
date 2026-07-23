


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import 'favourite_button.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    super.key, this.onPressedFavouriteButton, required this.isFavourite,
  });

  final bool isFavourite;
  final void Function()? onPressedFavouriteButton;
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  final double rating = 3.5 + Random().nextDouble() * 1.5; // بين 3.5 و 5.0

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Assets.assets.images.star.path,
            ),
            const Gap(5),
            CustomText(
              text: rating.toStringAsFixed(1),
              color: AppColors.kIntSecondaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        FavouriteButton(
          onPressedFavouriteButton: widget.onPressedFavouriteButton,
          isFavourite: widget.isFavourite,
        ),
      ],
    );
  }
}


