import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/widgets/custom_error_message.dart';

import '../../manger/cubits/ total_product_price_and_toppings_and_side_options/_total_product_price_and_toppings_and_side_options_cubit.dart';
import '../../manger/cubits/get_side_options_cubit/get_side_options_cubit.dart';
import '../../manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';
import 'custom_toppings_and_side_options_loading_widget.dart';
import 'editing_widget.dart';

class SideOptionListView extends StatelessWidget {
  const SideOptionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetSideOptionsCubit,
      GetSideOptionsState
    >(
      builder: (context, state) {
        if (state is GetSideOptionsLoaded) {
          return SizedBox(
            height: 175,
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: 8,
                left: 20,
                right: 20,
                bottom: 15,
              ),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: state.sideOptions.length,
              itemBuilder: (BuildContext context, int index) {
                final totalCubit =
                context.watch<TotalProductPriceAndToppingsAndSideOptionsCubit>();

                final isSelected =
                totalCubit.isSelectedSideOption(state.sideOptions[index].id);

                return EditingWidget(
                  onTap: () {
                    totalCubit.toggleSideOption(state.sideOptions[index]);
                  },
                  title: state.sideOptions[index].name,
                  productImage: state.sideOptions[index].image, isSelected: isSelected,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20,
                );
              },
            ),
          );
        } else if (state is GetSideOptionsError) {
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
