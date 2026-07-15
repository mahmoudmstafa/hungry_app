import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
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
          padding: EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 15),
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                color: kSecondaryColor,
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
                      colorCircleIndicator: kSecondaryColor,
                      imageUrl: '',
                      borderRadius: BorderRadius.only(
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
                  Gap(10),
                  CustomText(
                    text: 'Loading ...',
                    color: 0xFFFF1744,
                  ),
                  Gap(5),
                  Container(
                    margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
                    width: double.infinity,
                    decoration: BoxDecoration(
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
            return SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
