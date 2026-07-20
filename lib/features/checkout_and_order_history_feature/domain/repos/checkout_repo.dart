import '../entities/order_entity.dart';

abstract class CheckoutRepo {
  Future<void> placeOrder(OrderEntity order);

  List<OrderEntity> getOrders(String userId);
  Future<void> clearCart(String userId);
}