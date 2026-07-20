import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/service_locator.dart';
import 'features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:nested/nested.dart';

import 'features/cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'features/checkout_and_order_history_feature/presentation/manger/cubits/checkout_cubit.dart';
import 'features/favourite_feature/presentation/manager/cubits/favorite_cubit/favorite_cubit.dart';
import 'features/home_feature/presentation/manager/cubits/get_category_cubit/get_category_cubit.dart';
import 'features/home_feature/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers(),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splash,
      ),
    );
  }

  List<SingleChildWidget> providers() {
    return [
      BlocProvider<AuthCubit>(
        create: (_) => getIt<AuthCubit>(),
      ),
      BlocProvider<GetCategoryCubit>(
        create: (_) => getIt<GetCategoryCubit>()..fetchCategories(),
      ),
      BlocProvider<CartCubit>(
        create: (_) => getIt<CartCubit>(),
      ),
      BlocProvider<GetProductCubit>(
        create: (_) => getIt<GetProductCubit>()..getProducts(),
      ),
      BlocProvider<FavoriteCubit>(
        create: (_) => getIt<FavoriteCubit>(),
      ),
      BlocProvider<CheckoutCubit>(
        create: (_) => getIt<CheckoutCubit>(),
      ),
    ];
  }
}
