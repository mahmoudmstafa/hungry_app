import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/toppings_model.dart';
import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/total_product_price_and_toppings_and_side_options_cubit.dart';
import 'editing_widget.dart';

class ToppingsListView extends StatelessWidget {
  const ToppingsListView({
    super.key,
    required this.toppings,
  });

  final List<ToppingModel> toppings;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 15),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: toppings.length,
        itemBuilder: (BuildContext context, int index) {
          final totalCubit = context
              .watch<TotalProductPriceAndToppingsAndSideOptionsCubit>();

          final isSelected = totalCubit.isSelectedTopping(
            toppings[index].id,
          );
          return EditingWidget(
            onTap: () {
              totalCubit.toggleTopping(toppings[index]);
            },
            isSelected: isSelected,
            title: toppings[index].name,
            productImage: toppings[index].image,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
