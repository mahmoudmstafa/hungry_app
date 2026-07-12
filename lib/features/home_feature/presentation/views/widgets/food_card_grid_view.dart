import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';
import 'food_card.dart';



class FoodCardGridView extends StatelessWidget {
  const FoodCardGridView({super.key, required this.products, });

  final List<ProductEntity> products ;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 5,bottom: 20),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
        childAspectRatio: .66,
      ),
      itemBuilder: (context, index) {
        return FoodCard(
          products: products[index],
        );
      },
    );
  }
}
