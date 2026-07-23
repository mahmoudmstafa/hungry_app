import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../features/home_feature/presentation/views/widgets/rating_widget.dart';
import '../constants/app_colors.dart';
import 'custom_animation_loading_widget.dart';
import 'custom_cached_network_image.dart';
import 'custom_text.dart';

class LoadingFoodCardGridViewWidget extends StatelessWidget {
  const LoadingFoodCardGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimationLoadingWidget(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 5, bottom: 20),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
          childAspectRatio: .66,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
              children: [
                CustomCachedNetworkImage(
                  height: 120,
                  width: double.infinity,
                  colorCircleIndicator: AppColors.kSecondaryColor,
                  imageUrl: '',
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kSecondaryColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: '',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: 0xff3C2F2F,
                          ),
                          CustomText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: '',
                            fontSize: 16,
                            color: 0xff3C2F2F,
                          ),
                        ],
                      ),
                    ),
                    CustomAnimationLoadingWidget(
                      child: RatingWidget(
                        isFavourite: false,
                        onPressedFavouriteButton: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
