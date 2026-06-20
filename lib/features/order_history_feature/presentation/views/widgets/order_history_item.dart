import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_shadow_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../cart_feature/presentation/views/widgets/shopping_cart_item_details.dart';
import '../../../../cart_feature/presentation/views/widgets/shopping_cart_item_quantity_counter.dart';
import 'order_history_item_details.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomShadowWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              OrderHistoryItemDetails(),
              Gap(20),
              CustomButton(
                onTap: () {},
                height: 50,
                textFontSize: 16,
                text: 'Order Again',
                backgroundColor: Colors.grey.shade500,
                borderRadius: 16,
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

