import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';



class ProductDetailsText extends StatelessWidget {
  const ProductDetailsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      TextSpan(
        children: [
          TextSpan(
            text: 'Customize  ',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text:
            'Your Burger to Your Tastes. Ultimate Experience',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
