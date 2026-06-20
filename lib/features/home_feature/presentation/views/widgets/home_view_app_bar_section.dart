import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/text_field_home_view.dart';

import '../../../../../core/widgets/custom_text.dart';
import 'app_bar_home_view.dart';

class HomeViewAppBarSection extends StatelessWidget {
  const HomeViewAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: HomeHeaderDelegate(),
    );
  }
}

class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => kTopSpace + 195;

  @override
  double get maxExtent => kTopSpace + 195;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: shrinkOffset > 0
            ? [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Colors.black12,
          ),
        ]
            : [],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(kTopSpace),
                AppBarHomeView(),
                CustomText(
                  text: 'Hello Mahmoud Mostafa',
                  fontSize: 17,
                ),
                Gap(15),
              ],
            ),
          ),
          TextFieldHomeView(),
          Gap(30),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
