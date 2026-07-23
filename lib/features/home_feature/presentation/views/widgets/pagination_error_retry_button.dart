import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/get_products_cubit/get_product_cubit.dart';

class PaginationErrorRetryButton extends StatelessWidget {
  const PaginationErrorRetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: TextButton(
          onPressed: () {
            context.read<GetProductCubit>().loadNextPage();
          },
          child: const Text('Failed to load more. Tap to retry'),
        ),
      ),
    );
  }
}