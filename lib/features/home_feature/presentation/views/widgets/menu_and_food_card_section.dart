import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/search_products_cubit/search_products_cubit.dart';
import 'default_menu_slivers.dart';
import 'search_error_sliver.dart';
import 'search_loading_sliver.dart';
import 'search_results_sliver.dart';

class MenuAndFoodCardSection extends StatelessWidget {
  const MenuAndFoodCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, searchState) {
        if (searchState is SearchProductsInitial) {
          return const DefaultMenuSlivers();
        }

        if (searchState is SearchProductsLoading) {
          return const SearchLoadingSliver();
        }

        if (searchState is SearchProductsFailure) {
          return SearchErrorSliver(errMessage: searchState.errMessage);
        }

        if (searchState is SearchProductsSuccess) {
          return SearchResultsSliver(products: searchState.products);
        }

        return const SliverToBoxAdapter(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}