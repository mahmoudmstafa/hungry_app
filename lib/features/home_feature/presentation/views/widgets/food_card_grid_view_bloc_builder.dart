import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

import '../../manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'product_grid_content.dart';
import 'product_grid_error_sliver.dart';
import 'product_grid_loading_sliver.dart';

class FoodCardGridViewBlocBuilder extends StatefulWidget {
  const FoodCardGridViewBlocBuilder({super.key});

  @override
  State<FoodCardGridViewBlocBuilder> createState() =>
      _FoodCardGridViewBlocBuilderState();
}

class _FoodCardGridViewBlocBuilderState
    extends State<FoodCardGridViewBlocBuilder> {
  final Set<String> alreadyCachedImageUrls = {};

  @override
  void initState() {
    super.initState();
    _loadProductsIfNeeded();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheProductImages();
  }

  void _loadProductsIfNeeded() {
    final cubit = context.read<GetProductCubit>();
    if (cubit.products.isEmpty) {
      cubit.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        if (state is GetProductsLoading || state is GetProductInitial) {
          return const ProductGridLoadingSliver();
        }

        if (state is GetProductsFailure) {
          return ProductGridErrorSliver(errMessage: state.errMessage);
        }

        return ProductGridContent(
          products: _productsFromState(state),
          isLoadingMore: state is GetProductsLoadingMore,
          didPaginationFail: state is GetProductsPaginationError,
        );
      },
    );
  }

  List<ProductEntity> _productsFromState(GetProductState state) {
    if (state is GetProductsSuccess) return state.products;
    if (state is GetProductsLoadingMore) return state.products;
    if (state is GetProductsPaginationError) return state.products;
    return [];
  }

  void _precacheProductImages() {
    final cubit = context.read<GetProductCubit>();

    for (final product in cubit.products) {
      _precacheProductImage(product.productImage);
    }
  }

  void _precacheProductImage(String imageUrl) {
    if (alreadyCachedImageUrls.contains(imageUrl)) {
      return;
    }

    alreadyCachedImageUrls.add(imageUrl);

    precacheImage(
      ResizeImage(
        CachedNetworkImageProvider(imageUrl),
        width: 400,
      ),
      context,
    );
  }
}