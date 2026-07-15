import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/custom_animation_loading_widget.dart';
import 'package:hungry_app/core/widgets/custom_circle_loading.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/_total_product_price_and_toppings_and_side_options_cubit.dart';
import '../../manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';
import 'custom_toppings_and_side_options_loading_widget.dart';
import 'editing_widget.dart';

class ToppingsListView extends StatelessWidget {
  const ToppingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetToppingsCubit, GetToppingsState>(
      builder: (context, state) {
        if (state is GetToppingsLoaded) {
          return SizedBox(
            height: 175,
            child: ListView.separated(
              padding: EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 15),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: state.toppings.length,
              itemBuilder: (BuildContext context, int index) {
                final totalCubit = context
                    .watch<TotalProductPriceAndToppingsAndSideOptionsCubit>();

                final isSelected = totalCubit.isSelectedTopping(
                  state.toppings[index].id,
                );
                return EditingWidget(
                  onTap: () {
                    totalCubit.toggleTopping(state.toppings[index]);
                  },
                  isSelected: isSelected,
                  title: state.toppings[index].name,
                  productImage: state.toppings[index].image,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
            ),
          );
        } else if (state is GetToppingsError) {
          return CustomErrorMessage(
            errMessage: state.message,
          );
        } else {
          return CustomToppingsAndSideOptionsLoadingWidget();
        }
      },
    );
  }
}
