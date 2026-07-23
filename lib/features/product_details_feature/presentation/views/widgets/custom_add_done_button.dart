import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class CustomAddDoneButton extends StatelessWidget {
  const CustomAddDoneButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(
        Icons.check_circle,
        color:
        AppColors.kPrimaryColor,
        size: 22,
      ),
    );
  }
}
