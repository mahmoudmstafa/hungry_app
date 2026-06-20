import 'package:flutter/material.dart';

import 'food_card.dart';



class FoodCardGridView extends StatelessWidget {
  const FoodCardGridView({super.key, });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 5,bottom: 20),
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
        childAspectRatio: .67,
      ),
      itemBuilder: (context, index) {
        return FoodCard();
      },
    );
  }
}
