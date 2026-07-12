import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/widgets/custom_scaffold.dart';
import 'package:hungry_app/features/home_feature/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:hungry_app/features/home_feature/presentation/manager/cubits/get_category_cubit/get_category_cubit.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/home_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:nested/nested.dart';

import '../manager/cubits/search_products_cubit/search_products_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      child: MultiBlocProvider(
        providers: providers(),
        child: HomeViewBody(),
      ),
    );
  }

  List<SingleChildWidget> providers() {
    return [
      BlocProvider<GetProductCubit>(
        create: (_) => getIt<GetProductCubit>()..getProducts(),
      ),
      BlocProvider<GetCategoryCubit>(
        create: (_) => getIt<GetCategoryCubit>()..fetchCategories(),
      ),
      BlocProvider<SearchProductsCubit>(
        create: (_) => getIt<SearchProductsCubit>(),
      ),
    ];
  }
}
