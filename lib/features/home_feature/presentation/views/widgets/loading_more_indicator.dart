import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

import '../../../../../core/widgets/custom_circle_loading.dart';

class LoadingMoreIndicator extends StatelessWidget {
  const LoadingMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: const Center(
          child: CustomCircleLoading(
            color: AppColors.kSecondaryColor,
            height: 35,
            width: 35,
          ),
        ),
      ),
    );
  }
}