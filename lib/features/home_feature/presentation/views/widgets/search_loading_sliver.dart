import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/loading_food_card_grid_view_widget.dart';

class SearchLoadingSliver extends StatelessWidget {
  const SearchLoadingSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppSpaces.kPadding),
      sliver: SliverToBoxAdapter(
        child: LoadingFoodCardGridViewWidget(),
      ),
    );
  }
}