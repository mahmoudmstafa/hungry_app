import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class ShoppingCartItemDetails extends StatelessWidget {
  const ShoppingCartItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(5),
        SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 5,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: SvgPicture.asset(
                    Assets.assets.images.shadow.path,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Image.asset(
                  Assets.assets.images.hamburger.path,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Hamburger',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: 0xff3C2F2F,
            ),
            CustomText(
              text: "Veggie Burger",
              fontSize: 14,
              color: 0xff3C2F2F,
            ),
          ],
        ),
        const Gap(15),
      ],
    );
  }
}
