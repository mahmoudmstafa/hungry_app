import '../../../product_details_feature/data/models/side_options_model.dart';
import '../../../product_details_feature/data/models/toppings_model.dart';

class CartItemEntity {
  final String productId;

  final String name;

  final String image;

  final double basePrice;

  final List<ToppingModel> toppings;

  final List<SideOptionsModel> sideOptions;

  final double totalPrice;

  int quantity;
  final String userId;
   CartItemEntity({
    required this.userId,
    required this.productId,
    required this.name,
    required this.image,
    required this.basePrice,
    required this.toppings,
    required this.sideOptions,
    required this.totalPrice,
    this.quantity = 1,
  });
}