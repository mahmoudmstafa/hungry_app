
  import 'package:flutter/material.dart';

  import '../../features/home_feature/domain/entities/category_entity.dart';
  import '../../features/home_feature/presentation/views/widgets/acitve_and_inactive_menu.dart';



  class MenuButtonsListView extends StatelessWidget {
    const MenuButtonsListView({
      super.key,
      required this.allCategories,
      required this.activeIndex,
      required this.onCategoryTap,
    });

    final List<CategoryEntity> allCategories;
    final int activeIndex;
    final void Function(int index) onCategoryTap;

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 50,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: allCategories.length,
          itemBuilder: (context, index) {
            final selectedCategory = allCategories[index];

            return GestureDetector(
              onTap: () {
                onCategoryTap(index);
              },
              child: ActiveAndInActiveButtonMenu(
                categoryEntity: selectedCategory,
                isActive: index == activeIndex,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 8,
            );
          },
        ),
      );
    }
  }