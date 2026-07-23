import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_animation_loading_widget.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_text.dart';


class CustomToppingsAndSideOptionsLoadingWidget extends StatelessWidget {
  const CustomToppingsAndSideOptionsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationLoadingWidget(
      child: SizedBox(
        height: 175,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 15),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 100,
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
                      imageUrl: '',
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
                  const CustomText(
                    text: 'Loading ...',
                    color: 0xFFFF1744,
                  ),
                  const Gap(5),
                  Container(
                    margin: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
