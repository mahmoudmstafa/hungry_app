import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_spaces.dart';
import 'food_card_grid_view_bloc_builder.dart';
import 'menu_buttons_list_view_bloc_builder.dart';

class DefaultMenuSlivers extends StatelessWidget {
  const DefaultMenuSlivers({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpaces.kPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                MenuButtonsListViewBlocBuilder(),
                Gap(20),
              ],
            ),
          ),
        ),
        FoodCardGridViewBlocBuilder(),
      ],
    );
  }
}