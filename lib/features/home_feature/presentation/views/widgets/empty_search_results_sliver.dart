import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spaces.dart';

class EmptySearchResultsSliver extends StatelessWidget {
  const EmptySearchResultsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpaces.kPadding,
      ),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: Text('No products found'),
          ),
        ),
      ),
    );
  }
}