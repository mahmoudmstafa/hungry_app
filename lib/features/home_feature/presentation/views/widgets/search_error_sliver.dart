import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/custom_error_message.dart';

import '../../../../../core/constants/app_spaces.dart';

class SearchErrorSliver extends StatelessWidget {
  const SearchErrorSliver({
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