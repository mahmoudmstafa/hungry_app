part of 'total_product_price_and_toppings_and_side_options_cubit.dart';

@immutable
sealed class TotalProductPriceAndToppingsAndSideOptionsState {}

final class TotalProductPriceAndToppingsAndSideOptionsInitial
    extends TotalProductPriceAndToppingsAndSideOptionsState {}

final class ProductDetailsChanged
    extends TotalProductPriceAndToppingsAndSideOptionsState {
  final double totalPrice;

  final List<ToppingModel> selectedToppings;

  final List<SideOptionsModel> selectedSideOptions;

  ProductDetailsChanged({
    required this.totalPrice,
    required this.selectedToppings,
    required this.selectedSideOptions,
  });
}