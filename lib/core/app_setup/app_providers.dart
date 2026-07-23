
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nested/nested.dart';

import '../../features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import '../../features/cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../features/checkout_and_order_history_feature/presentation/manger/cubits/checkout_cubit.dart';
import '../../features/favourite_feature/presentation/manager/cubits/favorite_cubit/favorite_cubit.dart';
import '../../features/home_feature/domain/entities/product_entity.dart';
import '../../features/home_feature/presentation/manager/cubits/get_category_cubit/get_category_cubit.dart';
import '../../features/home_feature/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import '../../features/product_details_feature/presentation/manger/cubits/ total_product_price_and_toppings_and_side_options/total_product_price_and_toppings_and_side_options_cubit.dart';
import '../../features/product_details_feature/presentation/manger/cubits/get_side_options_cubit/get_side_options_cubit.dart';
import '../../features/product_details_feature/presentation/manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';
import 'app_service_locator.dart';


abstract class AppProviders {


  // hungry app providers (to all app)
  static List<SingleChildWidget> hungryAppProviders() {
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

  static List<SingleChildWidget> productDetailsProviders() {
    final product = Get.arguments as ProductEntity;

    return [
      BlocProvider<GetToppingsCubit>(
        create: (_) => getIt<GetToppingsCubit>()..getToppings(),
      ),
      BlocProvider<GetSideOptionsCubit>(
        create: (_) => getIt<GetSideOptionsCubit>()..getSideOptions(),
      ),
      BlocProvider(
        create: (_) => TotalProductPriceAndToppingsAndSideOptionsCubit(
          productPrice: product.price.toDouble(),
        ),
      ),
    ];
  }

}
