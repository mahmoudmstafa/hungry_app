import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../home_feature/domain/entities/product_entity.dart';
import '../manger/cubits/ total_product_price_and_toppings_and_side_options/_total_product_price_and_toppings_and_side_options_cubit.dart';
import '../manger/cubits/get_side_options_cubit/get_side_options_cubit.dart';
import '../manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';
import 'package:nested/nested.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  static const String id = 'ProductDetails';

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final product = Get.arguments as ProductEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: providers(),
        child: ProductDetailsViewBody(),
      ),
    );
  }

  List<SingleChildWidget> providers() {
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
