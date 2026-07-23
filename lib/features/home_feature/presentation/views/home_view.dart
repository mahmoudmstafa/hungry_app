import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/widgets/custom_scaffold.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/home_view_body.dart';

import '../../../../core/app_setup/app_service_locator.dart';

import '../manager/cubits/search_products_cubit/search_products_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      child: BlocProvider<SearchProductsCubit>(
       create: (BuildContext context) => getIt<SearchProductsCubit>(),
        child: const HomeViewBody(),
      ),
    );
  }
}
