import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/side_options_model.dart';
import '../../../../data/models/toppings_model.dart';

part '_total_product_price_and_toppings_and_side_options_state.dart';

class TotalProductPriceAndToppingsAndSideOptionsCubit
    extends Cubit<TotalProductPriceAndToppingsAndSideOptionsState> {
  TotalProductPriceAndToppingsAndSideOptionsCubit({
    required double productPrice,
  })  : _productPrice = productPrice,
        totalPrice = productPrice,
        super(
        ProductDetailsChanged(
          totalPrice: productPrice,
          selectedToppings: const [],
          selectedSideOptions: const [],
        ),
      );

  final double _productPrice;

  double totalPrice;

  final List<ToppingModel> selectedToppings = [];

  final List<SideOptionsModel> selectedSideOptions = [];

  bool isSelectedTopping(String id) {
    return selectedToppings.any((e) => e.id == id);
  }

  bool isSelectedSideOption(String id) {
    return selectedSideOptions.any((e) => e.id == id);
  }

  void toggleTopping(ToppingModel topping) {
    if (isSelectedTopping(topping.id)) {
      selectedToppings.removeWhere((e) => e.id == topping.id);
    } else {
      selectedToppings.add(topping);
    }

    _calculateTotal();
  }

  void toggleSideOption(SideOptionsModel sideOption) {
    if (isSelectedSideOption(sideOption.id)) {
      selectedSideOptions.removeWhere((e) => e.id == sideOption.id);
    } else {
      selectedSideOptions.add(sideOption);
    }

    _calculateTotal();
  }

  void _calculateTotal() {
    totalPrice = _productPrice;

    for (final topping in selectedToppings) {
      totalPrice += topping.price;
    }

    for (final side in selectedSideOptions) {
      totalPrice += side.price;
    }

    emit(
      ProductDetailsChanged(
        totalPrice: totalPrice,
        selectedToppings: List.from(selectedToppings),
        selectedSideOptions: List.from(selectedSideOptions),
      ),
    );
  }
}