import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/side_options_model.dart';
import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/total_product_price_and_toppings_and_side_options_cubit.dart';
import 'editing_widget.dart';


class SideOptionListView extends StatelessWidget {
  const SideOptionListView({
    super.key,
    required this.sideOptions,
  });

  final List<SideOptionsModel> sideOptions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.separated(
        padding: const EdgeInsets.only(
          top: 8,
          left: 20,
          right: 20,
          bottom: 15,
        ),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: sideOptions.length,
        itemBuilder: (BuildContext context, int index) {
          final totalCubit = context
              .watch<TotalProductPriceAndToppingsAndSideOptionsCubit>();

          final isSelected = totalCubit.isSelectedSideOption(
            sideOptions[index].id,
          );

          return EditingWidget(
            onTap: () {
              totalCubit.toggleSideOption(sideOptions[index]);
            },
            title: sideOptions[index].name,
            productImage: sideOptions[index].image,
            isSelected: isSelected,
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
