import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';


class EditingWidget extends StatelessWidget {
  const EditingWidget({
    super.key,
    this.isToppings = true,
  });

  final bool isToppings;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 100,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
              bottom: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Tomato',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: 0xFFFFFFFF,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isToppings ? Colors.red : Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            Assets.assets.images.fries.path,
          ),
        ),
      ],
    );
  }
}
