import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/toppings_list_view.dart';

import '../../../../../core/widgets/custom_error_message.dart';
import '../../manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';
import 'custom_toppings_and_side_options_loading_widget.dart';

class ToppingsListViewBlocBuilder extends StatelessWidget {
  const ToppingsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetToppingsCubit, GetToppingsState>(
      builder: (context, state) {
        if (state is GetToppingsLoaded) {
          return ToppingsListView(toppings: state.toppings);
        } else if (state is GetToppingsError) {
          return CustomErrorMessage(
            errMessage: state.message,
          );
        } else {
          return const CustomToppingsAndSideOptionsLoadingWidget();
        }
      },
    );
  }
}

