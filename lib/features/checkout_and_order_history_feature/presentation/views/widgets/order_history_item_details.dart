import 'dart:developer';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/re_order_dialog_widget.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/root_controller.dart';
import '../../../../cart_feature/domain/entities/cart_item_entity.dart';
import '../../../../cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../../../profile_feature/presentation/views/widgets/bouncy_tap.dart';
import '../../../domain/entities/order_entity.dart';

class OrderHistoryItemDetails extends StatelessWidget {
  const OrderHistoryItemDetails({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    if (order.cartItems.isEmpty) {
      return const SizedBox();
    }

    final item = order.cartItems.first;
    return Row(
      children: [
        Expanded(
          child: CustomCachedNetworkImage(
            height: 150,
            width: double.infinity,
            colorCircleIndicator: kSecondaryColor,
            imageUrl: item.image,
            borderRadiusLoadingImage: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: kSecondaryColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(5),
                CustomText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  text: item.name,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: 0xff3C2F2F,
                ),
                Gap(5),
                Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomText(
                          text: "Qty : ${order.itemsCount}",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: 0xff3C2F2F,
                        ),
                      ),
                    ),
                    Gap(5),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: '\$ ${order.totalPrice.round()}',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: 0xFFFFFFFF,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                BouncyTap(
                  child: CustomButton(
                    onTap: () async {
                      final result = await _showAnimatedSuccessDialog(
                        context,
                        order: order,
                      );
                      if (result == true) {
                        Get.find<RootController>().changeTab(1); // 1 = Cart tab
                      }
                    },
                    height: 40,
                    textFontSize: 15,
                    text: 'Re Order',
                    backgroundColor: kPrimaryColor,
                    borderRadius: 16,
                  ),
                ),
                Gap(10),
                CustomText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  text: DateFormat('dd-MM-yyyy hh:mm a').format(order.orderDate),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: 0xff3C2F2F,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<bool?> _showAnimatedSuccessDialog(
    BuildContext context, {
    required OrderEntity order,
  }) {
    final cartCubit = context.read<CartCubit>();
    debugPrint(
      'Cart Count = ${cartCubit.cartItems.length}',
    );
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
          type: MaterialType.transparency,
          child: ReOrderDialogWidget(
            items: order.cartItems,
            hasItemsInCart: cartCubit.cartItems.isNotEmpty,
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
          reverseCurve: Curves.easeIn,
        );

        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.75, end: 1.0).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
