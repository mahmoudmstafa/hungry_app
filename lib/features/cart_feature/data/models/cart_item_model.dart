import 'package:hive_ce/hive.dart';

import '../../../product_details_feature/data/models/side_options_model.dart';
import '../../../product_details_feature/data/models/toppings_model.dart';
import '../../domain/entities/cart_item_entity.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 5)
class CartItemModel extends HiveObject implements CartItemEntity {
  @override
  @HiveField(0)
  final String userId;

  @override
  @HiveField(1)
  final String productId;

  @override
  @HiveField(2)
  final String name;

  @override
  @HiveField(3)
  final String image;

  @override
  @HiveField(4)
  final double basePrice;

  @override
  @HiveField(5)
  final List<ToppingModel> toppings;

  @override
  @HiveField(6)
  final List<SideOptionsModel> sideOptions;

  @override
  @HiveField(7)
  final double totalPrice;

  @override
  @HiveField(8)
  int quantity;
  CartItemModel({
    required this.userId,
    required this.productId,
    required this.name,
    required this.image,
    required this.basePrice,
    required this.toppings,
    required this.sideOptions,
    required this.totalPrice,
    required this.quantity,
  });

  factory CartItemModel.fromEntity(CartItemEntity entity  ) {
    return CartItemModel(
      userId: entity.userId,
      productId: entity.productId,
      name: entity.name,
      image: entity.image,
      basePrice: entity.basePrice,
      toppings: entity.toppings,
      sideOptions: entity.sideOptions,
      totalPrice: entity.totalPrice,
      quantity: entity.quantity,
    );
  }
}