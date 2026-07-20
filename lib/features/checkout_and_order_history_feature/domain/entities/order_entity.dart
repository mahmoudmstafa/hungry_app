import '../../../cart_feature/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final String orderId;

  final String userId;

  final List<CartItemEntity> cartItems;

  final int itemsCount;

  final double totalPrice;

  final String paymentMethod;

  final DateTime orderDate;

  OrderEntity({
    required this.orderId,
    required this.userId,
    required this.cartItems,
    required this.itemsCount,
    required this.totalPrice,
    required this.paymentMethod,
    required this.orderDate,
  });
}