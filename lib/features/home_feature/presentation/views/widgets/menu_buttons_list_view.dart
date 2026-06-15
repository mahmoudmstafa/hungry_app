import 'package:flutter/material.dart';

import 'acitve_and_inactive_menu.dart';


class MenuButtonsListView extends StatefulWidget {
  const MenuButtonsListView({super.key});

  @override
  State<MenuButtonsListView> createState() => _MenuButtonsListViewState();
}

class _MenuButtonsListViewState extends State<MenuButtonsListView> {
  List<String> menuList = const [
    'All',
    'Combos',
    'Sliders',
    'Classic',
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            child: ActiveAndInActiveButtonMenu(
              text: menuList[index],
              isActive: index == activeIndex,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
