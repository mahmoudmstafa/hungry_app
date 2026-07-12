import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/text_field_home_view.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'app_bar_home_view.dart';

class HomeViewAppBarAndSearchSection extends StatelessWidget {
  const HomeViewAppBarAndSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = context.read<AuthCubit>().user;

        return SliverPersistentHeader(
          pinned: true,
          delegate: HomeHeaderDelegate(
            user: user,
          ),
        );
      },
    );
  }
}

class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final UserEntity user;

  HomeHeaderDelegate({
    required this.user,
  });

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
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(kTopSpace),
                AppBarHomeView(),
                CustomText(
                  text: 'Hello ${user.name}',
                  fontSize: 17,
                ),
                Gap(15),
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