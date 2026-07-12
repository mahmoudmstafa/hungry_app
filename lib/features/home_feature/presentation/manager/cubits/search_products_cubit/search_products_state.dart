part of 'search_products_cubit.dart';

@immutable
sealed class SearchProductsState {}

final class SearchProductsInitial extends SearchProductsState {}
final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final List<ProductEntity> products;

  SearchProductsSuccess({required this.products});
}

final class SearchProductsFailure extends SearchProductsState {
  final String errMessage;

  SearchProductsFailure({required this.errMessage});
}