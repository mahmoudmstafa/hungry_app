import 'package:hive_ce/hive.dart';

import '../../../cart_feature/data/models/cart_item_model.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.g.dart';
@HiveType(typeId: 10)
class OrderModel extends HiveObject implements OrderEntity {
  @override
  @HiveField(0)
  final String orderId;

  @override
  @HiveField(1)
  final String userId;

  @override
  @HiveField(2)
  final List<CartItemModel> cartItems;

  @override
  @HiveField(3)
  final int itemsCount;

  @override
  @HiveField(4)
  final double totalPrice;

  @override
  @HiveField(5)
  final String paymentMethod;

  @override
  @HiveField(6)
  final DateTime orderDate;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.cartItems,
    required this.itemsCount,
    required this.totalPrice,
    required this.paymentMethod,
    required this.orderDate,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      orderId: entity.orderId,
      userId: entity.userId,
      cartItems: entity.cartItems
          .map((e) => CartItemModel.fromEntity(e))
          .toList(),
      itemsCount: entity.itemsCount,
      totalPrice: entity.totalPrice,
      paymentMethod: entity.paymentMethod,
      orderDate: entity.orderDate,
    );
  }
}