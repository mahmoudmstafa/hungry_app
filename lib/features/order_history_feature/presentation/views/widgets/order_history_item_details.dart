import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';



class OrderHistoryItemDetails extends StatelessWidget {
  const OrderHistoryItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
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
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  overflow: TextOverflow.ellipsis,
                  text: 'Hamburger Hamburger',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: 0xff3C2F2F,
                ),
                CustomText(
                  text: "Qty : x3",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: 0xff3C2F2F,
                ),
                CustomText(
                  text: 'Price : 20\$',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,

                  color: 0xff3C2F2F,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
