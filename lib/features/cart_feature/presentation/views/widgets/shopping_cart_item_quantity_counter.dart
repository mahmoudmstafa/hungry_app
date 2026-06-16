import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import 'custom_add_or_remove_widget.dart';

class ShoppingCartItemQuantityCounter extends StatelessWidget {
  const ShoppingCartItemQuantityCounter({
    super.key,
    this.onTap,
  });

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAddOrRemoveWidget(
                icon: Icons.remove,
              ),
              CustomText(
                text: '2',
                color: kIntSecondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              CustomAddOrRemoveWidget(
                icon: Icons.add,
              ),
            ],
          ),
          Gap( 35),
          CustomButton(
            height: 40,
            textFontSize: 14,
            text: 'Remove',
            backgroundColor: kPrimaryColor,
            borderRadius: 25,
          ),
        ],
      ),
    );
  }
}
