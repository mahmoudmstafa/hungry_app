import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<String> icons = [
    Assets.assets.images.home.path,
    Assets.assets.images.comment.path,
    Assets.assets.images.user.path,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: SvgPicture.asset(
              icons[index],
              colorFilter: ColorFilter.mode(
                selectedIndex == index ? Colors.grey : Colors.white,
                BlendMode.srcIn,
              ),
            ),
          );
        }),
      ),
    );
  }
}
