import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/home_feature/presentation/manager/cubits/get_category_cubit/get_category_cubit.dart';

import '../../../../../core/widgets/custom_animation_loading_widget.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circle_loading.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/loading_categories_widget.dart';
import '../../../../../core/widgets/menu_buttons_list_view.dart';
import '../../../domain/entities/category_entity.dart';
import '../../manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'acitve_and_inactive_menu.dart';

class MenuButtonsListViewBlocBuilder extends StatefulWidget {
  const MenuButtonsListViewBlocBuilder({super.key});

  @override
  State<MenuButtonsListViewBlocBuilder> createState() =>
      _MenuButtonsListViewBlocBuilderState();
}

class _MenuButtonsListViewBlocBuilderState
    extends State<MenuButtonsListViewBlocBuilder> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      builder: (context, state) {
        if (state is GetCategoryError) {
          return CustomErrorMessage(errMessage: state.message);
        }
        else if (state is GetCategoryLoaded) {
          final allCategories = [
            CategoryEntity(id: 'all', name: 'All', image: ''),
            ...state.categories,
          ];
          return MenuButtonsListView(
            allCategories: allCategories,
            activeIndex: activeIndex,
            onCategoryTap: (int index) {
              setState(() {
                activeIndex = index;
              });
            },
          );
        } else {
          return LoadingCategoriesWidget();
        }
      },
    );
  }
}
