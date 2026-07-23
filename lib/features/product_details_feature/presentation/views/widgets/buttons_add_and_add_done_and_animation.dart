import 'package:flutter/material.dart';

import 'custom_add_button.dart';
import 'custom_add_done_button.dart';

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
          ? const CustomAddDoneButton(
        key: ValueKey("done"),
      )
          : const CustomAddButton(
        key: ValueKey("add"),
      ),
    );
  }
}


