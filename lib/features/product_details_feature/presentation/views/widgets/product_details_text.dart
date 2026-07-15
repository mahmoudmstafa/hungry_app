import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';

class ProductDetailsText extends StatelessWidget {
  const ProductDetailsText({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(5),
        Text(
          title,
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        Gap(5),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kSecondaryColor.withOpacity(.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
