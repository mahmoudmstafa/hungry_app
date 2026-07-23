import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'buttons_add_and_add_done_and_animation.dart';



class EditingWidget extends StatelessWidget {
  const EditingWidget({
    super.key,
    required this.title,
    required this.productImage, required this.isSelected, this.onTap,
  });
  final bool isSelected ;
  final String title, productImage;
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 90,
            child: CustomCachedNetworkImage(
              width: double.infinity,
              colorCircleIndicator: AppColors.kSecondaryColor,
              imageUrl: productImage,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
              textAlign: TextAlign.center,
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: 0xFFFFFFFF,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(5),
          GestureDetector(
            onTap: onTap ,
            child: AnimationAddAndAddDoneButtons(
              isSelected: isSelected,
            ),
          ),
        ],
      ),
    );
  }
}
