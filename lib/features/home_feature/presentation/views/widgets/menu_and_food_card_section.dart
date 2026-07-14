import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/custom_error_message.dart';
import 'package:hungry_app/features/home_feature/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/text_field_home_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_circle_loading.dart';
import '../../../../../core/widgets/loading_food_card_grid_view_widget.dart';
import '../../manager/cubits/search_products_cubit/search_products_cubit.dart';
import 'food_card_grid_view.dart';
import 'food_card_grid_view_bloc_builder.dart';
import 'menu_buttons_list_view_bloc_builder.dart';

class MenuAndFoodCardSection extends StatelessWidget {
  const MenuAndFoodCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, searchState) {
        // الحالة الأولى: اليوزر لسه مكتبش حاجة في السيرش
        // في الحالة دي، نعرض الوضع الطبيعي: الكاتيجوريز + المنتجات مع الـ Pagination
        if (searchState is SearchProductsInitial) {
          return SliverMainAxisGroup(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
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

        // الحالة الثانية: البحث شغال وبيحمل النتايج
        if (searchState is SearchProductsLoading) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            sliver: SliverToBoxAdapter(
              child: LoadingFoodCardGridViewWidget(),
            ),
          );
        }

        // الحالة الثالثة: حصل خطأ أثناء البحث
        if (searchState is SearchProductsFailure) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomErrorMessage(
                  errMessage: searchState.errMessage,
                ),
              ),
            ),
          );
        }

        // الحالة الرابعة: البحث نجح ورجع نتايج
        if (searchState is SearchProductsSuccess) {
          final searchResults = searchState.products;

          if (searchResults.isEmpty) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              sliver: const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text('No products found'),
                  ),
                ),
              ),
            );
          }

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            sliver: FoodCardGridView(products: searchResults),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}