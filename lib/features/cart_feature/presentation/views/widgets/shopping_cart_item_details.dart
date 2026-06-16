import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

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
        Gap(5),
        Image.asset(
          Assets.assets.images.hamburger.path,

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
        Gap(15),
      ],
    );
  }
}
