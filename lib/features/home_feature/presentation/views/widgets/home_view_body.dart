import 'package:flutter/material.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/search_and_menu_and_food_card_section.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/custom_bottom_bar.dart';
import 'home_view_app_bar_section.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeViewAppBarSection(),
                SearchAndMenuAndFoodCardSection(),
              ],
            ),
          ),
        ),
        CustomBottomBar(),
      ],
    );
  }
}
