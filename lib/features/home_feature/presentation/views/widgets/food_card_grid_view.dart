import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';
import 'food_card.dart';

class FoodCardGridView extends StatelessWidget {
  const FoodCardGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
          childAspectRatio: .66,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return FoodCard(
              products: products[index],
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}