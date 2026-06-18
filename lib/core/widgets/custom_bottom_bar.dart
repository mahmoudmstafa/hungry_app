import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constant.dart';
import '../../generated/assets.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final List<IconData> icons = [
    Icons.home,
    Icons.comment,
    Icons.local_restaurant_sharp,
    Icons.person,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return IconButton(
            constraints: const BoxConstraints(
              minWidth: 60,
              minHeight: 60,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            icon: Icon(
              icons[index],
              size: 28,
              color: selectedIndex == index ? Colors.white : Colors.grey,
            ),
          );
        }),
      ),
    );
  }
}
