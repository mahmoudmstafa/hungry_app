


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import 'favourite_button.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    super.key,
  });

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  final double rating = 3.5 + Random().nextDouble() * 1.5; // بين 3.5 و 5.0

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 10, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.assets.images.star.path,
              ),
              Gap(5),
              CustomText(
                text: rating.toStringAsFixed(1),
                color: kIntSecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          FavouriteButton(),
        ],
      ),
    );
  }
}
