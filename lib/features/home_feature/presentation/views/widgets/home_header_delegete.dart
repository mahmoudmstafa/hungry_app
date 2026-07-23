import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/text_field_home_view.dart';

import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../aut_feature/domain/entities/user_entity.dart';
import 'app_bar_home_view.dart';



class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final UserEntity user;

  HomeHeaderDelegate({
    required this.user,
  });

  @override
  double get minExtent => AppSpaces.kTopSpace + 195;

  @override
  double get maxExtent => AppSpaces.kTopSpace + 195;

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
            ? const [
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
            padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(AppSpaces.kTopSpace),
                const AppBarHomeView(),
                CustomText(
                  text: 'Hello ${user.name}',
                  fontSize: 17,
                ),
                const Gap(15),
              ],
            ),
          ),
          const TextFieldHomeView(),
          const Gap(30),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant HomeHeaderDelegate oldDelegate) {
    return oldDelegate.user.name != user.name ||
        oldDelegate.user.photo != user.photo;
  }
}
