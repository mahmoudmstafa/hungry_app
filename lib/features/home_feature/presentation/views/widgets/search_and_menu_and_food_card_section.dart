import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/text_field_home_view.dart';

import 'food_card_grid_view.dart';
import 'menu_buttons_list_view.dart';


class SearchAndMenuAndFoodCardSection extends StatelessWidget {
  const SearchAndMenuAndFoodCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Gap(15),
          TextFieldHomeView(),
          Gap(30),
          MenuButtonsListView(),
          Gap(20),
          Expanded(
            child: FoodCardGridView(),
          ),
        ],
      ),
    );
  }
}
