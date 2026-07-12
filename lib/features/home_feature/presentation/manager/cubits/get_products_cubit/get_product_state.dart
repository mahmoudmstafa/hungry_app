part of 'get_product_cubit.dart';

@immutable
abstract class GetProductState {}

class GetProductInitial extends GetProductState {}

class GetProductsLoading extends GetProductState {}

class GetProductsSuccess extends GetProductState {
  final List<ProductEntity> products;
  final bool hasMore;
  final bool isFromCache;

  GetProductsSuccess({
    required this.products,
    required this.hasMore,
    this.isFromCache = false,
  });
}

class GetProductsLoadingMore extends GetProductState {
  final List<ProductEntity> products;
  GetProductsLoadingMore({required this.products});
}

class GetProductsPaginationError extends GetProductState {
  final List<ProductEntity> products;
  final String errMessage;
  GetProductsPaginationError({
    required this.products,
    required this.errMessage,
  });
}

class GetProductsFailure extends GetProductState {
  final String errMessage;
  GetProductsFailure({required this.errMessage});
}