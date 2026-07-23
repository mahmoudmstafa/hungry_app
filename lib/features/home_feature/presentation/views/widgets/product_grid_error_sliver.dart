import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_error_message.dart';

class ProductGridErrorSliver extends StatelessWidget {
  const ProductGridErrorSliver({
    super.key,
    required this.errMessage,
  });

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kPadding),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: CustomErrorMessage(
            errMessage: errMessage,
          ),
        ),
      ),
    );
  }
}