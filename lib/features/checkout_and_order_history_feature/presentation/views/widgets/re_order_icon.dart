import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class ReOrderIcon extends StatelessWidget {
  const ReOrderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 24),
      width: 65,
      height: 65,
      decoration: const BoxDecoration(
        color: AppColors.kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          '♻️',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
