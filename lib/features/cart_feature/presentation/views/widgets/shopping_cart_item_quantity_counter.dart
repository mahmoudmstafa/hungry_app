import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';
import 'custom_add_or_remove_widget.dart';

class ShoppingCartItemQuantityCounter extends StatefulWidget {
  const ShoppingCartItemQuantityCounter({
    super.key,
    this.onTap,
  });

  final GestureTapCallback? onTap;

  @override
  State<ShoppingCartItemQuantityCounter> createState() =>
      _ShoppingCartItemQuantityCounterState();
}

class _ShoppingCartItemQuantityCounterState
    extends State<ShoppingCartItemQuantityCounter> {
  int orderNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0 , top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAddOrRemoveWidget(
                onTap: ()
                {
                  if (orderNumber > 1) {
                    setState(() {
                      orderNumber--;
                    });
                  }
                },
                icon: Icons.remove,
              ),
              CustomText(
                text: '$orderNumber',
                color: kIntSecondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              CustomAddOrRemoveWidget(
                onTap: ()
                {
                  setState(() {
                    orderNumber++;
                  });
                },
                icon: Icons.add,
              ),
            ],
          ),
          Gap(35),
          CustomButton(
            onTap: () {},
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
