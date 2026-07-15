import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
class AnimationAddAndAddDoneButtons extends StatelessWidget {
  const AnimationAddAndAddDoneButtons({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: isSelected
          ? const CustomAddDoneButtonSection(
        key: ValueKey("done"),
      )
          : const CustomAddButtonSection(
        key: ValueKey("add"),
      ),
    );
  }
}

class CustomAddButtonSection extends StatelessWidget {
  const CustomAddButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),

      margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.redAccent,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

class CustomAddDoneButtonSection extends StatelessWidget {
  const CustomAddDoneButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(
        Icons.check_circle,
        color: kPrimaryColor,
        size: 22,
      ),
    );
  }
}
