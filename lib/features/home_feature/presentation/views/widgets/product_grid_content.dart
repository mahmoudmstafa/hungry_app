import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spaces.dart';
import '../../../domain/entities/product_entity.dart';
import 'food_card_grid_view.dart';
import 'loading_more_indicator.dart';
import 'pagination_error_retry_button.dart';

class ProductGridContent extends StatelessWidget {
  const ProductGridContent({
    super.key,
    required this.products,
    this.isLoadingMore = false,
    this.didPaginationFail = false,
  });

  final List<ProductEntity> products;
  final bool isLoadingMore;
  final bool didPaginationFail;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        if (isLoadingMore) const LoadingMoreIndicator(),
        if (didPaginationFail) const PaginationErrorRetryButton(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpaces.kPadding,
          ),
          sliver: FoodCardGridView(products: products),
        ),
      ],
    );
  }
}