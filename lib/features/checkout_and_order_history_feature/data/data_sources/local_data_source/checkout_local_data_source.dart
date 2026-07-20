import '../../models/order_model.dart';

abstract class CheckoutLocalDataSource {
  Future<void> placeOrder(OrderModel order);

  List<OrderModel> getOrders(String userId);
  Future<void> clearCart(String userId);
}