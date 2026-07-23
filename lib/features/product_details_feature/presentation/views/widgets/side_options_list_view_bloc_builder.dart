import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/widgets/custom_error_message.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/side_option_list_view.dart';

import '../../manger/cubits/get_side_options_cubit/get_side_options_cubit.dart';
import 'custom_toppings_and_side_options_loading_widget.dart';

class SideOptionListViewBlocBuilder extends StatelessWidget {
  const SideOptionListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSideOptionsCubit, GetSideOptionsState>(
      builder: (context, state) {
        if (state is GetSideOptionsLoaded) {
          return SideOptionListView(
            sideOptions: state.sideOptions,
          );
        } else if (state is GetSideOptionsError) {
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

