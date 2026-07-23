import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spaces.dart';
import '../../../domain/entities/product_entity.dart';
import 'empty_search_results_sliver.dart';
import 'food_card_grid_view.dart';

class SearchResultsSliver extends StatelessWidget {
  const SearchResultsSliver({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const EmptySearchResultsSliver();
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kPadding),
      sliver: FoodCardGridView(products: products),
    );
  }
}